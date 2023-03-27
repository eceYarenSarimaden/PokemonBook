//
//  PokemonDetailViewModel.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import Foundation
import Kingfisher

final class PokemonDetailViewModel {
  var title = "Pokemon"
  var imageURL: URL?
  var image: UIImage?
  var pokemon: Pokemon!
  var pokemonDetails: [PokemonDetail] = []
  
  func downloadPokemonImage() {
    guard let imageURL = imageURL else { return }
    
    ImageDownloader.default.downloadImage(with: imageURL, options: [], progressBlock: nil) { [weak self] result in
      guard let cgImage = try? result.get().image.cgImage else { return }
      let image = UIImage(cgImage: cgImage)
      
      self?.image = image
    }
  }
  
  func saveImageToGallery() {
    guard let image = image else { return }
    
    UISelectionFeedbackGenerator().selectionChanged()
    
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
  }
}
