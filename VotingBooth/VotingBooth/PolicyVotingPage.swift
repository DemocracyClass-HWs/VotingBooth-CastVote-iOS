//
//  ViewController.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/12/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SnapKit

class PolicyVotingPage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let nextButton = UIButton()
        nextButton.setAttributedTitle(NSAttributedString(string: "NEXT", attributes: [NSFontAttributeName:titleFont!.fontWithSize(28), NSForegroundColorAttributeName:UIColor.whiteColor()]), forState: .Normal)
        nextButton.backgroundColor = UIColor.purpleColor()
        nextButton.addTarget(self, action: "next_tapped", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(nextButton)
        
        nextButton.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(60)
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (self.view.bounds.width/2)-80, height: (self.view.bounds.height/2)-150)
        flowLayout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        flowLayout.minimumLineSpacing = 60
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.registerClass(PolicyCollectionViewCell.self, forCellWithReuseIdentifier: "PolicyCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(collectionView)
        
        collectionView.snp_makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(self.view).inset(25)
            make.bottom.equalTo(nextButton.snp_top)
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PolicyCell", forIndexPath: indexPath)
        let policyCell = cell as? PolicyCollectionViewCell
        if(policyCell == nil){
            return cell
        } else {
            policyCell?.title.text = data?.policies[indexPath.row].content
            return policyCell!
        }
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
        selectedPolicy = data?.policies[indexPath.row]
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.layer.removeAllAnimations()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (data?.policies.count)!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func next_tapped() {
        self.navigationController?.pushViewController(CandidateVotingPage(), animated: true)
    }


}