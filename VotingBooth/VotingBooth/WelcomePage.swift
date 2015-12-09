//
//  WelcomePage.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/18/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SnapKit

class WelcomePage: PageViewController {
    
    private let welcomeImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // begin button
        let beginButton = UIButton()
        beginButton.setAttributedTitle(NSAttributedString(string: "BEGIN", attributes: [NSFontAttributeName: largeTitleFont!.fontWithSize(50), NSForegroundColorAttributeName: UIColor.redColor()]), forState: .Normal)
        beginButton.layer.borderColor = textColor.CGColor
        beginButton.layer.borderWidth = 8
        
        self.view.addSubview(beginButton)
        
        beginButton.snp_makeConstraints { (make) -> Void in
            if let requiredSize = beginButton.attributedTitleForState(.Normal)?.size() {
                make.width.equalTo(requiredSize.width+100)
                make.height.equalTo(requiredSize.height).offset(100)
            } else {
                make.width.equalTo(self.view)
                make.height.equalTo(50)
            }
            make.centerX.equalTo(self.view.snp_centerX)
            make.centerY.equalTo(self.view.snp_centerY).offset(300)
        }
        
        beginButton.addTarget(self, action: "begin_tapped", forControlEvents: .TouchUpInside)
        
        // image
        welcomeImageView.image = UIImage(named: "welcome")
        welcomeImageView.contentMode = .ScaleAspectFill
        self.view.addSubview(welcomeImageView)
        welcomeImageView.snp_makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(self.container).inset(200)
            make.bottom.equalTo(beginButton).offset(-200)
        }
    
    }
    
    func begin_tapped() {
        self.navigationController?.pushViewController(PolicyVotingPage(), animated: true)
    }

}
