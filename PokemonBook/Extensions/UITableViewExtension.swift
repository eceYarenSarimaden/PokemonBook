//
//  UITableViewExtension.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import UIKit

extension UITableView {
  var contentSizeHeight: CGFloat {
    var height = CGFloat(0)
    
    for section in 0..<numberOfSections {
      height = height + rectForHeader(inSection: section).height
      let rows = numberOfRows(inSection: section)
      for row in 0..<rows {
        height = height + rectForRow(at: IndexPath(row: row, section: section)).height
      }
    }
    return height
  }
}
