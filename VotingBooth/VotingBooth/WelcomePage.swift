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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // begin button
        let beginButton = UIButton()
        beginButton.setAttributedTitle(NSAttributedString(string: "BEGIN", attributes: [NSFontAttributeName: titleFont!.fontWithSize(40), NSForegroundColorAttributeName: UIColor.redColor()]), forState: .Normal)
        
        self.view.addSubview(beginButton)
        
        beginButton.snp_makeConstraints { (make) -> Void in
            if let requiredSize = beginButton.attributedTitleForState(.Normal)?.size() {
                make.width.equalTo(requiredSize.width)
                make.height.equalTo(requiredSize.height)
            } else {
                make.width.equalTo(self.view)
                make.height.equalTo(50)
            }
            make.centerX.equalTo(self.view.snp_centerX)
            make.centerY.equalTo(self.view.snp_centerY).offset(300)
        }
        
        beginButton.addTarget(self, action: "begin_tapped", forControlEvents: .TouchUpInside)
    
    }
    
    func begin_tapped() {
        self.navigationController?.pushViewController(PolicyVotingPage(), animated: true)
    }

}
