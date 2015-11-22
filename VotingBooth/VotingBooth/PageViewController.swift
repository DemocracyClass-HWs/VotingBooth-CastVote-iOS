//
//  PageViewController.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/18/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    let container = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let borderWidth: CGFloat = 15.0
        
        // Setup the container
        self.view.addSubview(container)
        container.snp_makeConstraints { (make) -> Void in
            make.left.top.bottom.right.equalTo(self.view).inset(borderWidth)
        }

        // Setup the default
        
        self.view.layer.borderWidth = borderWidth
        self.view.layer.borderColor = borderColor.CGColor
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
