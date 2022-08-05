//
//  MintViewModel.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 05/08/2022.
//  Copyright © 2022 Maxwell. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class MintViewModel {
    
    private var mintService = MintService()
    
    let success = Box(false)
    let errMessage = Box("")
    
    func getCommitMessages() {
        mintService.getCommit { responseModel in
            if responseModel.success{
                self.success.value = true
            }else{
                self.success.value = false
                self.errMessage.value = responseModel.generalMessage ?? ""
            }
        }
    }
}
