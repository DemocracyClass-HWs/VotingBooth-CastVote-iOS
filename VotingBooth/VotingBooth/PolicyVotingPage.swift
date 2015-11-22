//
//  ViewController.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/12/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import SnapKit

class PolicyVotingPage: PageViewController, UITableViewDataSource, UITableViewDelegate {
    
    let CellIdentifier = "PolicyTableViewCell"
    var nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        header1.text = "Select by"
        header1.textColor = textColor
        header1.font = titleFont?.fontWithSize(55)
        self.container.addSubview(header1)
        header1.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.container.snp_top).offset(50)
            make.left.right.equalTo(self.container).inset(125)
            make.height.equalTo(70)
        }
        
        let header2 = UILabel()
        header2.text = "Positions"
        header2.textColor = textColor
        header2.font = largeTitleFont?.fontWithSize(60)
        self.container.addSubview(header2)
        header2.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(header1.snp_bottom).offset(10)
            make.centerX.equalTo(self.container.snp_centerX).offset(50)
            make.height.equalTo(70)
        }
        
        // Table view
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(PolicyTableViewCell.self, forCellReuseIdentifier: CellIdentifier)
        tableView.separatorStyle = .None
        self.container.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(header2.snp_bottom).offset(20)
            make.bottom.equalTo(nextButton.snp_top).offset(-20)
            make.left.right.equalTo(self.container).inset(20)
        }
    }
    
    let labels = ["A", "B", "C", "D", "E", "F", "G"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath)
        if let policyCell = cell as? PolicyTableViewCell {
            policyCell.label = labels[indexPath.row]
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.policies.count ?? 0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        nextButton.backgroundColor = textColor
        nextButton.enabled = true
        print("selected")
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("deselected")
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    //let tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
    
    
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: (self.view.bounds.width/2)-80, height: (self.view.bounds.height/2)-150)
//        flowLayout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
//        flowLayout.minimumLineSpacing = 60
//        
//        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
//        collectionView.registerClass(PolicyCollectionViewCell.self, forCellWithReuseIdentifier: "PolicyCell")
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        
//        collectionView.backgroundColor = UIColor.clearColor()
//        self.view.addSubview(collectionView)
//        
//        collectionView.snp_makeConstraints { (make) -> Void in
//            make.left.top.right.equalTo(self.view).inset(25)
//            make.bottom.equalTo(nextButton.snp_top)
//        }
//    }
    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PolicyCell", forIndexPath: indexPath)
//        let policyCell = cell as? PolicyCollectionViewCell
//        if(policyCell == nil){
//            return cell
//        } else {
//            policyCell?.title.text = data?.policies[indexPath.row].content
//            return policyCell!
//        }
//    }
//    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        
//        let cell = collectionView.cellForItemAtIndexPath(indexPath)
//        let animation = CABasicAnimation(keyPath: "shadowColor")
//        animation.fromValue = cell?.layer.shadowColor
//        animation.toValue = UIColor(red: 70/255, green: 32/255, blue: 102/255, alpha: 1).CGColor
//        animation.duration = 0.5
//        animation.autoreverses = true
//        animation.repeatCount = .infinity
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        cell?.layer.addAnimation(animation, forKey: "shadowColor")
//        selectedPolicy = data?.policies[indexPath.row]
//    }
//    
//    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
//        
//        let cell = collectionView.cellForItemAtIndexPath(indexPath)
//        cell?.layer.removeAllAnimations()
//    }
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (data?.policies.count)!
//    }
//    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func next_tapped() {
        self.navigationController?.pushViewController(CandidateVotingPage(), animated: true)
    }


}