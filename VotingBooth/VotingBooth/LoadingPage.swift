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
import Spark_SDK

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
            
            socket?.on("scauth", callback: { (msg) -> Void in
                let jsonString = msg[0] as! String
                var authInfo : SparkCloudAuthentication?
                authInfo <-- jsonString
                if let authInfo = authInfo {
                    // connect to spark cloud
                    SparkCloud.sharedInstance().loginWithUser(authInfo.username, password: authInfo.password) { (error) -> Void in
                        if let error = error {
                            print("Error connecting to SparkCloud: \(error)")
                        } else {
                            print("Connected to SparkCloud!")
                            SparkCloud.sharedInstance().getDevice("3c001f001047343432313031", completion: { (device, err) -> Void in
                                if let device = device {
                                    photonDevice = device
                                    print("Connected to the device.")
                                } else {
                                    print("Couldn't connect to the device.")
                                }
                            })
                        }
                    }
                }
            })
            
            socket?.on("welcome", callback: { (msg) -> Void in
                let jsonString = msg[0] as! String
                data <-- jsonString
                dispatch_async(dispatch_get_main_queue()) {
                    self.navigationController?.pushViewController(WelcomePage(), animated: true)
                }
            })
        })
    }
    
}
