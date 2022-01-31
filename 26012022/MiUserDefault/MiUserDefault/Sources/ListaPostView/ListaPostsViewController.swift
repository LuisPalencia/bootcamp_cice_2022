//
//  ListaPostsViewController.swift
//  MiUserDefault
//
//  Created by CICE on 27/01/2022.
//

import UIKit

class ListaPostsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionLogout()
        // Do any additional setup after loading the view.
    }


    private func configuracionLogout(){
        print("HOLA")
        let button1 = UIBarButtonItem(image: UIImage(systemName: "house"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(logout)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1

    }
    
    @objc
    func logout(){
        Utils.Constants().kPrefs.setValue(false, forKey: Utils.Constants().kUserLogado)
        
        let vc = RegistroCoordinator.view()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
