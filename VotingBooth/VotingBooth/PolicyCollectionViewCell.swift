//
//  PolicyCollectionViewCell.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/12/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SnapKit

class PolicyCollectionViewCell: UICollectionViewCell {

    var title: UILabel
    var content: UITextView

    override init(frame: CGRect) {
        
        title = UILabel()
        content = UITextView()
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 255/255, green: 184/255, blue: 95/255, alpha: 1)
        
        title.text = "Whatever Policy #1"
        title.font = titleFont
        
        content.backgroundColor = UIColor.clearColor()
        content.text = "policy details come here"
        content.font = titleFont?.fontWithSize(15)
        content.textAlignment = .Justified
        content.editable = false
        content.scrollEnabled = false
        content.userInteractionEnabled = false
        
        self.addSubview(title)
        self.addSubview(content)
        
        title.snp_makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(self).offset(20)
            make.height.equalTo(30)
        }
        
        content.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(title.snp_bottom).offset(20)
            make.bottom.left.right.equalTo(self).inset(20)
        }
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 0.7).CGColor
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.lightGrayColor().CGColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
