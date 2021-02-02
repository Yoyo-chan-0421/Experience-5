//
//  ViewController.swift
//  Experience 5
//
//  Created by Yoyo Chan on 2021-02-02.
//
protocol image {
    func imagePickerController(String: Any)
}
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    let mememeTextAttributed: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
               NSAttributedString.Key.foregroundColor:UIColor.white,
               NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
               NSAttributedString.Key.strokeWidth: -2.0
    ]
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        topTextField.text = "Top"
        bottomTextField.text = "Bottom"
        topTextField.defaultTextAttributes = mememeTextAttributed
        bottomTextField.defaultTextAttributes = mememeTextAttributed
        topTextField.textAlignment = .center
        bottomTextField.textAlignment = .center
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
    }
    
    @IBAction func topText(_ sender: Any) {
        textFieldDidBeginEditing(topTextField)
                
    }
    @IBAction func bottomText(_ sender: Any) {
        textFieldDidBeginEditing(bottomTextField)
    }
    @IBAction func pickAnImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
              imagePicker.delegate = self
        imagePicker.sourceType = .camera
              present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[ UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            dismiss(animated: true, completion: nil)
        }
    }
   // Could you also answer why my textFieldDidBeginEditing is not working also why textFieldShouldReturn is not working thank you!
    func textFieldDidBeginEditing(_ textField: UITextField){
            if (textField == topTextField && textField.text == "TOP") || (textField == bottomTextField && textField.text == "BOTTOM"){
                textField.text = " "
            }
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
             textField.resignFirstResponder()
            return true
        }

    

}
