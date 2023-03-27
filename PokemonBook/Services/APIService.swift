//
//  APIService.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 23.03.2023.
//

import Foundation
import Alamofire

enum Endpoint: String {
  // Pokemon
  case pokemon = "/pokemon/"
  
  var url: URL {
    return URL(string: Config.baseUrl + self.rawValue)!
  }
}

protocol APIServiceProtocol {
  func getPokemons(url: URL?, completion: @escaping ((PokemonResponse?) -> Void))
  func getPokemonDetail(url: URL, completion: @escaping ((Pokemon?) -> Void))
  func getPokemonAbility(with url: URL, completion: @escaping ((PokemonAbilityResponse?) -> Void))
  func getPokemonForms(with url: URL, completion: @escaping ((PokemonFormsResponse?) -> Void))
}

final class APIService: APIServiceProtocol {
  func getPokemons(url: URL?, completion: @escaping ((PokemonResponse?) -> Void)) {
    let url = url == nil ? Endpoint.pokemon.url : url
    let request = AF.request(url!, method: .get)
    
    request.responseDecodable(of: PokemonResponse.self) { [weak self] response in
      completion(response.value)
    }
  }
  
  func getPokemonDetail(url: URL, completion: @escaping ((Pokemon?) -> Void)) {
    let request = AF.request(url, method: .get)
    
    request.responseDecodable(of: Pokemon.self) { response in
      completion(response.value)
    }
  }
  
  func getPokemonAbility(with url: URL, completion: @escaping ((PokemonAbilityResponse?) -> Void)) {
    let request = AF.request(url, method: .get)
    
    request.responseDecodable(of: PokemonAbilityResponse.self) { response in
      completion(response.value)
    }
  }
  
  func getPokemonForms(with url: URL, completion: @escaping ((PokemonFormsResponse?) -> Void)) {
    let request = AF.request(url, method: .get)
    
    request.responseDecodable(of: PokemonFormsResponse.self) { response in
      completion(response.value)
    }
  }
}

final class PokemonFormsResponse: Decodable {
  var formOrder: Int?
  var id: Int?
  var isBattleOnly: Bool?
  var isDefault: Bool?
  var isMega: Bool?
  var order: Int?
  var types: [PokemonType]?
  var versionGroup: PokemonResult?
  
  enum CodingKeys: String, CodingKey {
    case formOrder = "form_order"
    case id
    case isBattleOnly = "is_battle_only"
    case isDefault = "is_default"
    case isMega = "is_mega"
    case order
    case types
    case versionGroup = "version_group"
  }
}
