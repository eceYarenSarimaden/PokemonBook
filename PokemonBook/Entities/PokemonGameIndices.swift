//
//  PokemonGameIndices.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import Foundation

final class PokemonGameIndices: Decodable {
  let index: Int?
  let version: PokemonResult?
  
  enum CodingKeys: String, CodingKey {
    case index = "game_index"
    case version
  }
}
