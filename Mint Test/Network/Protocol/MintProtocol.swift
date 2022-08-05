//
//  MintProtocol.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 05/08/2022.
//  Copyright © 2022 Maxwell. All rights reserved.
//

import Foundation

protocol MintProtocol {
    
    func getCommit(completionHandler: @escaping (NetworkResponseModel) -> Void)
}
