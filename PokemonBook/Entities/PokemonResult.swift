//
//  PokemonResult.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import Foundation

final class PokemonResult: Decodable,Hashable {
  
  static func == (lhs: PokemonResult, rhs: PokemonResult) -> Bool {
    return lhs.name == rhs.name && lhs.detailURL == rhs.detailURL
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(name)
    hasher.combine(detailURL)
  }
  
  let name: String?
  let detailURL: URL?
  
  enum CodingKeys: String, CodingKey {
    case name
    case detailURL = "url"
  }
}
