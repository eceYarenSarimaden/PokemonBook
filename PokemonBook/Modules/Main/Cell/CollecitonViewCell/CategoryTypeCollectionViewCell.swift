//
//  CategoryCollectionViewCell.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 23.03.2023.
//

import UIKit

final class CategoryTypeCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var categoryLabel: UILabel!
  
  func configure(categoryName: String, isSelected: Bool) {
    categoryLabel.text = categoryName
    categoryLabel.borderWidth = isSelected ? 2.0 : 0
  }
}
