//
//  Utils.swift
//  ImagePickerViewEx
//
//  Created by runnysun on 2022/10/21.
//

import Foundation
import UIKit

func docUrlFileName(_ fileName:String)->URL{
    let fileManager = FileManager.default
    let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    let docUrl = paths[0]
    print(docUrl)
    let fileUrl = docUrl.appending(component: fileName)
    return fileUrl
}

func saveImageWithUrl(_ from: URL, image: UIImage?, quality:CGFloat = 0.5) throws {
    if let image = image,
        let data = image.jpegData(compressionQuality: 0.8) {
        do {
            try data.write(to: from)
        } catch {
            print("저장실패")
        }
    func makeAlertWithOneAction(title:String?, message:String?, actionTitle:String="확인", actionStyle:UIAlertAction.Style = .default) -> UIAlertController {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: actionTitle, style: actionStyle)

        alert.addAction(action)

        return alert

        }
    }
}
