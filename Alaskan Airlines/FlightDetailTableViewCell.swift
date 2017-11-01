//
//  FlightDetailTableViewCell.swift
//  Alaskan Airlines
//
//  Created by Abraham Tesfamariam on 11/1/17.
//  Copyright © 2017 RJT Compuquest. All rights reserved.
//

import UIKit

class FlightDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var origAirportLabel: UILabel!
    @IBOutlet weak var destAirportLabel: UILabel!
    @IBOutlet weak var departTimeLabel: UILabel!
    @IBOutlet weak var arriveTimeLabel: UILabel!
    @IBOutlet weak var flightNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()

        containerView.layer.cornerRadius = 8
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
