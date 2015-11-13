//
//  ViewController.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/12/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (self.view.bounds.width/2)-100, height: (self.view.bounds.height/2)-100)
        flowLayout.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.registerClass(PolicyCollectionViewCell.self, forCellWithReuseIdentifier: "PolicyCell")
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(collectionView)
        
        collectionView.snp_makeConstraints { (make) -> Void in
            make.left.top.bottom.right.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier("PolicyCell", forIndexPath: indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (data?.policies.count)!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


}