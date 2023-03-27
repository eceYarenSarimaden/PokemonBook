//
//  PokemonHeldItem.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import Foundation

final class PokemonHeldItem: Decodable {
  let item: PokemonResult?
  let versionDetails: [PokemonHeldItemVersionDetail]?
  
  enum CodingKeys: String, CodingKey {
    case item
    case versionDetails = "version_details"
  }
}

final class PokemonHeldItemVersionDetail: Decodable {
  let rarity: Int?
  let version: PokemonResult?
}
