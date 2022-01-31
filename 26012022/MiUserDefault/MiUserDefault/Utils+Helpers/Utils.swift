//
//  Utils.swift
//  MiUserDefault
//
//  Created by CICE on 28/01/2022.
//

import UIKit

class Utils {
    
    static let shared = Utils()
    
    struct Constants {
        let kNombre = "NOMBRE"
        let kApellido = "APELLIDO"
        let kDireccion = "DIRECCION"
        let kTelefono = "TELEFONO"
        let kFechaActualizacion = "FECHA_ACTUALIZACION"
        let kImage = "IMAGE_PERFIL"
        let kUserLogado = "USUARIO_LOGADO"
        let kPrefs = UserDefaults.standard
    }
    
    func muestraAlerta(titulo: String,
                       mensaje: String,
                       completionHandler: ((UIAlertAction) -> Void)? ) -> UIAlertController {
        let alertVC = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: completionHandler))
        return alertVC
    }
}
