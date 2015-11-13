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
    
    init(data: JSONDictionary) {
        self.id <-- data["_id"]
        self.content <-- data["desc"]
    }
}

struct Candidate : Deserializable {
    var id : String = ""
    var name : String = ""
    var imageUrl : String = ""
    
    init(data: JSONDictionary) {
        self.id <-- data["_id"]
        self.name <-- data["name"]
        self.imageUrl <-- data["image_url"]
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
