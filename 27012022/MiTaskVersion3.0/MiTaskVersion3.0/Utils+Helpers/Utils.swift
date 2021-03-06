//
//  Utils.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//

import UIKit
import MessageUI

class Utils {
    
    struct Constantes {
        let kUsername = "USERNAME"
        let kPassword = "PASSWORD"
        let kUsuarioLogado = "LOGADO"
        let kImageProfile = "IMAGE_PROFILE"
        let kPrefs = UserDefaults.standard
    }
    
    static func muestraAlerta(titulo: String, mensaje: String, completionHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertVC = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: completionHandler))
        return alertVC
    }
    
    static func configuracionMailCompose(delegate: MFMailComposeViewControllerDelegate, data: Contact?) -> MFMailComposeViewController {
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = delegate
        mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.es"])
        mailCompo.setSubject("Datos del contacto")
        let emailBody = "Los datos del contacto son \(data?.firstName ?? "")"
        mailCompo.setMessageBody(emailBody, isHTML: false)
        return mailCompo
    }
    
    static func muestraPhotoMenu(completionFoto: ((UIAlertAction) -> Void)?, completionLibrary: ((UIAlertAction) -> Void)?) -> UIAlertController{
        let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheetVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheetVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: completionFoto))
        actionSheetVC.addAction(UIAlertAction(title: "Escoger de la librería", style: .default, handler: completionLibrary))
        return actionSheetVC
    }
    
    static func muestraPhotoLibrary(delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = delegate
        imagePicker.allowsEditing = true
        return imagePicker
    }
    
    
    
    static func tomarFoto(delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> UIImagePickerController{
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = delegate
        imagePicker.allowsEditing = true
        return imagePicker
    }
}

protocol ReuseIdentifierProtocol: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReuseIdentifierProtocol where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
