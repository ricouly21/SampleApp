//
//  SlideMenuContainerController.swift
//  SampleApp
//
//  Created by justine tabin on 18/03/2017.
//  Copyright © 2017 Ulyses Rico. All rights reserved.
//

import Foundation
import UIKit


class SlideMenuContainerController: SlideMenuController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let main = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") {
      self.mainViewController = main
    }
    
    if let leftMenu = self.storyboard?.instantiateViewController(withIdentifier: "LeftMenuController") {
      self.leftViewController = leftMenu
    }
    
  }
  
}
