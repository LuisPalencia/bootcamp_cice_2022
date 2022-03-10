//
//  DetalleTareaViewController.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 31/01/2022.
//

import UIKit

class DetalleTareaViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var detalleTareaTableView: UITableView!
    
    var dataModel: DownloadNewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTableView()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionTableView(){
        self.detalleTareaTableView.delegate = self
        self.detalleTareaTableView.dataSource = self
        self.detalleTareaTableView.register(UINib(nibName: TareasCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: TareasCell.defaultReuseIdentifier)
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

extension DetalleTareaViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.detalleTareaTableView.dequeueReusableCell(withIdentifier: TareasCell.defaultReuseIdentifier, for: indexPath) as! TareasCell
        
        if let modelData = self.dataModel {
            cell.configuracionCell(data: modelData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
