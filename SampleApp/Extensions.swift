//
//  Extensions.swift
//  SampleApp
//
//  Created by justine tabin on 18/03/2017.
//  Copyright © 2017 Ulyses Rico. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
  
  func initLeftMenuButton() {
    let leftMenuButton = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(self.openLeft))
    self.navigationItem.setLeftBarButton(leftMenuButton, animated: false)
  }
  
}


extension UIView {
  
  @IBInspectable var rounded: Bool {
    // Turn UIView into a circle
    // Default is off
    get {
      return false
    }
    set {
      layer.masksToBounds = !newValue
      layer.cornerRadius = newValue == true ? frame.height/2 : 0
      clipsToBounds = newValue
    }
  }
  
  @IBInspectable var borderColor: UIColor {
    // Add a border with chosen color to UIView
    // Default is UIColor.clear
    get {
      return .clear
    }
    set {
      layer.masksToBounds = false
      layer.borderColor = newValue.cgColor
    }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    // Add a border with chosen width to UIView
    // Default is 0
    get {
      return 0
    }
    set {
      layer.masksToBounds = false
      layer.borderWidth = newValue > 0 ? newValue : 1
    }
  }
  
}
