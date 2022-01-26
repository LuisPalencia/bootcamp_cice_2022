//
//  ListaPerfilPostViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 25/01/2022.
//

import UIKit

class ListaPerfilPostViewController: UIViewController {
    
    // MARK_ - IBOutlets
    @IBOutlet weak var miPerfilPostTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTableView()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionTableView(){
        self.miPerfilPostTableView.delegate = self
        self.miPerfilPostTableView.dataSource = self
        self.miPerfilPostTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
        self.miPerfilPostTableView.register(UINib(nibName: PostCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PostCell.defaultReuseIdentifier)
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

extension ListaPerfilPostViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellPerfil = self.miPerfilPostTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
            cellPerfil.delegate = self
            cellPerfil.setupCellPerfil(data: UserDataModel(nombrePerfil: "Luis Palencia Del Campo",
                                                           descripcionPerfil: "Senior lead iOS Engineer en NTTDATA, e instructor de iOS en CICE, Loremipsum",
                                                           puestoActualPerfil: "Senior lead iOS Engineer",
                                                           usuarioLinkedInPerfil: "@luispalencia",
                                                           imagePerfil: "thor"))
            return cellPerfil
        default:
            let cellPost = self.miPerfilPostTableView.dequeueReusableCell(withIdentifier: PostCell.defaultReuseIdentifier, for: indexPath) as! PostCell
            cellPost.setupPostCell(data: UserDataModel(nombrePerfil: "Miranda",
                                                       descripcionPerfil: "Senior lead iOS Engineer Lrem ipsum donde las leyes haces lo que quieras Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieras Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieras Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieras Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran",
                                                       puestoActualPerfil: "Senior lead iOS Engineer",
                                                       usuarioLinkedInPerfil: "@Miranda_Lambert",
                                                       imagePerfil: "miranda-lambert"))
            return cellPost
        }
    }
}

extension ListaPerfilPostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 265
        default:
            return UITableView.automaticDimension
        }
    }
}

extension ListaPerfilPostViewController: PerfilCellOutputDelegate {
    
    func showAlertB1() {
        let alertVC = UIAlertController(title: "Explota la cebaza", message: "A por ellos oe", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showAlertB2() {
        let alertVC = UIAlertController(title: "Explota la cebaza", message: "\(#function)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func navigationToDetailView(withData: UserDataModel?) {
        let alertVC = UIAlertController(title: "Explota la cebaza", message: withData?.nombrePerfil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
}
