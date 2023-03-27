//
//  PokemonFeatureCollectionReusableView.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 26.03.2023.
//

import UIKit

final class PokemonFeatureCollectionReusableView: UICollectionReusableView {
  private let label = UILabel()
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    label.frame = bounds
  }
  
  func configure(title: String) {
    addSubview(label)
    label.frame = bounds
    label.textAlignment = .center
    
    label.attributedText = NSMutableAttributedString(string: title, attributes: [
      .font: UIFont.boldSystemFont(ofSize: 14),
      .foregroundColor: UIColor.red,
    ])
  }
}
