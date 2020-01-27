//
//  Extension.swift
//  InstagramApp
//
//  Created by Sinem Demirey on 23.01.2020.
//  Copyright © 2020 Sinem Demirey. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    class func displayLoading(withView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: withView.bounds)
        spinnerView.backgroundColor = UIColor.clear
        let ai = UIActivityIndicatorView.init(style: .medium)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            withView.addSubview(spinnerView)
        }
        return spinnerView
    }
    
    class func removeLoading(spinner: UIView){
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
