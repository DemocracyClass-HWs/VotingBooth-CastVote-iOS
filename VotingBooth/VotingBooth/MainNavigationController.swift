//
//  MainNavigationController.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/12/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        self.setNavigationBarHidden(true, animated: false)
        self.setViewControllers([LoadingPage()], animated: false)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
