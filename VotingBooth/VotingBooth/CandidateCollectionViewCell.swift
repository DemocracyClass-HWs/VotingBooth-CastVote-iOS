//
//  CandidateCollectionViewCell.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/13/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class CandidateCollectionViewCell: UICollectionViewCell {
    
    var imageViewer : UIImageView
    
    override init(frame: CGRect) {
        imageViewer = UIImageView()
        super.init(frame: frame)
        imageViewer.backgroundColor = UIColor.brownColor()
        
        self.addSubview(imageViewer)
        imageViewer.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self)
        }
        
        imageViewer.clipsToBounds = true
        imageViewer.contentMode = .ScaleAspectFill
        layer.borderWidth = 1
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageViewer.layer.cornerRadius = imageViewer.bounds.width / 2
        layer.cornerRadius = bounds.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}
