//
//  MainTabBarController.swift
//  InstagramApp
//
//  Created by Sinem Demirey on 15.01.2020.
//  Copyright © 2020 Sinem Demirey. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setTabBar()
    }
    
    func setTabBar(){
        
        let tabController = UITabBarController()
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let activityStoryboard = UIStoryboard(name: "Activity", bundle: nil)
        
        let homeVC = homeStoryboard.instantiateViewController(identifier: "Home") as! HomeViewController
        let searchVC = searchStoryboard.instantiateViewController(identifier: "Search") as! SearchViewController
        let newPostVC = newPostStoryboard.instantiateViewController(identifier: "NewPost") as! NewPostViewController
        let profileVC = profileStoryboard.instantiateViewController(identifier: "Profile") as! ProfileViewController
        let activityVC = activityStoryboard.instantiateViewController(identifier: "Activity") as! ActivityViewController
        
        let vcData: [(UIViewController, UIImage, UIImage)] = [
        
            (homeVC, UIImage(named: "home_tab_icon")!, UIImage(named: "home_selected_tab_icon")!),
            
            (searchVC, UIImage(named: "search_tab_icon")!, UIImage(named: "search_selected_tab_icon")!),
            
            (newPostVC, UIImage(named: "post_tab_icon")!, UIImage(named: "post_tab_icon")!),
            
            (activityVC, UIImage(named: "activity_tab_icon")!, UIImage(named: "activity_selected_tab_icon")!),
            
            (profileVC, UIImage(named: "profile_tab_icon")!, UIImage(named: "profile_selected_tab_icon")!)
        
        ]
        
        let vcs = vcData.map { (vc, defaultImage, selectedImage) -> UINavigationController in
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = defaultImage
            nav.tabBarItem.selectedImage = selectedImage
            return nav
        }
        
        tabController.viewControllers = vcs
        tabController.tabBar.isTranslucent = false
        
        if let items = tabController.tabBar.items{
            for item in items {
                if let image = item.image{
                    item.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
                if let selectedImage = item.selectedImage{
                    item.selectedImage = selectedImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
        
        UINavigationBar.appearance().backgroundColor = UIColor.white
        
    }

}
