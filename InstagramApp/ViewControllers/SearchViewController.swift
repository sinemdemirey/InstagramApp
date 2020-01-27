//
//  SearchViewController.swift
//  InstagramApp
//
//  Created by Sinem Demirey on 15.01.2020.
//  Copyright © 2020 Sinem Demirey. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var exploreCollectionView: UICollectionView!
    
    var searchController : UISearchController!
    lazy var posts : [Post] = {
        let model = Model()
        return model.postList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exploreCollectionView.delegate = self
        exploreCollectionView.dataSource = self
        searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.showsCancelButton = false
        
        for subview in searchController.searchBar.subviews{
            for subview1 in subview.subviews {
                if let textField = subview1 as? UITextField {
                    textField.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
                    textField.textAlignment = NSTextAlignment.center
                }
            }
        }
        
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = true
        let searchBarContainer = SearchBarContainerView(customSearchBar: searchController.searchBar)
        searchBarContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        navigationItem.titleView = searchBarContainer
    }

}

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as! ExploreCollectionViewCell
        cell.exploreImage.image = posts[indexPath.row].postImage
        return cell
    }
    
    
}
