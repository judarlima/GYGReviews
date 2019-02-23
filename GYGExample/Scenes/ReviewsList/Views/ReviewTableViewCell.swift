//
//  ReviewTableViewCell.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit
import Cosmos

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet private weak var reviewTitle: UILabel!
    @IBOutlet private weak var reviewRating: CosmosView!
    @IBOutlet private weak var authorName: UILabel!
    @IBOutlet private weak var reviewMessage: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(_ viewModel: ReviewViewModel) {
        reviewTitle.text = viewModel.title
        reviewTitle.isHidden = viewModel.title == ""
        authorName.text = viewModel.author
        reviewRating.rating = viewModel.rating
        reviewMessage.text = viewModel.message
        reviewMessage.isHidden = viewModel.message == ""
    }

}
