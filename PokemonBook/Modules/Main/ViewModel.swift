//
//  ViewModel.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 24.03.2023.
//

import Foundation

class ViewModel {
  
  var searchBarText: String = ""
  var pokemons: [Pokemon] = []
  var filteredPokemons: [Pokemon] = []
  var categoryTypes: [PokemonCategory] = []
  
  func updateCategoryTypes() {
    for pokemon in pokemons {
      
      if let pokemonTypes = pokemon.types {
        for pokemonType in pokemonTypes {
          
          let category = PokemonCategory(type: pokemonType.type?.name ?? "kk", isSelected: false)
          
          if  !categoryTypes.contains(where: { $0 == category}) {
            categoryTypes.append(category)
          }
        }
      }
    }
  }
  
  func updatePokemons() {
//    filteredPokemons.removeAll()
//    let pokemons = self.pokemons.copiedElements()
//    if !categoryTypes.allSatisfy({ $0.isSelected == false }) {
//      
//      for categoryType in categoryTypes {
//        if categoryType.isSelected {
//          for pokemon in pokemons {
//            if let pokemonType = pokemon.types {
//              for pokemonType in pokemonType {
//                if pokemonType.type?.name == categoryType.type {
//                  filteredPokemons.append(pokemon)
//                }
//              }
//            }
//          }
//        }
//      }
//    }
  }
}
