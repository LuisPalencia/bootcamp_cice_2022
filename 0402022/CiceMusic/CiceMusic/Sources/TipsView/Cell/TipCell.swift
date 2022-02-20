//
//  TipCell.swift
//  CiceMusic
//
//  Created by CICE on 17/02/2022.
//

import UIKit

protocol TipCellInputProtocol {
    func setupCell(data: ConsejosGenerale)
}

class TipCell: UITableViewCell, ReuseIdentifierProtocol {
    
    // MARK: - IBOutlets
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TipCell:TipCellInputProtocol {
    func setupCell(data: ConsejosGenerale) {
        
    }
    
}
