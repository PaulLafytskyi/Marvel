//
//  FeedTableViewCell.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/25/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell, CellInitializable {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        avatarImageView.image = nil
        descriptionLabel.text = ""
    }
}
