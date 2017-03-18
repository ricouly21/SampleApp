//
//  TableSection.swift
//  SampleApp
//
//  Created by justine tabin on 18/03/2017.
//  Copyright © 2017 Ulyses Rico. All rights reserved.
//

import Foundation
import UIKit


class TableSection: NSObject {
  var identifier: String
  var numberOfRows: Int
  
  init(identifier: String, numberOfRows: Int) {
    self.identifier = identifier
    self.numberOfRows = numberOfRows
  }
  
  convenience override init() {
    self.init()
  }
  
}
