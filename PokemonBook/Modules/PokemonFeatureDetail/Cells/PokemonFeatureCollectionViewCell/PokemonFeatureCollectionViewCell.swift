//
//  PokemonFeatureCollectionViewCell.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 25.03.2023.
//

import UIKit

final class PokemonFeatureCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var featureTitleLabel: UILabel!
  @IBOutlet weak var featureDescription: UILabel!
  
  func configure(abilityDetail: PokemonAbilityDetail) {
    let titleAttributedString = NSMutableAttributedString(string: abilityDetail.title.key + ": ", attributes: [
      .font: UIFont.systemFont(ofSize: 14, weight: .semibold)
    ])
    
    let titleValueAttributedString = NSAttributedString(string: abilityDetail.title.value, attributes: [
      .font: UIFont.systemFont(ofSize: 14, weight: .medium)
    ])
    titleAttributedString.append(titleValueAttributedString)
    
    featureTitleLabel.attributedText = titleAttributedString
    
    // Description
    if abilityDetail.description.key != "", abilityDetail.description.value != "" {
      let descriptionAttributedString = NSMutableAttributedString(string: abilityDetail.description.key + ": ", attributes: [
        .font: UIFont.systemFont(ofSize: 14, weight: .semibold)
      ])
      
      let descriptionValueAttributedString = NSAttributedString(string: abilityDetail.description.value, attributes: [
        .font: UIFont.systemFont(ofSize: 14, weight: .medium)
      ])
      descriptionAttributedString.append(descriptionValueAttributedString)
      
      featureDescription.attributedText = descriptionAttributedString
      featureDescription.isHidden = false
    } else {
      featureDescription.isHidden = true
    }
  }
}
