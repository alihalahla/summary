//
//  SeparateTableView.swift
//  TestApp
//
//  Created by עלי חלאחלה on 02/11/2023.
//

import Foundation
import UIKit

extension UITableViewCell {

  func hideSeparator() {
    self.separatorInset = UIEdgeInsets(top: 0, left: self.bounds.size.width, bottom: 0, right: 0)
  }

  func showSeparator() {
    self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
}
