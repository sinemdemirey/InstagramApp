//
//  SearchBarContainerView.swift
//  InstagramApp
//
//  Created by Sinem Demirey on 16.01.2020.
//  Copyright © 2020 Sinem Demirey. All rights reserved.
//

import UIKit

class SearchBarContainerView: UIView {
    
    let searchBar : UISearchBar!
    
    init(customSearchBar : UISearchBar) {
        searchBar = customSearchBar
        super.init(frame: CGRect.zero)
        addSubview(searchBar)
    }
    
    convenience override init(frame : CGRect) {
        self.init(customSearchBar : UISearchBar())
        self.frame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchBar.frame = bounds
    }
    
}
