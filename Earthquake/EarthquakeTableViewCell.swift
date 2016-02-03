//
//  EarthquakeTableViewCell.swift
//  Earthquake
//
//  Created by Darrekk Hocking on 2/1/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import UIKit

class EarthquakeTableViewCell: UITableViewCell {
    
    let kLabelHorizontalInsets: CGFloat = 10.0
    let kLabelVerticalInsets: CGFloat = 10.0

    let dateTimeLabel: UILabel = UILabel.newAutoLayoutView()
    let magnitudeLabel: UILabel = UILabel.newAutoLayoutView()
    let coordinateLabel: UILabel = UILabel.newAutoLayoutView()
    
    var didSetupConstraints = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){

        
        magnitudeLabel.lineBreakMode = .ByTruncatingTail
        magnitudeLabel.numberOfLines = 0
        magnitudeLabel.textAlignment = .Center
        magnitudeLabel.textColor = UIColor.blackColor()
        magnitudeLabel.adjustsFontSizeToFitWidth = true

        coordinateLabel.lineBreakMode = .ByTruncatingTail
        coordinateLabel.numberOfLines = 0
        coordinateLabel.textAlignment = .Left
        coordinateLabel.textColor = UIColor.blackColor()
        
        dateTimeLabel.lineBreakMode = .ByTruncatingTail
        dateTimeLabel.numberOfLines = 0
        dateTimeLabel.textAlignment = .Left
        dateTimeLabel.textColor = UIColor.blackColor()

        contentView.addSubview(dateTimeLabel)
        contentView.addSubview(magnitudeLabel)
        contentView.addSubview(coordinateLabel)
    }
    
    override func updateConstraints()
    {
        if !didSetupConstraints {
        
            // Prevent the UILabels from being compressed below their intrinsic content height
            NSLayoutConstraint.autoSetPriority(UILayoutPriorityRequired) {
                self.dateTimeLabel.autoSetContentCompressionResistancePriorityForAxis(.Vertical)
                self.magnitudeLabel.autoSetContentCompressionResistancePriorityForAxis(.Vertical)
                self.coordinateLabel.autoSetContentCompressionResistancePriorityForAxis(.Vertical)

            }
            //Set layout
            
            magnitudeLabel.autoPinEdgeToSuperviewEdge(.Leading, withInset: kLabelHorizontalInsets)
            magnitudeLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
            magnitudeLabel.autoAlignAxis(.Vertical, toSameAxisOfView: dateTimeLabel, withMultiplier: 0.25)
            magnitudeLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: dateTimeLabel)
            magnitudeLabel.autoPinEdge(.Bottom, toEdge: .Top, ofView: coordinateLabel)

            
            dateTimeLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: kLabelVerticalInsets)
            dateTimeLabel.autoAlignAxisToSuperviewAxis(.Vertical)
            
            coordinateLabel.autoAlignAxisToSuperviewAxis(.Vertical)
            coordinateLabel.autoPinEdgeToSuperviewEdge(.Bottom, withInset: kLabelVerticalInsets)
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
