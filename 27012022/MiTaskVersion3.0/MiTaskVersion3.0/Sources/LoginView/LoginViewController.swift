//
//  LoginViewController.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var contentViewUsername: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBTN: UIButton!
    
    
    @IBAction func rememberMeACTION(_ sender: Any) {
        
    }
    
    
    @IBAction func loginACTION(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        // Do any additional setup after loading the view.
    }

    private func configuracionUI(){
        self.contentViewUsername.backgroundColor = .clear
        self.contentViewUsername.layer.cornerRadius = 37
        self.contentViewUsername.layer.borderWidth = 2
        self.contentViewUsername.layer.borderColor = #colorLiteral(red: 1, green: 0.2827598444, blue: 0.25824927, alpha: 1)
        
        self.contentViewPassword.backgroundColor = .clear
        self.contentViewPassword.layer.cornerRadius = 37
        self.contentViewPassword.layer.borderWidth = 2
        self.contentViewPassword.layer.borderColor = #colorLiteral(red: 1, green: 0.2827598444, blue: 0.25824927, alpha: 1)
        
        self.loginBTN.layer.cornerRadius = 22

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
