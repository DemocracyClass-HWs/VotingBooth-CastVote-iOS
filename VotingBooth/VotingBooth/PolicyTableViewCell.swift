//
//  PolicyTableViewCell.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/18/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class PolicyTableViewCell: UITableViewCell {
    
    private let leftLabel : UILabel
    private let container : UIView
    private let textView  : UITextView
    
    var label : String {
        get {
            if let text = leftLabel.text {
                return text.substringToIndex(text.endIndex.advancedBy(-1))
            } else {
                return ""
            }
            
        }
        set(value) {
            leftLabel.text = value + "."
        }
    }
    
    var content : String {
        get {
            return textView.text
        }
        set(value) {
            textView.text = value
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        leftLabel = UILabel()
        container = UIView()
        textView = UITextView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .None
        
        container.backgroundColor = UIColor(white: 225/255, alpha: 1)
        container.layer.cornerRadius = 10
        container.layer.borderColor = container.backgroundColor?.CGColor
        container.layer.borderWidth = 5
        container.layer.shadowColor =  UIColor.redColor().CGColor//borderColor.CGColor //UIColor.blackColor().CGColor
        container.layer.shadowOpacity = 0
        container.layer.shadowRadius = 3
        container.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        container.addSubview(leftLabel)
        leftLabel.text = "A."
        leftLabel.textAlignment = .Center
        leftLabel.font = largeTitleFont?.fontWithSize(40)
        leftLabel.backgroundColor = borderColor
        leftLabel.textColor = UIColor.whiteColor()
        leftLabel.snp_makeConstraints { (make) -> Void in
            make.left.top.bottom.equalTo(container).inset(5)
            make.width.equalTo(leftLabel.snp_height)
        }
        
        textView.backgroundColor = UIColor.clearColor()
        textView.userInteractionEnabled = false
        textView.font = UIFont.systemFontOfSize(16)
        textView.text = "Line1\nLine2\nLine3\nLine4"
        container.addSubview(textView)
        textView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(leftLabel.snp_right).offset(10)
            make.top.bottom.right.equalTo(container).inset(5)
        }
        
        self.addSubview(container)
        container.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self).inset(5)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if(selected) {
            let basicAnimation = CABasicAnimation(keyPath: "shadowOpacity")
            basicAnimation.fromValue = 0
            basicAnimation.toValue = 1
            basicAnimation.duration = 0.5
            basicAnimation.autoreverses = true
            basicAnimation.repeatCount = .infinity
            container.layer.addAnimation(basicAnimation, forKey: "shadowOpacity")
            
            let borderAnimation = CABasicAnimation(keyPath: "borderColor")
            borderAnimation.fromValue = container.layer.borderColor
            borderAnimation.toValue = borderColor.CGColor
            borderAnimation.duration = 0.75
            borderAnimation.fillMode = kCAFillModeForwards
            borderAnimation.removedOnCompletion = false
            container.layer.addAnimation(borderAnimation, forKey: "borderColor")
            
        } else {
            container.layer.removeAllAnimations()
        }
    }

}
