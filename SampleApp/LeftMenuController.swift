//
//  LeftMenuController.swift
//  SampleApp
//
//  Created by justine tabin on 18/03/2017.
//  Copyright © 2017 Ulyses Rico. All rights reserved.
//

import Foundation
import UIKit


class LeftMenuController: UIViewController {
  
  @IBOutlet weak var mainTableView: UITableView!
  @IBOutlet weak var logoutButton: UIButton!
  
  var tableSections = [TableSection]()
  
  let user = ["full_name": "Ulyses Rico", "position": "iOS App Developer"]
  
  let menuItems = ["Home", "Profile", "Notifications", "Settings", "About"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.mainTableView.delegate = self
    self.mainTableView.dataSource = self
    self.mainTableView.tableFooterView = UIView()
    
    self.tableSections.append(TableSection(identifier: "headerCell", numberOfRows: 1))
    self.tableSections.append(TableSection(identifier: "itemCell", numberOfRows: menuItems.count))
    
  }
  
}

// MARK: UITableView Data Source

extension LeftMenuController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let section = self.tableSections[indexPath.section] as TableSection? {
      
      var cell = tableView.dequeueReusableCell(withIdentifier: section.identifier, for: indexPath)
      
      if section.identifier == "headerCell" {
        let cell = cell as! LeftMenuHeaderCell
        cell.fullNameLabel.text = self.user["full_name"]
        cell.positionLabel.text = self.user["position"]
      }
      
      if section.identifier == "itemCell" {
        let cell = cell as! LeftMenuItemCell
        cell.itemLabel.text = self.menuItems[indexPath.row]
      }
      
      return cell
      
    }
    
    
    return UITableViewCell()
    
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.tableSections.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.tableSections[section].numberOfRows
  }
  
}

// MARK: UITableView Delegates

extension LeftMenuController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    let item = self.menuItems[indexPath.row]
    var vc: UIViewController?
    
    if let slideMenuController = self.slideMenuController() {
      if item == "Home" {
        vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
      }
      if item == "Profile" {
        vc = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController()
      }
      
      if let showVC = vc {
        slideMenuController.changeMainViewController(showVC, close: true)
      }
    }
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
}

// MARK: UITableView ScrollView Delegates

extension LeftMenuController {
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    // Removes slide menu gestures when dragging UITableView begins
    if let slideMenuController = self.slideMenuController() {
      slideMenuController.removeLeftGestures()
    }
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    // Returns the slide menu gestures when dragging UITableView ends
    if let slideMenuController = self.slideMenuController() {
      slideMenuController.addLeftGestures()
    }
  }
  
}


class LeftMenuHeaderCell: UITableViewCell {
  
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var fullNameLabel: UILabel!
  @IBOutlet weak var positionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.selectionStyle = .none
    
  }
  
}


class LeftMenuItemCell: UITableViewCell {
  
  @IBOutlet weak var itemLabel: UILabel!
  
}
