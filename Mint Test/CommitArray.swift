//
//  CommitArray.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 28/07/2020.
//  Copyright © 2020 Maxwell. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift
import ObjectMapper


class CommitArray: Object, Mappable {
    
    let data = List<Commit>()
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        <#code#>
    }
    
}
