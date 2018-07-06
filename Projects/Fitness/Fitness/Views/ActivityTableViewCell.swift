//
//  ActivityTableViewCell.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var intensityColorView: UIView!

    func configure(with activity: Activity) {
        activityNameLabel.text = activity.name
        caloriesLabel.text = "\(activity.calories) cal."
        durationLabel.text = "\(Int(activity.duration/60)) min."

        switch activity.intensity {
        case .relaxing:
            intensityColorView.backgroundColor = .green
        case .low:
            intensityColorView.backgroundColor = .yellow
        case .medium:
            intensityColorView.backgroundColor = .orange
        case .high:
            intensityColorView.backgroundColor = .red
        case .extreme:
            intensityColorView.backgroundColor = .black
        case .unknown:
            intensityColorView.backgroundColor = .gray
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
