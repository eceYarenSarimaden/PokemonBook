//
//  PokemonDetailTableViewCell.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 24.03.2023.
//

import UIKit

final class PokemonDetailTableViewCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var arrowImageView: UIImageView!
  
  func configure(pokemonDetail: PokemonDetail) {
    nameLabel.text = pokemonDetail.type.title
    countLabel.text = pokemonDetail.value == nil ? "" : pokemonDetail.value
    
    arrowImageView.isHidden = pokemonDetail.value != nil
  }
}
