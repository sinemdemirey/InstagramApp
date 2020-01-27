//
//  NewPostViewController.swift
//  InstagramApp
//
//  Created by Sinem Demirey on 15.01.2020.
//  Copyright © 2020 Sinem Demirey. All rights reserved.
//

import UIKit

enum NewPostPagesToShow : Int {
    case library, camera
    
    var identifier : String {
        switch self {
        case .library:
            return "PhotoLibraryVC"
        case .camera:
            return "CameraVC"
        }
    }
    
    static func pagesToShow() -> [NewPostPagesToShow] {
        return [.library, .camera]
    }
}

class NewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func cancelButtonPressed(){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func libraryButtonDidTouch(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPagesToShow.library)
    }
    
    @IBAction func photoButtonDidTouch(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPagesToShow.camera)
    }
}
