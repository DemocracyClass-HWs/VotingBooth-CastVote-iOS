//
//  DataModel.swift
//  VotingBooth
//
//  Created by Peyman Mortazavi on 11/12/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit
import JSONHelper

class Statistics : NSObject {
    var policies: NSDictionary?
    var candidates: NSDictionary?
}

struct Policy : Deserializable {
    var id : String = ""
    var content : String = ""
    var corrospondingCandidateId : String = ""
    
    init(data: JSONDictionary) {
        self.id <-- data["_id"]
        self.content <-- data["desc"]
        self.corrospondingCandidateId <-- data["corrospondingCandidateId"]
    }
}

enum Party : String {
    case Democratic = "D"
    case Republican = "R"
    case None       = "N"
}

struct Candidate : Deserializable {
    var id : String = ""
    var name : String = ""
    var imageUrl : String = ""
    var party : Party
    
    init(data: JSONDictionary) {
        self.id <-- data["_id"]
        self.name <-- data["name"]
        self.imageUrl <-- data["image_url"]
        if let partyStringValue = data["party"] as? String, party = Party(rawValue: partyStringValue) {
            self.party = party
        } else {
            self.party = Party.None
        }
    }
}

struct DataModel: Deserializable {
    var policies = [Policy]()
    var candidates = [Candidate]()
    
    init(data: JSONDictionary) {
        self.policies <-- data["policies"]
        self.candidates <-- data["candidates"]
    }
}

struct SparkCloudAuthentication : Deserializable {
    var username = ""
    var password = ""
    
    init(data: JSONDictionary) {
        self.username <-- data["username"]
        self.password <-- data["password"]
    }
}
