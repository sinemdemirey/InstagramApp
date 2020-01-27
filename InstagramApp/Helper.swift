//
//  Helper.swift
//  InstagramApp
//
//  Created by Sinem Demirey on 23.01.2020.
//  Copyright © 2020 Sinem Demirey. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    class func errorAlert(title : String, message : String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        return alert
    }
}


