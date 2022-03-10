//
//  ListaTareasViewController.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//

import UIKit

class ListaTareasViewController: UIViewController {
    
    // MARK: - Variables globales
    var datasourceTareas: [DownloadNewModel] = []
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var listaTareasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTV()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SaveFavoritesPresenter.shared.getAllLocal {results in
            if let resultsUnw = results {
                self.datasourceTareas = resultsUnw.downloads ?? []
                self.listaTareasTableView.reloadData()
            }
        } failure: { error in
            debugPrint(error?.debugDescription ?? "AQUI LUIS METE-GAMBA")
        }

        
    }


    private func configuracionTV(){
        self.listaTareasTableView.delegate = self
        self.listaTareasTableView.dataSource = self
        self.listaTareasTableView.register(UINib(nibName: ListaTareasCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: ListaTareasCell.defaultReuseIdentifier)
    }

}

extension ListaTareasViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasourceTareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.listaTareasTableView.dequeueReusableCell(withIdentifier: ListaTareasCell.defaultReuseIdentifier, for: indexPath) as! ListaTareasCell
        cell.configuracionCell(data: self.datasourceTareas[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.datasourceTareas[indexPath.row]
        let vc = DetalleTareaCoordinator.view(dto: DetalleTareaCoordinatorDTO(model: model))
        self.show(vc, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}
