//
//  ViewController.swift
//  ImagePickerViewEx
//
//  Created by wizard on 2022/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.delegate = self
        picker.modalPresentationStyle = .popover
    }
    func docUrlFileName(_ fileName:String)->URL{
        let fileManager = FileManager.default
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = paths[0]
        print(docUrl)
        let fileUrl = docUrl.appending(component: fileName)
        return fileUrl
    }

    
    @IBAction func actSave(_ sender: Any) {
        let saveUrl = docUrlFileName("sample.png")
        print(saveUrl)
        do{
            try saveImageWithUrl(saveUrl, image: imageView.image, quality: 0.8)
        } catch {
            let alert = makeAlertWithOneAction(title: nil, message: "메세지 저장에 실패했습니다.")
            present(alert,animated: true)
        }
        if let savedData = try? Data(contentsOf: saveUrl) {
            let image = UIImage(data: savedData)
            imageView1.image = image
        }
        
    }
    
    
    func makeAlertWithOneAction(title:String?, message:String?, actionTitle:String="확인", actionStyle:UIAlertAction.Style = .default) -> UIAlertController {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: actionTitle, style: actionStyle)

        alert.addAction(action)

        return alert

    }
    @IBAction func actPhotoAlbum(_ sender: Any) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    @IBAction func actCamera(_ sender: Any) {
        picker.sourceType = .camera
        present(picker, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        self.imageView.image = image
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}
