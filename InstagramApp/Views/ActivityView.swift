//
//  ActivityView.swift
//  InstagramApp
//
//  Created by Sinem Demirey on 21.01.2020.
//  Copyright © 2020 Sinem Demirey. All rights reserved.
//

import UIKit

class ActivityView: UIView, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var activityTableView: UITableView!
    
    var activityData : [Activity] = [Activity]() {
        didSet{
            activityTableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityTableView.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityTableViewCell")
        activityTableView.delegate = self
        activityTableView.dataSource = self
        activityTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat((80.0))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityData.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = activityTableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell") as! ActivityTableViewCell
        cell.profileImage.image = activityData[indexPath.row].userImage
        cell.detailsLabel.text = activityData[indexPath.row].details
        return cell
    }
}
