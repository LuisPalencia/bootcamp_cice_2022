//
//  ViewController.swift
//  ObfuscatorTools
//
//  Created by CICE on 22/02/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Obfuscator().bytesByObfuscatingString(string: "64b4292692msh3c16ecdda490640p10aaf5jsna5ce257e6e41"))
    }


}

