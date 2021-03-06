//
//  Utils.swift
//  MiDataNavigation
//
//  Created by CICE on 20/01/2022.
//

import Foundation
import UIKit
import MessageUI


class Utils {
    static let shared = Utils()
    
    
    /// method showAlertVC return a alert generic component
    /// - Parameters:
    ///   - title: title put from VC to Alert generic component
    ///   - message: message put from VC to Alert generic component
    /// - Returns: return UIAlertController component
    func showAlertVC(title: String, message: String) -> UIAlertController{
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertVC
    }
    
    
    
    
    /// Method configuracionPickerView
    /// - Parameters:
    ///   - tag: <#tag description#>
    ///   - delegate: <#delegate description#>
    ///   - dataSource: <#dataSource description#>
    ///   - textField: <#textField description#>
    ///   - dataArray: <#dataArray description#>
    func configuracionPickerView(tag: Int,
                                 delegate: UIPickerViewDelegate,
                                 dataSource: UIPickerViewDataSource,
                                 textField: UITextField) {
        
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.tag = tag
        textField.inputView = pickerView
    }
    
    func dataIntextFieldIsEmpty(parametros: [String]) -> Bool {
        for item in parametros {
            if (item.isEmpty) {
                return false
            }
        }
        return true
    }
    
    func configuracionMailCompose(delegate: MFMailComposeViewControllerDelegate, data: [String]) -> MFMailComposeViewController {
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = delegate
        mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.es"])
        mailCompo.setSubject("Este es un mensaje para el equipo de soporte")
        let emailBody = "Los datos del formulario de registro son \(data)"
        mailCompo.setMessageBody(emailBody, isHTML: false)
        return mailCompo
    }
    
}


struct DatosUsuarioModel {
    var nombreData: String?
    var apellidoData: String?
    var telefonoData: String?
    var direccionData: String?
    var edadPerroData: String?
    var codigoPostalData: String?
    var ciudadData: String?
    var posicionGeograficaData: String?
    
}
