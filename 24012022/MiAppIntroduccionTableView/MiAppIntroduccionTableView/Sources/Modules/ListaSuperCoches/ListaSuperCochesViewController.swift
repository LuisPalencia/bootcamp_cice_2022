//
//  ListaSuperCochesViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 24/01/2022.
//

import UIKit

class ListaSuperCochesViewController: UIViewController {
    
    // MARK: - Variables globales
    var dataSourceCoches: [CochesModel] = []
    var imageCoche = UIImage(named: "audi")
    
    // MARK: - IBOutlets
    @IBOutlet weak var miListaCochesTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionTableView()

        // Do any additional setup after loading the view.
    }


    private func configuracionUI(){
        self.title = Utils.Constants().tituloListaCoches
        
        for item in 0..<23{
            let modelData = CochesModel(nombre: "Audi", color: "Verde", imagen: imageCoche)
            dataSourceCoches.append(modelData)
            print("\(dataSourceCoches[item])")
        }
    }
    
    private func configuracionTableView(){
        self.miListaCochesTableView.delegate = self
        self.miListaCochesTableView.dataSource = self
    }

}

extension ListaSuperCochesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceCoches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

extension ListaSuperCochesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

