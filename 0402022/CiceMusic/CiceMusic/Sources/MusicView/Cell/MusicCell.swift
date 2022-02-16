//
//  MusicCell.swift
//  CiceMusic
//
//  Created by CICE on 10/02/2022.
//

import UIKit
import Kingfisher

protocol MusicCellInputProtocol {
    func setupCell(data: GenericResult)
}

class MusicCell: UITableViewCell, ReuseIdentifierProtocol {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var artistWorkImageView: UIImageView!
    @IBOutlet weak var artistNameLBL: UILabel!
    @IBOutlet weak var releaseDateLBL: UILabel!
    @IBOutlet weak var kindLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MusicCell: MusicCellInputProtocol {
    func setupCell(data: GenericResult) {
        
        
        let url = URL(string: data.artworkUrl100?.replacingOccurrences(of: "100", with: "800") ?? "")
        let processor = DownsamplingImageProcessor(size: artistWorkImageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        artistWorkImageView.kf.indicatorType = .activity
        artistWorkImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
        self.artistNameLBL.text = data.artistName
        self.releaseDateLBL.text = data.releaseDate
        self.kindLBL.text = data.kind

    }
}
