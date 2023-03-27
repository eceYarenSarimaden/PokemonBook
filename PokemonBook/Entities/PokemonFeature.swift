//
//  PokemonFeature.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 25.03.2023.
//

import Foundation

final class PokemonFeature {
  var title: String
  var featureDetails: [PokemonFeatureDetail] // CollectionView Section'ı
  
  init(title: String, featureDetails: [PokemonFeatureDetail]) {
    self.title = title
    self.featureDetails = featureDetails
  }
}

final class PokemonFeatureDetail {
  var name: String // CollectionView Section'Title
  var abilityDetails: [PokemonAbilityDetail] // CollectionView Row
  
  init(name: String, abilityDetails: [PokemonAbilityDetail]) {
    self.name = name
    self.abilityDetails = abilityDetails
  }
}

final class PokemonAbilityDetail {
  var title: (key: String, value: String)
  var description: (key: String, value: String)
  
  init(title: (key: String, value: String), description: (key: String, value: String)) {
    self.title = title
    self.description = description
  }
}
