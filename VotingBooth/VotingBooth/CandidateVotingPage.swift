//
//  CandidateVotingPage.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/13/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SDWebImage

class CandidateVotingPage: PageViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var nextButton = UIButton()
    
    override func viewWillAppear(animated: Bool) {
        
        // Next Button
        nextButton.setAttributedTitle(NSAttributedString(string: "Next", attributes: [NSFontAttributeName:titleFont!.fontWithSize(35), NSForegroundColorAttributeName:UIColor.whiteColor()]), forState: .Normal)
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.whiteColor().CGColor
        nextButton.backgroundColor = UIColor(white: 200/255, alpha: 1)
        nextButton.enabled = false
        nextButton.addTarget(self, action: "next_tapped", forControlEvents: .TouchUpInside)
        
        self.container.addSubview(nextButton)
        
        nextButton.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self.container)
            make.height.equalTo(60)
        }
        
        // Header
        let header1 = UILabel()
        header1.text = "Select a"
        header1.textColor = textColor
        header1.font = titleFont?.fontWithSize(55)
        self.container.addSubview(header1)
        header1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.container.snp_top).offset(50)
            make.left.right.equalTo(self.container).inset(125)
            make.height.equalTo(70)
        }
        
        let header2 = UILabel()
        header2.text = "Candidate"
        header2.textColor = textColor
        header2.font = largeTitleFont?.fontWithSize(60)
        self.container.addSubview(header2)
        header2.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(header1.snp_bottom).offset(10)
            make.centerX.equalTo(self.container.snp_centerX).offset(50)
            make.height.equalTo(70)
        }
        
        // Collection view
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 170, height: 170)
        flowLayout.sectionInset = UIEdgeInsets(top: 25, left: 100, bottom: 25, right: 100)
        flowLayout.minimumLineSpacing = 50
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.registerClass(CandidateCollectionViewCell.self, forCellWithReuseIdentifier: "CandidateCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(collectionView)
        
        collectionView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(header2.snp_bottom).offset(20)
            make.bottom.equalTo(nextButton.snp_top).offset(-20)
            make.left.right.equalTo(self.container).inset(20)
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.layer.removeAllAnimations()
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        let animation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = cell?.layer.shadowColor
        animation.toValue = UIColor(red: 70/255, green: 32/255, blue: 102/255, alpha: 1).CGColor
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        cell?.layer.addAnimation(animation, forKey: "shadowColor")
        
        let shadowWidthAnimation = CABasicAnimation(keyPath: "shadowRadius")
        shadowWidthAnimation.fromValue = cell?.layer.shadowRadius
        shadowWidthAnimation.toValue = (cell?.layer.shadowRadius)! * 2
        shadowWidthAnimation.duration = 0.5
        shadowWidthAnimation.autoreverses = true
        shadowWidthAnimation.repeatCount = .infinity
        shadowWidthAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        cell?.layer.addAnimation(shadowWidthAnimation, forKey: "shadowRadius")
        
        print(indexPath.section*4 + indexPath.row)
        selectedCandidate = data?.candidates[indexPath.section*4 + indexPath.row]
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CandidateCell", forIndexPath: indexPath)
        let candidateCell = cell as? CandidateCollectionViewCell
        if(candidateCell == nil) {
            return cell
        } else if let imageUrl = data?.candidates[indexPath.row].imageUrl {
            let url = NSURL(string: imageUrl)
            candidateCell!.imageViewer.sd_setImageWithURL(url)
            return candidateCell!
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.candidates.count ?? 0
    }
    
    func finish_tapped() {
        self.navigationController?.pushViewController(ThankYouPage(), animated: true)
    }

}