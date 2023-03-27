//
//  PokemonDetail.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 25.03.2023.
//

import Foundation

final class PokemonDetail {
  var type: PokemonDetailType
  var value: String?
  var results: [PokemonResult] = []
  
  init(type: PokemonDetailType, results: [PokemonResult] = []) {
    self.type = type
    self.results = results
  }
  
  init(type: PokemonDetailType, value: String) {
    self.type = type
    self.value = value
  }
}

enum PokemonDetailType {
  case abilities
  case baseExperience
  case forms
  case gameIndices
  case height
  case heldItems
  case id
  case isDefault
  case locationAreaEncounters
  case moves
  case order
  case species
  case sprites
  case stats
  case types
  case weight
  
  var title: String {
    switch self {
    case .abilities:
      return "Abilities"
    case .baseExperience:
      return "Base Experience"
    case .forms:
      return "Forms"
    case .gameIndices:
      return "Game Indices"
    case .height:
      return "Height"
    case .heldItems:
      return "Held Items"
    case .isDefault:
      return "Is Default"
    case .locationAreaEncounters:
      return "Location Area Encounters"
    case .moves:
      return "Moves"
    case .order:
      return "Order"
    case .species:
      return "Species"
    case .sprites:
      return "Sprites"
    case .stats:
      return "Stats"
    case .types:
      return "Types"
    case .weight:
      return "Weight"
    case .id:
      return "Id"
    }
  }
}
