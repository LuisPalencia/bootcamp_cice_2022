//
//  DetalleContactoViewController.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//

import UIKit
import MessageUI

class DetalleContactoViewController: UIViewController {
    
    var dataModel: Contact?
    
    // MARK: -  IBOutlets
    
    @IBOutlet weak var detalleContactoTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTableView()
        self.configuracionSendEmail()

        // Do any additional setup after loading the view.
    }
    
    private func configuracionTableView(){
        self.detalleContactoTableView.delegate = self
        self.detalleContactoTableView.dataSource = self
        self.detalleContactoTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
    }
    
    private func configuracionSendEmail(){
        let button1 = UIBarButtonItem(image: UIImage(systemName: "mail.fill"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(sendEmail)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1

    }
    
    @objc
    func sendEmail(){
        if MFMailComposeViewController.canSendMail() {
            self.present(Utils.configuracionMailCompose(delegate: self, data: dataModel),
                         animated: true,
                         completion: nil)
            
            
        } else{
            self.present(Utils.muestraAlerta(titulo: "Error",
                                             mensaje: "Estas en un simulador y no puedes enviar email",
                                             completionHandler: { _ in
                                                self.present(Utils.muestraAlerta(titulo: "Sabemos que estas!", mensaje: "En un simulador hahaha", completionHandler: nil), animated: true, completion: nil)
                                             }),
                         animated: true,
                         completion: nil)
        }
    }
    
    
    private func muestraPhotoMenu(){
        let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheetVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheetVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: {_ in
            self.tomarFoto()
        }))
        
        actionSheetVC.addAction(UIAlertAction(title: "Escoger de la librería", style: .default, handler: { _ in
            self.muestraPhotoLibrary()
        }))
        self.present(actionSheetVC, animated: true, completion: nil)
    }
    
    private func muestraPhotoLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    private func tomarFoto(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }


    
    

}

extension DetalleContactoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.detalleContactoTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
        if let modelData = self.dataModel{
            cell.configuracionCell(data: modelData)
            cell.delegate = self
        }
        return cell
    }
}

extension DetalleContactoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension DetalleContactoViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        DispatchQueue.main.async {
            controller.dismiss(animated: true, completion: nil)
        }
        
    }
}

extension DetalleContactoViewController: PerfilCellDelegate {
    func showCameraPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.muestraPhotoMenu()
        }else{
            self.muestraPhotoLibrary()
        }
    }
}

extension DetalleContactoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImageUnw = info[.originalImage] as? UIImage {
            let imageData = pickerImageUnw.jpegData(compressionQuality: 0.5)
            Utils.Constantes().kPrefs.setValue(imageData, forKey: Utils.Constantes().kImageProfile)
            self.detalleContactoTableView.reloadData()
        }
        
        // Codigo defensivo para evitar bloqueos en el hilo principal
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
