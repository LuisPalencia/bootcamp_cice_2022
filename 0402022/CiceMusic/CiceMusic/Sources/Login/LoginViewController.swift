/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit

// Output del Presenter
protocol LoginPresenterOutputProtocol {
    func reloadInformationInView()
}

class LoginViewController: BaseView<LoginPresenterInputProtocol> {

    
    // MARK: - Variables globales
    var usuarioLogado = false
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var contentViewUsername: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBTN: UIButton!
    
    
    @IBAction func rememberMeACTION(_ sender: Any) {
        if datosCompletados() {
            self.usuarioLogado = true
            Utils.Constantes().kPrefer.setValue(self.usernameTF.text, forKey: Utils.Constantes().kUsername)
            Utils.Constantes().kPrefer.setValue(self.passwordTF.text, forKey: Utils.Constantes().kPassword)
            Utils.Constantes().kPrefer.setValue(self.usuarioLogado, forKey: Utils.Constantes().kUsuarioLogado)
            self.configuracionUI(color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
        }else{
            self.presenter?.showCustomAlertFailure()
        }
    }
    
    
    @IBAction func loginACTION(_ sender: Any) {
        if datosCompletados() {
            self.borrarDatosFormulario()
            
        }else{
            self.presenter?.showCustomAlertFailure()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI(color: #colorLiteral(red: 1, green: 0.2823529412, blue: 0.25824927, alpha: 1))
        // Do any additional setup after loading the view.
    }

    private func configuracionUI(color: UIColor){
        self.contentViewUsername.backgroundColor = .clear
        self.contentViewUsername.layer.cornerRadius = 37
        self.contentViewUsername.layer.borderWidth = 2
        self.contentViewUsername.layer.borderColor = color.cgColor
        
        self.contentViewPassword.backgroundColor = .clear
        self.contentViewPassword.layer.cornerRadius = 37
        self.contentViewPassword.layer.borderWidth = 2
        self.contentViewPassword.layer.borderColor = color.cgColor
        
        self.loginBTN.layer.cornerRadius = 22

    }

    private func datosCompletados() -> Bool {
        return !(self.usernameTF.text?.isEmpty ?? false) && !(self.passwordTF.text?.isEmpty ?? false)
    }
    
    private func borrarDatosFormulario(){
        self.usernameTF.text = ""
        self.passwordTF.text = ""
        self.mostrarHomeTabBar()
    }
    
    private func mostrarHomeTabBar() {
        self.presenter?.showCustomAlertSuccess()
        //self.presenter?.showHomeTabBar()
    }

}

// Output del Presenter
extension LoginViewController: LoginPresenterOutputProtocol {
    func reloadInformationInView() {
        
    }
}
