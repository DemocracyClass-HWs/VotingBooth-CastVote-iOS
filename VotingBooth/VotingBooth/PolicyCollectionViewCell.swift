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
    var content: UILabel

    override init(frame: CGRect) {
        
        title = UILabel()
        content = UILabel()
        super.init(frame: frame)
        self.backgroundColor = UIColor.orangeColor()
        
        title.text = "Policy 1"
        content.text = "Content"
        
        self.addSubview(title)
        self.addSubview(content)
        
        title.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
