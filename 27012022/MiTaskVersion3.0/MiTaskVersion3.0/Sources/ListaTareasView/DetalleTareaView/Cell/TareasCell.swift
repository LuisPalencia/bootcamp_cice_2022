//
//  TareasCell.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 10/03/2022.
//

import UIKit

protocol TareasCellProtocol {
    func configuracionCell(data: DownloadNewModel)
}


class TareasCell: UITableViewCell, ReuseIdentifierProtocol {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageTask: UIImageView!
    
    @IBOutlet weak var nombreTareaLBL: UILabel!
    @IBOutlet weak var fechaTareaLBL: UILabel!
    @IBOutlet weak var prioridadTareaLBL: UILabel!
    @IBOutlet weak var categoriaTareaLBL: UILabel!
    @IBOutlet weak var descripcionTareaLBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TareasCell: TareasCellProtocol{
    func configuracionCell(data: DownloadNewModel) {
        if let imageUnw = data.taskImage {
            self.imageTask.image = UIImage(data: imageUnw)
        }else{
            self.imageTask.image = UIImage(named: "placeholder")
        }
        
        self.nombreTareaLBL.text = data.newTask
        self.fechaTareaLBL.text = "Fecha: \(data.taskDate ?? "")"
        self.prioridadTareaLBL.text = "Prioridad: \(data.priority ?? "")"
        self.categoriaTareaLBL.text = "Categoria: \(data.taskCategory ?? "")"
        self.descripcionTareaLBL.text = data.taskDescription
    }
}
