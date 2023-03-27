//
//  Pokemon.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 23.03.2023.
//

import Foundation

final class Pokemon: Decodable {
  var abilities: [PokemonAbility]?
  var experience: Int?
  var forms: [PokemonResult]?
  var gameIndices: [PokemonGameIndices]?
  var height: Int?
  var heldItems: [PokemonHeldItem]?
  var id: Int?
  var isDefault: Bool?
  var locationAreaEncounters: URL?
  var moves: [PokemonMove]?
  var name: String?
  var order: Int?
  var species: PokemonResult?
  var sprites: PokemonSprite?
  var stats: [PokemonStat]?
  var types: [PokemonType]?
  var weight: Int?
  
  enum CodingKeys: String, CodingKey {
    case abilities
    case experience = "base_experience"
    case forms
    case gameIndices = "game_indices"
    case height
    case heldItems = "held_items"
    case id
    case isDefault = "is_default"
    case locationAreaEncounters = "location_area_encounters"
    case moves
    case name
    case order
    case species
    case sprites
    case stats
    case types
    case weight
  }
}
