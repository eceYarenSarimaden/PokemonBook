//
//  PokemonTableViewCell.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import UIKit
import Kingfisher

final class PokemonTableViewCell: UITableViewCell {
  @IBOutlet weak var pokemonImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var abilityLabel: UILabel!
  @IBOutlet weak var experienceLabel: UILabel!
  
  func configure(pokemon: Pokemon) {
    pokemonImageView.kf.indicatorType = .activity
    pokemonImageView.kf.setImage(with: pokemon.sprites?.other?.homeImage?.url)
    
    let nameAttributedString = NSMutableAttributedString(string: "Name: ", attributes: [
      .font: UIFont.systemFont(ofSize: 17, weight: .bold)
    ])
    
    let nameValueAttributedString = NSAttributedString(string: pokemon.name?.capitalizeFirstLetter() ?? "No Name", attributes: [
      .font: UIFont.systemFont(ofSize: 17, weight: .regular)
    ])
    nameAttributedString.append(nameValueAttributedString)
    
    nameLabel.attributedText = nameAttributedString
    
    if let type = pokemon.types?.first {
      let typeAttributedString = NSMutableAttributedString(string: "Type: ", attributes: [
        .font: UIFont.systemFont(ofSize: 17, weight: .bold)
      ])
      
      let typeNameAttributedString = NSAttributedString(string: type.type?.name?.capitalizeFirstLetter() ?? "No Type Name", attributes: [
        .font: UIFont.systemFont(ofSize: 17, weight: .regular)
      ])
      typeAttributedString.append(typeNameAttributedString)
      
      typeLabel.attributedText = typeAttributedString
    }
    
    if let ability = pokemon.abilities?.first {
      let abilityAttributedString = NSMutableAttributedString(string: "Ability: ", attributes: [
        .font: UIFont.systemFont(ofSize: 17, weight: .bold)
      ])
      
      let abilityNameAttributedString = NSAttributedString(string: ability.ability?.name?.capitalizeFirstLetter() ?? "No Ability", attributes: [
        .font: UIFont.systemFont(ofSize: 17, weight: .regular)
      ])
      abilityAttributedString.append(abilityNameAttributedString)
      
      abilityLabel.attributedText = abilityAttributedString
    }
    
    // Experience
    let experienceAttributedString = NSMutableAttributedString(string: "Experience: ", attributes: [
      .font: UIFont.systemFont(ofSize: 17, weight: .bold)
    ])
    
    let experienceNameAttributedString = NSAttributedString(string: pokemon.experience?.description ?? "No Experience", attributes: [
      .font: UIFont.systemFont(ofSize: 17, weight: .regular)
    ])
    experienceAttributedString.append(experienceNameAttributedString)
    
    experienceLabel.attributedText = experienceAttributedString
  }
}
