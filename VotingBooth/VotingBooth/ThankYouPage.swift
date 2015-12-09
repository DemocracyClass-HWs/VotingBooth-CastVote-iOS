//
//  ThankYouPage.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/13/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class ThankYouPage: PageViewController {
    

    private var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Send the vote
        if let candidate = selectedCandidate, let policy = selectedPolicy {
            let voteSubmissionDictionary = ["candidate_id" : candidate.id, "policy_id" : policy.id]
            socket?.emit("votesubmission", args: [voteSubmissionDictionary])
        }
        
        // Picture
        let imageView = UIImageView()
        imageView.image = UIImage(named: "thankyou")
        self.container.addSubview(imageView)
        imageView.contentMode = .ScaleAspectFit
        imageView.snp_makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(self.container).inset(10)
            make.height.equalTo(self.container).dividedBy(3.5)
        }
        
        // Results
        let policyLabel = UILabel()
        policyLabel.font = largeTitleFont?.fontWithSize(30)
        policyLabel.textAlignment = .Center
        policyLabel.lineBreakMode = .ByWordWrapping
        policyLabel.numberOfLines = 0
        self.container.addSubview(policyLabel)
        policyLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.container).offset(50)
            make.top.equalTo(imageView.snp_bottom).offset(15)
            make.width.equalTo(self.container).dividedBy(2.5)
            make.height.equalTo(self.container).dividedBy(3.5)
        }
        
        let candidateLabel = UILabel()
        candidateLabel.font = largeTitleFont?.fontWithSize(30)
        candidateLabel.textAlignment = .Center
        candidateLabel.lineBreakMode = .ByWordWrapping
        candidateLabel.numberOfLines = 0
        self.container.addSubview(candidateLabel)
        candidateLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(policyLabel.snp_left)
            make.top.equalTo(policyLabel.snp_bottom).offset(20)
            make.width.height.equalTo(policyLabel)
        }
        
        // Pictures
        let policyImageView = UIImageView()
        policyImageView.contentMode = .ScaleAspectFit
        policyImageView.layer.shadowRadius = 10
        policyImageView.layer.shadowOpacity = 1
        if let policy = selectedPolicy, let candidate = data?.candidates.filter({ (candidate) -> Bool in
            candidate.id == policy.corrospondingCandidateId
        })[0] {
            policyImageView.sd_setImageWithURL(NSURL(string: candidate.imageUrl))
            policyLabel.text = "Position \(selectedPolicyName!)\nwas\n\(candidate.name)"
            switch(candidate.party) {
            case .Democratic:
                policyImageView.layer.shadowColor = textColor.CGColor
            case.Republican:
                policyImageView.layer.shadowColor = UIColor.redColor().CGColor
            case _:
                policyImageView.layer.shadowColor = UIColor.grayColor().CGColor
            }
        }
        self.container.addSubview(policyImageView)
        policyImageView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(policyLabel.snp_right)
            make.right.equalTo(self.container)
            make.height.equalTo(policyLabel.snp_height)
            make.top.equalTo(policyLabel.snp_top)
        }
        
        let candidateImageView = UIImageView()
        candidateImageView.contentMode = .ScaleAspectFit
        candidateImageView.layer.shadowRadius = 10
        candidateImageView.layer.shadowOpacity = 1
        if let candidate = selectedCandidate {
            candidateImageView.sd_setImageWithURL(NSURL(string: candidate.imageUrl))
            candidateLabel.text = "Image Vote\nwas\n\(candidate.name)"
            switch(candidate.party) {
            case .Democratic:
                candidateImageView.layer.shadowColor = textColor.CGColor
            case.Republican:
                candidateImageView.layer.shadowColor = UIColor.redColor().CGColor
            case _:
                candidateImageView.layer.shadowColor = UIColor.grayColor().CGColor
            }
        }
        self.container.addSubview(candidateImageView)
        candidateImageView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(candidateLabel.snp_right)
            make.right.equalTo(self.container)
            make.height.equalTo(candidateLabel.snp_height)
            make.top.equalTo(candidateLabel.snp_top)
        }
        
        // Button

        button.backgroundColor = UIColor.orangeColor()
        
        self.container.addSubview(button)
        button.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self.container)
            make.height.equalTo(60)
        }
        button.backgroundColor = UIColor(white: 200/255, alpha: 1)
        
        tick()
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick", userInfo: nil, repeats: true)
        
    }
    
    var counter = 11
    func tick() {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.counter--
            self.button.setAttributedTitle(NSAttributedString(string: "Starting over in \(self.counter) seconds...", attributes: [NSFontAttributeName:titleFont!.fontWithSize(28), NSForegroundColorAttributeName:UIColor.whiteColor()]), forState: .Normal)
            if(self.counter == 0) {
                self.finish_tapped()
            }
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
    }

}
