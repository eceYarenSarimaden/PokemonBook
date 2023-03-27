//
//  PokemonMove.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import Foundation

final class PokemonMove: Decodable {
  let move: PokemonResult?
  let versionGroupDetails: [PokemonVersionGroupDetail]?
  
  enum CodingKeys: String, CodingKey {
    case move
    case versionGroupDetails = "version_group_details"
  }
}

final class PokemonVersionGroupDetail: Decodable {
  let levelLearnedAt: Int?
  let moveLearnMethod: PokemonResult?
  let versionGroup: PokemonResult?
  
  enum CodingKeys: String, CodingKey {
    case levelLearnedAt = "level_learned_at"
    case moveLearnMethod = "move_learn_method"
    case versionGroup = "version_group"
  }
}
