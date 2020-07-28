//
//  CommitMessage.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 28/07/2020.
//  Copyright © 2020 Maxwell. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift
import ObjectMapper

class CommitMessage: Object, Mappable {
    
    @objc dynamic var message = ""
    @objc dynamic var url = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        url <- map["url"]
    }
}
