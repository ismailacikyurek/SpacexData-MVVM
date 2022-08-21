//
//  TableViewCell.swift
//  spacexData
//
//  Created by İSMAİL AÇIKYÜREK on 27.07.2022.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    @IBOutlet weak var PhotoimageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    var year : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(content: [SpacexDataModel]) {
        lblTitle.text = content[0].mission_name
        lblDescription.text = content[0].details
        year = Int(content[0].launch_year!)
        guard let urlStr = content[0].links?.mission_patch else { return }
        PhotoimageView.kf.setImage(with:URL(string: urlStr))
        PhotoimageView.layer.borderWidth = 1
        PhotoimageView.layer.cornerRadius = 12
        }

}
