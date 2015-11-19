//
//  PageViewController.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/18/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the default
        self.view.layer.borderWidth = 20
        self.view.layer.borderColor = UIColor(red: 158/255, green: 11/255, blue: 15/255, alpha: 1).CGColor
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
