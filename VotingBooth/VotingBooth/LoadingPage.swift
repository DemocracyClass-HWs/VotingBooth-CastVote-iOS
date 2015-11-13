//
//  LoadingPage.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/13/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SIOSocket
import JSONHelper

class LoadingPage: UIViewController {

    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        self.view.addSubview(spinner)
        spinner.startAnimating()
        spinner.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.view.snp_center)
        }
        
        let progressLabel = UILabel()
        progressLabel.text = "Connecting to server..."
        progressLabel.font = titleFont?.fontWithSize(14)
        progressLabel.textAlignment = .Center
        self.view.addSubview(progressLabel)
        progressLabel.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view)
            make.height.equalTo(20)
            make.top.equalTo(spinner.snp_bottom).offset(20)
        }
        
        SIOSocket.socketWithHost("https://cudde.herokuapp.com/", response: { (sk) -> Void in
            socket = sk
            socket?.on("welcome", callback: { (msg) -> Void in
                let jsonString = msg[0] as! String
                data <-- jsonString
                dispatch_async(dispatch_get_main_queue()) {
                    self.navigationController?.pushViewController(PolicyVotingPage(), animated: true)
                }
                
            })
        })
    }
    
}
