//
//  Global.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/12/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import Foundation
import SIOSocket

var socket: SIOSocket?

var data: DataModel?

var titleFont = UIFont(name: "Superclarendon-Italic", size: 30)
var largeTitleFont = UIFont(name: "Superclarendon-BoldItalic", size: 30)
var headerFont = UIFont(name: "Superclarendon", size: 60)

var textColor = UIColor(red: 15/255, green: 127/255, blue: 254/255, alpha: 1)
var borderColor = UIColor(red: 158/255, green: 11/255, blue: 15/255, alpha: 1)

var selectedPolicy : Policy?
var selectedCandidate : Candidate?