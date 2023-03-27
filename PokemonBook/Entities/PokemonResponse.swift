//
//  PokemonResponse.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import Foundation

final class PokemonResponse: Decodable {
  let next: URL?
  let results: [PokemonResult]?
}
