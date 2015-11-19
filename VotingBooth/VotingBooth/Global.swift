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

var titleFont = UIFont(name: "Superclarendon-BoldItalic", size: 30)
var headerFont = UIFont(name: "Avenir", size: 60)

var selectedPolicy : Policy?
var selectedCandidate : Candidate?