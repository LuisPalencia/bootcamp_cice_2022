//
//  ListaTareasCell.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 04/02/2022.
//

import UIKit

protocol ListaTareasCellProtocol {
    func configuracionCell(data: DownloadNewModel)
}


class ListaTareasCell: UITableViewCell, ReuseIdentifierProtocol {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageTarea: UIImageView!
    @IBOutlet weak var nombreTareaLBL: UILabel!
    @IBOutlet weak var fechaTareaLBL: UILabel!
    @IBOutlet weak var customContentView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.configuracionUI()

        // Configure the view for the selected state
    }
    
    private func configuracionUI(){
        self.imageTarea.layer.cornerRadius = self.imageTarea.frame.width / 2
        self.imageTarea.layer.borderWidth = 1
        self.imageTarea.layer.borderColor = UIColor.gray.cgColor
        self.customContentView.layer.cornerRadius = 4
        self.customContentView.layer.borderWidth = 0.3
        self.customContentView.layer.borderColor = UIColor.lightGray.cgColor
        self.addShadow(customObject: self.customContentView)
        
    }
    
    private func addShadow(customObject: UIView){
        customObject.layer.shadowColor = UIColor.black.cgColor
        customObject.layer.shadowOpacity = 0.2
        customObject.layer.shadowRadius = 10
        customObject.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    
}

extension ListaTareasCell: ListaTareasCellProtocol {
    func configuracionCell(data: DownloadNewModel) {
        //self.imageTarea.image = UIImage(data: data.taskImage) ?? UIImage(named: "placeholder")
        self.nombreTareaLBL.text = data.newTask
        self.fechaTareaLBL.text = data.taskDate
    }
}
