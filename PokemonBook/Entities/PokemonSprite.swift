//
//  PokemonSprite.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 23.03.2023.
//

import Foundation

final class PokemonSprite: Decodable {
  let backDefault: URL?
  let frontDefault: URL?
  let other: PokemonSpriteOther?
  
  enum CodingKeys: String, CodingKey {
    case backDefault = "back_default"
    case frontDefault = "front_default"
    case other
  }
}

final class PokemonSpriteOther: Decodable {
  let homeImage: PokemonSpriteOtherResponse?
  let artImage: PokemonSpriteOtherResponse?
  
  enum CodingKeys: String, CodingKey {
    case homeImage = "home"
    case artImage = "official-artwork"
  }
}

final class PokemonSpriteOtherResponse: Decodable {
  let url: URL?
  
  enum CodingKeys: String, CodingKey {
    case url = "front_default"
  }
}
