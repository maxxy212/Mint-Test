//
//  Commit.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 28/07/2020.
//  Copyright © 2020 Maxwell. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift
import ObjectMapper

class Commit: Object, Mappable {
    
    @objc dynamic var sha = ""
    @objc dynamic var node_id = ""
    @objc dynamic var commit: CommitMessage?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        sha <- map["sha"]
        node_id <- map["node_id"]
        commit <- map["commit"]
    }
}

