//
//  HomeCellTableViewCell.swift
//  MVVMPatrones
//
//  Created by Pedro on 3/10/23.
//

import UIKit

class HomeCellTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCellHome: UIView!
    @IBOutlet weak var nameCellHome: UILabel!
    @IBOutlet weak var imageCellHome: UIImageView!
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            viewCellHome.layer.cornerRadius = 4.0
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            nameCellHome.text = nil
            imageCellHome.image = nil
        }

        func updateViews(data: BikeModel?) {
            update(name: data?.name)
            update(imageName: data?.imageName)
        }

        private func update(name: String?) {
            nameCellHome.text = name ?? ""
        }

        private func update(imageName: String?) {
            imageCellHome.image = UIImage(named: imageName ?? "")
        }
    }
