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
            if let content = data?.policies[indexPath.row].content {
                policyCell.content = content
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.policies.count ?? 0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        nextButton.backgroundColor = textColor
        nextButton.enabled = true
        selectedPolicy = data?.policies[indexPath.row]
        selectedPolicyName = labels[indexPath.row]
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    func next_tapped() {
        self.navigationController?.pushViewController(CandidateVotingPage(), animated: true)
    }


}