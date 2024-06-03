//
//  CategroyViewmodel.swift
//  GiftHub
//
//  Created by 235 on 5/11/24.
//

import Vision
import VisionKit
import SwiftUI
import PhotosUI
import Alamofire

class CategoryViewModel: ObservableObject {
    @Published var expireOCRString: String = ""
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var isSucceed: Bool = false
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet{
            setImage(from: imageSelection)
        }
    }
    @Published var images: [ImageUrl] = []
    private var barcodeOCRString: String = ""
    var roomid: Int
//    var categoryId: Int
    init( roomid: Int) {
//        self.categoryId = categoryId
        self.roomid = roomid
    }
    func getDetailImages(category: Category) {
        AF.request(APICase.requestCategoryList(roomid: roomid, categoryId:category.id))
            .response {res in
                debugPrint(res)
            }
            .responseDecodable(of: GetImageResponse.self) { res in
                print(res)
//                self.images = res.value!.url
            }
    }
    func postImage(category: Category) {
        guard let selectedImage = selectedImage else {return}
        let imageData = selectedImage.jpegData(compressionQuality: 0.4)!
        let imageOCRDTO = ImageOcrDTO(expire: expireOCRString, barcode:barcodeOCRString)
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
            if let jsonData = try? JSONEncoder().encode(imageOCRDTO) {
                          multipartFormData.append(jsonData, withName: "imageOcrDTO", mimeType: "application/json")
                      }
        }, to: API.baseURL+"/room/\(roomid)/categories/\(category.id)"
                  , method: .post, headers: API.headerWithmultiPart)
        .response { res in
            debugPrint(res)
        }
    }
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else {return}
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self), let image = UIImage(data: data){
                selectedImage = image
                recongziedText(image: image)
            }
        }
    }
    func recongziedText(image: UIImage) {
        guard let Image = image.cgImage else { fatalError("이미지 오류")}

        let handler = VNImageRequestHandler(cgImage: Image, options: [:])

        let recognizeRequset = VNRecognizeTextRequest {(request, error) in
            guard let result = request.results as? [VNRecognizedTextObservation] else {
                return
            }
            print(result)
            let stringArray = result.compactMap { result in
                result.topCandidates(1).first?.string
            }
            print(stringArray)
            if let dateString = findDates(in: stringArray) {
                self.expireOCRString = dateString
            }
            if let barcodeString = findBarcodes(in: stringArray) {
                         self.barcodeOCRString = barcodeString
                     }
        }
        recognizeRequset.recognitionLanguages = ["ko-KR", "en"]
        recognizeRequset.recognitionLevel = .accurate
        do {
            try handler.perform([recognizeRequset])
            isSucceed = true
        } catch {
            print(error)
        }
    }
}
func findBarcodes(in array: [String]) -> String? {
    let barcodePattern = "\\d{4}[- ]?\\d{4}[- ]?\\d{4}"
    guard let regex = try? NSRegularExpression(pattern: barcodePattern, options: []) else { return nil }

    for text in array {
        let results = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))

        for result in results {
            guard let range = Range(result.range, in: text) else { continue }
            return String(text[range])
        }
    }
    return nil
}

func findDates(in array: [String]) -> String? {
    let datePattern: String = "(?<year>[0-9]{4})[-/.년]\\s*(?<month>[0-9]{2})[-/.월]\\s*(?<date>[0-9]{2})[일]?"
    guard let regex = try? NSRegularExpression(pattern: datePattern, options: []) else { return nil }

    for text in array {
        let results = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))

        for result in results {
            guard let yearRange = Range(result.range(withName: "year"), in: text),
                  let monthRange = Range(result.range(withName: "month"), in: text),
                  let dateRange = Range(result.range(withName: "date"), in: text) else {
                continue
            }

            let year = String(text[yearRange])
            let month = String(text[monthRange])
            let date = String(text[dateRange])

            // 첫 번째로 찾은 날짜를 반환합니다.
            return "\(year)-\(month)-\(date)"
        }
    }

    // 배열 내에서 날짜를 찾지 못한 경우
    return nil
}


