//
//  ArrayExtension.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 27.03.2023.
//

import Foundation

extension Array where Element: Equatable {
  mutating func remove(_ element: Element) {
    if let index = firstIndex(of: element) {
      remove(at: index)
    }
  }
}
