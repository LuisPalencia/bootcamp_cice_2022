//
//  Utils.swift
//  MiDataNavigation
//
//  Created by CICE on 20/01/2022.
//

import Foundation
import UIKit


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
