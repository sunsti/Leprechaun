//
//  ProfileVC.swift

import Foundation
import UIKit

class ProfileVC: UIViewController {
    
    private let imagePicker = UIImagePickerController()
    let ud = UD.shared
    
    private var contentView: ProfileView {
        view as? ProfileView ?? ProfileView()
    }
    
    override func loadView() {
        view = ProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerConfigure()
        savedName()
        tappedButtons()
        if let image = getImageFromFileManager() {
            contentView.profileBtn.setImage(image, for: .normal)
        }
        if let savedUserName = ud.userName,
           !savedUserName.isEmpty {
            contentView.profileTextField.text = savedUserName
        } else {
            contentView.profileTextField.placeholder = "USER #\(ud.userId)"
        }
    }
    
    private func imagePickerConfigure() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false

    }
    
    private func savedName() {
         if !UD.shared.isNotFirst {
             UD.shared.isNotFirst = true
         }
         if let savedUserName = UD.shared.userName,
            !savedUserName.isEmpty {
             contentView.profileTextField.text = savedUserName
         }
    }
    
    private func tappedButtons() {
        contentView.backBtn.addTarget(self, action: #selector(goButtonTappedHome), for: .touchUpInside)
        contentView.profileBtn.addTarget(self, action: #selector(goTakePhoto), for: .touchUpInside)
        let hide = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        contentView.addGestureRecognizer(hide)
        contentView.payHideButton.addTarget(self, action: #selector(goButtonTappedHome), for: .touchUpInside)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func goButtonTappedHome() {
        navigationController?.popToRootViewController(animated: true)
    }

    @objc func goTakePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let alert = UIAlertController(title: "Pick Photo", message: nil, preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "Camera", style: .default) { _ in
                self.imagePicker.sourceType = .camera
            }
            let action2 = UIAlertAction(title: "photo library", style: .default) { _ in
                self.imagePicker.sourceType = .photoLibrary
            }
            let cancel = UIAlertAction(title: "cancel", style: .cancel)
            present(imagePicker, animated: true, completion: nil)
            alert.addAction(action1)
            alert.addAction(action2)
            alert.addAction(cancel)
            present(alert, animated: true)
        } else {
            print("Камера недоступна")
        }
    }
    
    func getImageFromFileManager() -> UIImage? {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let imageUrl = documentsDirectory.appendingPathComponent("image.jpg")
        if let data = try? Data(contentsOf: imageUrl),
           let image = UIImage(data: data) {
            return image
        }
        return nil
    }
    
    private func saveImageToFile(_ image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            return
        }
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let imageUrl = documentsDirectory.appendingPathComponent("image.jpg")
        
        do {
            try data.write(to: imageUrl)
        } catch {
            print("Error saving image to file: \(error)")
        }
    }
    
}

extension ProfileVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            contentView.profileBtn.setImage(image, for: .normal)
            saveImageToFile(image)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileVC: UINavigationControllerDelegate {
    
}
