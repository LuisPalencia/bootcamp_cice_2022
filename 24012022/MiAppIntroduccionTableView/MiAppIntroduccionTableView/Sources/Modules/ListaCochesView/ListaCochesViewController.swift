//
//  ListaCochesViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 24/01/2022.
//

import UIKit

class ListaCochesViewController: UIViewController {
    
    // MARK: - Variables globales
    let dataSourceMeses = ["Enero", "Febrero", "Marzo", "Abril"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var miMesesAnhoTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Utils.Constants().tituloListaMeses
        self.configuracionTableView()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private Methods
    private func configuracionTableView(){
        self.miMesesAnhoTableView.delegate = self
        self.miMesesAnhoTableView.dataSource = self
        self.miMesesAnhoTableView.register(UINib(nibName: MesesCell.defaultReuseIdentifier,
                                                 bundle: nil),
                                           forCellReuseIdentifier: MesesCell.defaultReuseIdentifier)
        
    }


    

}

extension ListaCochesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceMeses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMeses = self.miMesesAnhoTableView.dequeueReusableCell(withIdentifier: MesesCell.defaultReuseIdentifier,
                                                                      for: indexPath) as! MesesCell
        //cellMeses.miNombreMesLBL.text = self.dataSourceMeses[indexPath.row]
        cellMeses.setupCell(model: self.dataSourceMeses[indexPath.row])
        return cellMeses
    }
}

extension ListaCochesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


