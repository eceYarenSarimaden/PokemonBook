//
//  CategoryCollectionViewCell.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 23.03.2023.
//

import UIKit

class CategoryTypeCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var categoryLabel: UILabel!
  
  func configure(categoryName: String, isSelected: Bool) {
    categoryLabel.text = categoryName
    categoryLabel.backgroundColor = isSelected ? UIColor.lightGray : UIColor.clear
    categoryLabel.textColor = isSelected ? UIColor.white : UIColor.black
    categoryLabel.borderWidth = isSelected ? 1.0 : 0
    
    //categoryBackgroundView.layer.borderColor = isSelected ? UIColor.orange.cgColor : UIColor.clear.cgColor
//    categoryBackgroundView.layer.borderWidth = isSelected ? 1.0 : 0
    
  }
}
