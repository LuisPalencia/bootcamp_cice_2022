//
//  CategoriaCell.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 03/02/2022.
//

import UIKit

class CategoriaCell: UITableViewCell, ReuseIdentifierProtocol {
    
    // MARK: - IBOutlet
    @IBOutlet weak var nombreCategoriaLBL: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


