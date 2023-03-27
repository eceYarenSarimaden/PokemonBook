//
//  PokemonManager.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 23.03.2023.
//

import Foundation

final class PokemonManager {
  static let shared = PokemonManager()
  
  private let apiService = APIService()
  
  var pokemons: [Pokemon] = []
  var didFinish: (() -> Void)?

  func setup(url: URL? = nil) {
    apiService.getPokemons(url: url) { [weak self] pokemonResponse in
      guard let pokemonResults = pokemonResponse?.results,
            let nextUrl = pokemonResponse?.next else { return }
      
      self?.loadPokemons(pokemonResults: pokemonResults, nextUrl: nextUrl)
    }
  }
  
  func loadPokemons(pokemonResults: [PokemonResult], nextUrl: URL) {
    for pokemonResult in pokemonResults {
      guard let url = pokemonResult.detailURL else { return }
      
      apiService.getPokemonDetail(url: url) { [weak self] pokemon in
        guard let pokemon = pokemon else { return }
        
        self?.pokemons.append(pokemon)
    
        if (self?.pokemons.count ?? 1) % pokemonResults.count == 0 {
          self?.didFinish?()
          
          self?.setup(url: nextUrl)
        }
      }
    }
  }
}
