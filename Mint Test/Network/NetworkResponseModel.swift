//
//  NetworkResponseModel.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 28/07/2020.
//  Copyright © 2020 Maxwell. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct NetworkResponseModel {
    var statusCode: Int
    var title: String?
    var generalMessage: String?
    var data: Any?
    var success = false
    var error: Error?
    
    init() {
        self.statusCode = 0
    }
    
    init(statusCode: Int) {
        self.statusCode = statusCode
    }
    
    init(error: Error) {
        self.error = error
        self.statusCode = 0
    }
    
    init(statusCode: Int, error: Error, data: JSON) {
        self.error = error
        self.data = data
        self.statusCode = statusCode
    }
    
    init(statusCode: Int, error: Error) {
        self.error = error
        self.statusCode = statusCode
    }
}
