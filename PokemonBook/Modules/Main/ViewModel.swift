//
//  ViewModel.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 24.03.2023.
//

import Foundation

final class ViewModel {
  var searchBarText: String = ""
  var pokemons: [Pokemon] = []
  var filteredPokemons: [Pokemon] = []
  var categoryTypes: [PokemonCategory] = []
  
  func updateCategoryTypes() {
    for pokemon in pokemons {
      if let pokemonTypes = pokemon.types?.first {
        if let type = pokemonTypes.type?.name {
          let category = PokemonCategory(type: type, isSelected: false)
          
          if !categoryTypes.contains(where: { $0 == category }) {
            categoryTypes.append(category)
          }
        }
      }
    }
  }
  
  private func filterByCategoryTyper(_ pokemons: inout [Pokemon]) -> [Pokemon]  {
    var pokemons = pokemons.map { $0.duplicate()}
    
    if !categoryTypes.allSatisfy({ $0.isSelected == false }) {
      for categoryType in categoryTypes {
        
        if categoryType.isSelected {
          for pokemon in pokemons {
            
            if let type = pokemon.types?.first {
              if type.type?.name?.capitalizeFirstLetter() != categoryType.type.capitalizeFirstLetter() {
                pokemons.remove(pokemon)
              }
            }
          }
        }
      }
    }
    return pokemons
  }
  
  private func filterBySearchText(_ pokemons: inout [Pokemon]) -> [Pokemon] {
    for pokemon in pokemons {
      if let name = pokemon.name {
        
        if !name.uppercased().starts(with: searchBarText.uppercased()) {
          pokemons.remove(pokemon)
        }
      }
    }
    return pokemons
  }
  
  func getPokemonDetails(pokemon: Pokemon) -> [PokemonDetail] {
    var pokemonDetails: [PokemonDetail] = []
    
    if let experience = pokemon.experience {
      let pokemonDetail = PokemonDetail(type: .baseExperience, value: experience.description)
      pokemonDetails.append(pokemonDetail)
    }
    
    if let height = pokemon.height {
      let pokemonDetail = PokemonDetail(type: .height, value: height.description)
      pokemonDetails.append(pokemonDetail)
    }
    
    if let weight = pokemon.weight {
      let pokemonDetail = PokemonDetail(type: .weight, value: weight.description)
      pokemonDetails.append(pokemonDetail)
    }
    
    if let order = pokemon.order {
      let pokemonDetail = PokemonDetail(type: .order, value: order.description)
      pokemonDetails.append(pokemonDetail)
    }
    
    if let id = pokemon.id {
      let pokemonDetail = PokemonDetail(type: .id, value: id.description)
      pokemonDetails.append(pokemonDetail)
    }
    
    if let isDefault = pokemon.isDefault {
      let pokemonDetail = PokemonDetail(type: .isDefault, value: isDefault.description)
      pokemonDetails.append(pokemonDetail)
    }
    
    if let abilities = pokemon.abilities {
      let pokemonDetail = PokemonDetail(type: .abilities)
      
      for ability in abilities {
        if let ability = ability.ability {
          pokemonDetail.results.append(ability)
        }
      }
      
      pokemonDetails.append(pokemonDetail)
    }
    
    if let forms = pokemon.forms {
      let pokemonDetail = PokemonDetail(type: .forms)
      
      for form in forms {
        pokemonDetail.results.append(form)
      }
      
      pokemonDetails.append(pokemonDetail)
    }
    
    if let moves = pokemon.moves {
      let pokemonDetail = PokemonDetail(type: .moves)
      
      for move in moves {
        if let move = move.move {
          pokemonDetail.results.append(move)
        }
      }
      
      pokemonDetails.append(pokemonDetail)
    }
    
    if let stats = pokemon.stats {
      let pokemonDetail = PokemonDetail(type: .stats)
      
      for stat in stats {
        if let stat = stat.stat {
          pokemonDetail.results.append(stat)
        }
      }
      
      pokemonDetails.append(pokemonDetail)
    }
    
    return pokemonDetails
  }
  
  func updatePokemons() {
    var pokemons = filterByCategoryTyper(&self.pokemons)
    
    if !searchBarText.isEmpty {
      pokemons = filterBySearchText(&pokemons)
    }
    filteredPokemons = pokemons
  }
}
