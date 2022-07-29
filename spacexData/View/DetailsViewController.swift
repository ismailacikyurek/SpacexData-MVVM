//
//  DetailsViewController.swift
//  spacexData
//
//  Created by İSMAİL AÇIKYÜREK on 27.07.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var lblYear: UILabel!
    
    var data : SpacexDataModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = data?.mission_name
        txtDescription.text = data?.details
        lblYear.text = "Year : \(data!.launch_year!)"
        
        guard let urlStr = data?.links?.mission_patch else { return }
        photoImageView.kf.setImage(with:URL(string: urlStr))
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.cornerRadius = 12
        
        
        
    }
    



}
