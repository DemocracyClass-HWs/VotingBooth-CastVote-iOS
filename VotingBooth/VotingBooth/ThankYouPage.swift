//
//  ThankYouPage.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/13/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class ThankYouPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
        
        // Title
        let title = UILabel()
        title.text = "Thank you :)"
        title.textAlignment = .Center
        title.font = headerFont?.fontWithSize(55)
        self.view.addSubview(title)
        title.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(self.view)
            make.centerY.equalTo(self.view.snp_centerY).offset(-60)
            make.height.equalTo(60)
        }
        
        // Info
        let info = UITextView()
        info.userInteractionEnabled = false
        info.text = "We submitted your vote. We appreciate your support. To start over, press the button below."
        info.textColor = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)
        info.textAlignment = .Center
        info.font = titleFont?.fontWithSize(25)
        info.backgroundColor = UIColor.clearColor()
        self.view.addSubview(info)
        info.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view).dividedBy(2).offset(10)
            make.top.equalTo(title.snp_bottom).offset(20)
            make.centerX.equalTo(self.view.snp_centerX)
            make.height.greaterThanOrEqualTo(120)
        }
        
        // Button
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "START OVER", attributes: [NSFontAttributeName:titleFont!.fontWithSize(28), NSForegroundColorAttributeName:UIColor.whiteColor()]), forState: .Normal)
        button.backgroundColor = UIColor.orangeColor()
        button.addTarget(self, action: "finish_tapped", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(button)
        
        button.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(60)
        }
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func finish_tapped() {
        let secondNavigationController = self.navigationController?.viewControllers[1]
        UIView.animateWithDuration(0.75) { () -> Void in
            UIView.setAnimationCurve(.EaseInOut)
            UIView.setAnimationTransition(.FlipFromLeft, forView: (self.navigationController?.view)!, cache: false)
        }
        self.navigationController?.popToViewController(secondNavigationController!, animated: false)
        /*
        [UIView animateWithDuration:0.75
        animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
        }];
        [self.navigationController popViewControllerAnimated:NO];*/
    }

}
