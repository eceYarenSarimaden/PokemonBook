//
//  PokemonFeatureDetailViewModel.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 25.03.2023.
//

import Foundation

final class PokemonFeatureDetailViewModel {
  var pokemon: Pokemon!
  var pokemonDetail: PokemonDetail!
  
  var pokemonFeatures: [PokemonFeature] = []
  
  func requestAbility(completion: @escaping (() -> Void)) {
    let apiService = APIService()
    
    for result in pokemonDetail.results {
      guard let abilityName = result.name,
            let url = result.detailURL else { continue }
      
      apiService.getPokemonAbility(with: url) { [weak self] response in
        guard let response = response else { return }
        
        response.effectEntries?.removeAll { $0.language?.name != "en" }
        response.flavorTextEntries?.removeAll { $0.language?.name != "en" }
        
        // Effect Entries
        let effectEntries = PokemonFeatureDetail(name: "Effect Entries", abilityDetails: [])
        if let responseEffectEntries = response.effectEntries {
          for effectEntry in responseEffectEntries {
            let detail = PokemonAbilityDetail(title: ("Effect", effectEntry.effect ?? ""), description: ("Short Effect", effectEntry.shortEffect ?? ""))
            
            effectEntries.abilityDetails.append(detail)
          }
        }
        
        // Flavor Text Entries
        let flavorTextEntries = PokemonFeatureDetail(name: "Flavor Text Entries", abilityDetails: [])
        if let responseFlavorTextEntries = response.flavorTextEntries {
          for flavorTextEntry in responseFlavorTextEntries {
            let detail = PokemonAbilityDetail(title: ("Flavor Text", flavorTextEntry.flavorText ?? ""), description: ("Version Group Name", flavorTextEntry.versionGroup.name ?? ""))
            
            flavorTextEntries.abilityDetails.append(detail)
          }
        }
        
        let featureDetails: [PokemonFeatureDetail] = [effectEntries, flavorTextEntries]
        let pokemonFeature = PokemonFeature(title: abilityName.capitalizeFirstLetter(), featureDetails: featureDetails)
        
        self?.pokemonFeatures.append(pokemonFeature)
        
        completion()
      }
    }
  }
  
  func requestForms(completion: @escaping (() -> Void)) {
    let apiService = APIService()
    
    for result in pokemonDetail.results {
      guard let formName = result.name,
            let url = result.detailURL else { continue }
      
      apiService.getPokemonForms(with: url) { [weak self] response in
        
        // Id
        let id = PokemonFeatureDetail(name: "Id", abilityDetails: [
          PokemonAbilityDetail(title: ("Id", response?.id?.description ?? ""), description: ("", ""))
        ])
        
        // Form Order
        let formOrder = PokemonFeatureDetail(name: "Form Order", abilityDetails: [
          PokemonAbilityDetail(title: ("Form Order", response?.formOrder?.description ?? ""), description: ("", ""))
        ])
        
        // Is Battle Only
        let isBattleOnly = PokemonFeatureDetail(name: "Is Battle Only", abilityDetails: [
          PokemonAbilityDetail(title: ("Is Battle Only", response?.isBattleOnly?.description ?? ""), description: ("", ""))
        ])
        
        // Is Default
        let isDefault = PokemonFeatureDetail(name: "Is Default", abilityDetails: [
          PokemonAbilityDetail(title: ("Is Default", response?.isDefault?.description ?? ""), description: ("", ""))
        ])
        
        // Is Mega
        let isMega = PokemonFeatureDetail(name: "Is Mega", abilityDetails: [
          PokemonAbilityDetail(title: ("Is Mega", response?.isMega?.description ?? ""), description: ("", ""))
        ])
        
        // Order
        let order = PokemonFeatureDetail(name: "Order", abilityDetails: [
          PokemonAbilityDetail(title: ("Order", response?.order?.description ?? ""), description: ("", ""))
        ])
        
        // Types
        let type = PokemonFeatureDetail(name: "Types", abilityDetails: [])
        if let responseTypes = response?.types {
          for responseType in responseTypes {
            let detail = PokemonAbilityDetail(title: ("Type", responseType.type?.name?.capitalizeFirstLetter() ?? ""), description: ("", ""))
            
            type.abilityDetails.append(detail)
          }
        }
        
        // Version Group
        let versionGroup = PokemonFeatureDetail(name: "Version Group", abilityDetails: [
          PokemonAbilityDetail(title: ("Version Group", response?.versionGroup?.name?.capitalizeFirstLetter() ?? ""), description: ("", ""))
        ])
        
        let featureDetails: [PokemonFeatureDetail] = [id, formOrder, isBattleOnly, isDefault, isMega, order, type, versionGroup]
        let pokemonFeature = PokemonFeature(title: formName.capitalizeFirstLetter(), featureDetails: featureDetails)
        
        self?.pokemonFeatures.append(pokemonFeature)
        
        completion()
      }
    }
  }
  
  func updateStats() {
    guard let stats = pokemon.stats else { return }
    
    for stat in stats {
      let detail = PokemonFeatureDetail(name: stat.stat?.name?.capitalizeFirstLetter() ?? "", abilityDetails: [
        PokemonAbilityDetail(title: ("Base Stat", stat.baseStat?.description ?? ""), description: ("Effort", stat.effort?.description ?? ""))
      ])
      
      let featureDetails: [PokemonFeatureDetail] = [detail]
      let pokemonFeature = PokemonFeature(title: stat.stat?.name?.capitalizeFirstLetter() ?? "", featureDetails: featureDetails)
      
      self.pokemonFeatures.append(pokemonFeature)
    }
  }
}
