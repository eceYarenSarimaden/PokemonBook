//
//  PokemonStat.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 23.03.2023.
//

import Foundation

final class PokemonStat: Decodable {
  let baseStat: Int?
  let effort: Int?
  let stat: PokemonResult?
  
  enum CodingKeys: String, CodingKey {
    case baseStat = "base_stat"
    case effort
    case stat
  }
}
