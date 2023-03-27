//
//  PokemonFeatureTableViewCell.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 25.03.2023.
//

import UIKit

final class PokemonFeatureTableViewCell: UITableViewCell {
  @IBOutlet weak var featureCollectionView: UICollectionView!
  
  var pokemonFeature: PokemonFeature?
  
  func configure(pokemonFeature: PokemonFeature) {
    self.pokemonFeature = pokemonFeature
    
    let nib = UINib(nibName: "PokemonFeatureCollectionViewCell", bundle: nil)
    featureCollectionView.register(nib, forCellWithReuseIdentifier: "PokemonFeatureCollectionViewCell")
    
    featureCollectionView.register(PokemonFeatureCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PokemonFeatureCollectionReusableView")
    
    featureCollectionView.delegate = self
    featureCollectionView.dataSource = self
    featureCollectionView.reloadData()
  }
}

extension PokemonFeatureTableViewCell: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return pokemonFeature?.featureDetails.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pokemonFeature?.featureDetails[section].abilityDetails.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonFeatureCollectionViewCell", for: indexPath) as! PokemonFeatureCollectionViewCell
    
    if let abilityDetail = pokemonFeature?.featureDetails[indexPath.section].abilityDetails[indexPath.row] {
      cell.configure(abilityDetail: abilityDetail)
    }
    
    return cell
  }
}

extension PokemonFeatureTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if let abilityDetail = pokemonFeature?.featureDetails[indexPath.section].abilityDetails[indexPath.row] {
      
      let horizontalMargin = 20.0 // 10 + 10
      let title = abilityDetail.title.key + ": " + abilityDetail.title.value
      let description = abilityDetail.description.key + ": " + abilityDetail.description.value
      let titleHeight = title.description.heightForLabel(font: UIFont.systemFont(ofSize: 16, weight: .semibold), width: collectionView.frame.width - horizontalMargin)
      let descriptionHeight = description.description.heightForLabel(font: UIFont.systemFont(ofSize: 16, weight: .semibold), width: collectionView.frame.width - horizontalMargin)
      
      return CGSize(width: collectionView.frame.width - horizontalMargin, height: titleHeight + descriptionHeight)
    }
    
    return CGSize(width: collectionView.frame.width, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 32)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PokemonFeatureCollectionReusableView", for: indexPath) as! PokemonFeatureCollectionReusableView
    
    let title = pokemonFeature?.featureDetails[indexPath.section].name ?? "Header"
    view.configure(title: title)
    
    return view
  }
}
