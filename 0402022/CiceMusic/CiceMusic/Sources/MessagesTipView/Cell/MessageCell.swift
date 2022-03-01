//
//  MessageCell.swift
//  CiceMusic
//
//  Created by CICE on 24/02/2022.
//

import UIKit

protocol MessageCellInputProtocol {
    func setupCell(data: MessageArray)
}

class MessageCell: UITableViewCell, ReuseIdentifierProtocol {
    
    
    @IBOutlet weak var titleMessageLBL: UILabel!
    
    @IBOutlet weak var developMessageLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MessageCell: MessageCellInputProtocol{
    func setupCell(data: MessageArray) {
        self.titleMessageLBL.text = data.titleMessage
        self.developMessageLBL.text = data.developMessage
    }
    
    
}
