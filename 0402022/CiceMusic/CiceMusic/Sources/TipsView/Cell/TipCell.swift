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
    
    @IBOutlet weak var tipImage: UIImageView!
    @IBOutlet weak var tipTitleLBL: UILabel!
    @IBOutlet weak var tipSubtitleLBL: UILabel!
    

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
        self.tipTitleLBL.text = data.title
        self.tipSubtitleLBL.text = data.subtitle
    }
}
