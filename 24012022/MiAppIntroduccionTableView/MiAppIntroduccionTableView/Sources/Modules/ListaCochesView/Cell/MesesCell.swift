//
//  MesesCell.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 24/01/2022.
//

import UIKit

protocol MesesCellProtocol {
    func setupCell(model: String)
}

class MesesCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - IBOutlet
    @IBOutlet weak var miNombreMesLBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MesesCell: MesesCellProtocol{
    func setupCell(model: String) {
        self.miNombreMesLBL.text = model
    }
    
    
}
