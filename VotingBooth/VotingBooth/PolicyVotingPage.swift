//
//  ViewController.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/12/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SnapKit

class PolicyVotingPage: UIViewController, UICollectionViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (self.view.bounds.width/2)-80, height: (self.view.bounds.height/2)-150)
        flowLayout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        flowLayout.minimumLineSpacing = 60
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.registerClass(PolicyCollectionViewCell.self, forCellWithReuseIdentifier: "PolicyCell")
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.clearColor()
        
        self.view.addSubview(collectionView)
        
        collectionView.snp_makeConstraints { (make) -> Void in
            make.left.top.bottom.right.equalTo(self.view).inset(25)
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
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (data?.policies.count)!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


}