//
//  CandidateVotingPage.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/13/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SDWebImage

class CandidateVotingPage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // Title 
        let title = UILabel()
        title.text = "Who would you get a beer with?"
        title.textAlignment = .Center
        title.font = titleFont?.fontWithSize(35)
        self.view.addSubview(title)
        title.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(60)
            make.height.equalTo(40)
        }
        
        // Finish button
        let finishButton = UIButton()
        finishButton.setAttributedTitle(NSAttributedString(string: "FINISH", attributes: [NSFontAttributeName:titleFont!.fontWithSize(28), NSForegroundColorAttributeName:UIColor.whiteColor()]), forState: .Normal)
        finishButton.backgroundColor = UIColor.purpleColor()
        finishButton.addTarget(self, action: "finish_tapped", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(finishButton)
        
        finishButton.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(60)
        }
        
        // Collection view
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 192, height: 192)
        flowLayout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        flowLayout.minimumLineSpacing = 100
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.registerClass(CandidateCollectionViewCell.self, forCellWithReuseIdentifier: "CandidateCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(collectionView)
        
        collectionView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(self.view).inset(25)
            make.top.equalTo(title.snp_bottom).offset(45)
            make.bottom.equalTo(finishButton.snp_top)
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
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return section == 0 ? UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25) : UIEdgeInsets(top: 25, left: 160, bottom: 25, right: 160)
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
    
    var firstRowCap = 4
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return (data?.candidates.count > firstRowCap ? 2 : 1)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0) {
           return min(firstRowCap, (data?.candidates.count)!)
        } else {
           return 3
        }
    }
    
    func finish_tapped() {
        self.navigationController?.pushViewController(ThankYouPage(), animated: true)
    }

}