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
    var frameView   : UIView
    
    override init(frame: CGRect) {
        frameView = UIView()
        imageViewer = UIImageView()
        super.init(frame: frame)
        
        self.addSubview(imageViewer)
        imageViewer.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self)
        }
        
        self.insertSubview(frameView, belowSubview: imageViewer)
        frameView.backgroundColor = UIColor.redColor()
        frameView.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(imageViewer).multipliedBy(0.8)
        }
        
        imageViewer.contentMode = .ScaleAspectFit
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}
