//
//  PokemonType.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 23.03.2023.
//

import Foundation

final class PokemonType: Decodable, Hashable {
  static func == (lhs: PokemonType, rhs: PokemonType) -> Bool {
    return lhs.type == rhs.type
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(type)
  }
  
  let type: PokemonResult?
}
