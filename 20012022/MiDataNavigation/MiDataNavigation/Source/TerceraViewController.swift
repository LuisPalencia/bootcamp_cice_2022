//
//  TerceraViewController.swift
//  MiDataNavigation
//
//  Created by CICE on 20/01/2022.
//

import UIKit

class TerceraViewController: UIViewController {
    
    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    let dataSourceCodigoPostal = ["28001", "38002", "48003", "58004"]
    let dataSourceCiudad = ["Badrid", "Marcelona", "Caragoza", "Textremadura"]
    let dataSourcePosicionGeografica = ["40,1213, -3,4321", "3.4321, -40.1234", "130.098, -3.1234"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    @IBOutlet weak var miTelefonoLBL: UILabel!
    @IBOutlet weak var miDireccionLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    
    @IBOutlet weak var miCodigoPostalTF: UITextField!
    @IBOutlet weak var miCiudadTF: UITextField!
    @IBOutlet weak var miPosicionGeograficaTF: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionPickerView()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI(){
        self.miNombreLBL.text = "Mi Nombre es: \(datosUsuario.nombreData ?? "")"
        self.miApellidoLBL.text = "Mi Apellido es: \(datosUsuario.apellidoData ?? "")"
        self.miTelefonoLBL.text = "Mi Telefono es: \(datosUsuario.telefonoData ?? "")"
        self.miDireccionLBL.text = "Mi Direccoin es: \(datosUsuario.direccionData ?? "")"
        self.edadPerroLBL.text = "La edad de mi Perro es: \( datosUsuario.edadPerroData ?? "")"
    }
    
    private func configuracionPickerView(){
        Utils.shared.configuracionPickerView(tag: 1, delegate: self, dataSource: self, textField: miCodigoPostalTF)
        Utils.shared.configuracionPickerView(tag: 2, delegate: self, dataSource: self, textField: miCiudadTF)
        Utils.shared.configuracionPickerView(tag: 3, delegate: self, dataSource: self, textField: miPosicionGeograficaTF)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV4" {
            if Utils.shared.dataIntextFieldIsEmpty(parametros: [self.miCodigoPostalTF.text ?? "", self.miCiudadTF.text ?? "", self.miPosicionGeograficaTF.text ?? ""]) {
                
                let ventana4 = segue.destination as? CuartaViewController
                ventana4?.datosUsuario.nombreData = self.datosUsuario.nombreData
                ventana4?.datosUsuario.apellidoData = self.datosUsuario.apellidoData
                ventana4?.datosUsuario.telefonoData = self.datosUsuario.telefonoData
                ventana4?.datosUsuario.direccionData = self.datosUsuario.direccionData
                ventana4?.datosUsuario.edadPerroData = self.datosUsuario.edadPerroData
                ventana4?.datosUsuario.codigoPostalData = self.miCodigoPostalTF.text
                ventana4?.datosUsuario.ciudadData = self.miCiudadTF.text
                ventana4?.datosUsuario.posicionGeograficaData = self.miPosicionGeograficaTF.text
                
            }else{
                self.present(Utils.shared.showAlertVC(title: "MMMM", message: "Ya sabes que tienes que rellenar los datos"), animated: true, completion: nil)
            }
        }
    }
    
    private func navigationVentana4(segue: UIStoryboardSegue){
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
    private func dataIntextFieldIsEmpty() -> Bool {
        return !(self.miCodigoPostalTF.text?.isEmpty ?? false) && !(self.miCiudadTF.text?.isEmpty ?? false) && !(self.miPosicionGeograficaTF.text?.isEmpty ?? false)
    }
    */

    
}

extension TerceraViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return self.dataSourceCodigoPostal.count
        case 2:
            return self.dataSourceCiudad.count
        default:
            return self.dataSourcePosicionGeografica.count
        }
    }
}

extension TerceraViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return self.dataSourceCodigoPostal[row]
        case 2:
            return self.dataSourceCiudad[row]
        default:
            return self.dataSourcePosicionGeografica[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            self.miCodigoPostalTF.text = self.dataSourceCodigoPostal[row]
        case 2:
            self.miCiudadTF.text = self.dataSourceCiudad[row]
        default:
            self.miPosicionGeograficaTF.text = self.dataSourcePosicionGeografica[row]
        }
    }
}
