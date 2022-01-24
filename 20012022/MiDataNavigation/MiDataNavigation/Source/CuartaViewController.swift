//
//  CuartaViewController.swift
//  MiDataNavigation
//
//  Created by CICE on 20/01/2022.
//

import UIKit
import MessageUI

class CuartaViewController: UIViewController {
    
    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    @IBOutlet weak var miTelefonoLBL: UILabel!
    @IBOutlet weak var miDireccionLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    @IBOutlet weak var codigoPostaLBL: UILabel!
    @IBOutlet weak var ciudadLBL: UILabel!
    @IBOutlet weak var posicionGeograficaLBL: UILabel!
    
    
    
    @IBAction func enviarTodaLaInformacionEmailACTION(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            self.present(Utils.shared.configuracionMailCompose(delegate: self,
                                                               data: [self.miNombreLBL.text ?? ""]),
                         animated: true,
                         completion: nil)
        } else{
            self.present(Utils.shared.showAlertVC(title: "Que pasa!!", message: "Estas en un simulador y no puedes enviar email"), animated: true, completion: nil)
        }
    }
    
    
    func a(){
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()

        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI(){
        self.miNombreLBL.text = datosUsuario.nombreData
        self.miApellidoLBL.text = datosUsuario.apellidoData
        self.miTelefonoLBL.text = datosUsuario.telefonoData
        self.miDireccionLBL.text = datosUsuario.direccionData
        self.edadPerroLBL.text = datosUsuario.edadPerroData
        self.codigoPostaLBL.text = datosUsuario.codigoPostalData
        self.ciudadLBL.text = datosUsuario.ciudadData
        self.posicionGeograficaLBL.text = datosUsuario.posicionGeograficaData
    }
    
    /*
    private func configuracionMailCompose() -> MFMailComposeViewController {
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = self
        mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.es"])
        mailCompo.setSubject("Este es un mensaje para el equipo de soporte")
        let emailBody = "Los datos del formulario de registro son \(self.miNombreLBL.text ?? "") \n \(self.miApellidoLBL.text ?? "")"
        mailCompo.setMessageBody(emailBody, isHTML: false)
        return mailCompo
    }
    */
    

}


extension CuartaViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
