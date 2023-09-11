//
//  EmployeeDirectoryTableViewCell.swift
//  Teamr
//
//  Created by Amir on 2023-09-12.
//

import UIKit
import Kingfisher

class EmployeeDirectoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    
    // No need to reset data here, program is too small and fast when running...
    func bind(with model: EmployeeDirectoryModels.EmployeeModel) {
        nameLabel.text = model.name
        teamLabel.text = model.team
        
        let url = URL(string: model.photoSmall ?? model.photoLarge ?? "")
        photoImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholderimage"))
    }
}
