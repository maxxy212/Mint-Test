//
//  UIViewControllerExtention.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 28/07/2020.
//  Copyright © 2020 Maxwell. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func presentOkAlert(_ title: String, _ message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let uiAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
        present(uiAlert, animated: true)
        return
    }
}
