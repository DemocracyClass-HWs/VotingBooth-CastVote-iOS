//
//  MainNavigationController.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/12/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SIOSocket
import JSONHelper

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        SIOSocket.socketWithHost("https://cudde.herokuapp.com/", response: { (sk) -> Void in
            socket = sk
            socket?.on("welcome", callback: { (msg) -> Void in
                let jsonString = msg[0] as! String
                data <-- jsonString
                dispatch_async(dispatch_get_main_queue()) {
                    self.pushViewController(ViewController(), animated: true)
                }
                
            })
        })
    }

}
