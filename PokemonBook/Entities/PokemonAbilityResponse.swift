//
//  PokemonAbilityResponse.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 26.03.2023.
//

import Foundation

final class PokemonAbilityResponse: Decodable {
  var effectEntries: [PokemonAbilityEffectEntry]?
  var flavorTextEntries: [PokemonAbilityFlavorTextEntry]?
  
  enum CodingKeys: String, CodingKey {
    case effectEntries = "effect_entries"
    case flavorTextEntries = "flavor_text_entries"
  }
}

// Effect Entry
final class PokemonAbilityEffectEntry: Decodable {
  let effect: String?
  let language: PokemonResult?
  let shortEffect: String?
  
  enum CodingKeys: String, CodingKey {
    case effect
    case language
    case shortEffect = "short_effect"
  }
}

// Flavor Text Entries
final class PokemonAbilityFlavorTextEntry: Decodable {
  let flavorText: String?
  let language: PokemonResult?
  let versionGroup: PokemonResult
  
  enum CodingKeys: String, CodingKey {
    case flavorText = "flavor_text"
    case language
    case versionGroup = "version_group"
  }
}
