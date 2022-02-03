//
//  NuevaTareaViewController.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//

import UIKit

class NuevaTareaViewController: UIViewController {
    
    // MARK: - Variables globales
    let dataSourcePrioridad = ["ALTA", "MEDIA-ALTA", "MEDIA", "MEDIA-BAJA", "BAJA"]
    var nombreCategoria = "Sin Categoria"
    var fotoSeleccionada = false
    
    // MARK_ - IBOutlets
    @IBOutlet weak var nuevaTareaTF: UITextField!
    @IBOutlet weak var prioridadTF: UITextField!
    @IBOutlet weak var fechaTF: UITextField!
    @IBOutlet weak var categoriaLBL: UILabel!
    @IBOutlet weak var descripcionTV: UITextView!
    @IBOutlet weak var imagenTareaIV: UIImageView!
    @IBOutlet weak var categoriaBTN: UIButton!
    @IBOutlet weak var salvarDatosBTN: UIButton!

    
    // MARK: - IBActions
    
    
    @IBAction func muestraListaCategorias(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func salvarTareaUDACTION(_ sender: Any) {
        debugPrint(#function)
    }
    
    @IBAction func muestraCamaraFotosACTION(_ sender: Any) {
        self.muestraSelectorFoto()
    }
    
    @IBAction func resignFirstResponderACTION(_ sender: Any) {
        self.nuevaTareaTF.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        
        // Do any additional setup after loading the view.
    }
    
    

    private func configuracionImageViewEnable(){
        self.imagenTareaIV.isUserInteractionEnabled = true
        let tapGR = UIGestureRecognizer(target: self, action: #selector(muestraSelectorFoto))
        self.imagenTareaIV.addGestureRecognizer(tapGR)
    }
    
    @objc
    func muestraSelectorFoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.present(Utils.muestraPhotoMenu(completionFoto: { _ in
                self.present(Utils.tomarFoto(delegate: self), animated: true, completion: nil)
            }, completionLibrary: { _ in
                self.present(Utils.muestraPhotoLibrary(delegate: self), animated: true, completion: nil)
            }), animated: true, completion: nil)
        }else{
            self.present(Utils.muestraPhotoLibrary(delegate: self), animated: true, completion: nil)
        }
    }
    
    private func configuracionUI(){
        self.title = "Nueva tarea"
        self.categoriaBTN.layer.cornerRadius = 16
        self.salvarDatosBTN.layer.cornerRadius = 16
        self.imagenTareaIV.layer.cornerRadius = self.imagenTareaIV.frame.width / 2
        self.imagenTareaIV.layer.borderWidth = 1.2
        self.imagenTareaIV.layer.borderColor = UIColor.red.cgColor
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        self.prioridadTF.inputView = pickerView
        self.prioridadTF.text = self.dataSourcePrioridad.first
        
        self.categoriaLBL.text = self.nombreCategoria
        self.nuevaTareaTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

extension NuevaTareaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageUnw = info[.originalImage] as? UIImage {
            self.imagenTareaIV.image = imageUnw
            self.fotoSeleccionada = true
            
        }
        
        // Codigo defensivo para evitar bloqueos en el hilo principal
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension NuevaTareaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataSourcePrioridad.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataSourcePrioridad[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return self.prioridadTF.text = self.dataSourcePrioridad[row]
    }
}

extension NuevaTareaViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
