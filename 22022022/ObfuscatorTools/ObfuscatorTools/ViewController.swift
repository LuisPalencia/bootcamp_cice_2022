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
        print(Obfuscator().bytesByObfuscatingString(string: "aac47ddd12dd972d3bc906d649ec1c68"))
    }


}

