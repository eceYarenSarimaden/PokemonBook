//
//  PokemonCategory.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 24.03.2023.
//

import Foundation

final class PokemonCategory: Hashable {
  var type: String
  var isSelected: Bool = false
  
  init(type: String, isSelected: Bool) {
    self.type = type
    self.isSelected = isSelected
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(type)
  }
  
  static func == (lhs: PokemonCategory, rhs: PokemonCategory) -> Bool {
    return lhs.type == rhs.type
  }
  
}
