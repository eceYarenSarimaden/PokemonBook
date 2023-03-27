//
//  ViewController.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import UIKit
import Lottie
import IQKeyboardManagerSwift

final class ViewController: UIViewController {
  @IBOutlet weak var pokemonTableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var categoryTypeCollectionView: UICollectionView!
  @IBOutlet weak var blurEffectView: UIVisualEffectView!
  @IBOutlet weak var lottieContainerView: UIView!
  
  var viewModel = ViewModel()
  var animationView: LottieAnimationView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    animationView.frame = lottieContainerView.bounds
  }
  
  func setupUI() {
    title = "Pokemons"
    
    let tableViewCellNib = UINib(nibName: "PokemonTableViewCell", bundle: nil)
    pokemonTableView.register(tableViewCellNib, forCellReuseIdentifier: "PokemonTableViewCell")
    
    let collectionViewCellNib = UINib(nibName: "CategoryTypeCollectionViewCell", bundle: nil)
    categoryTypeCollectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "CategoryTypeCollectionViewCell")
    
    viewModel.pokemons = PokemonManager.shared.pokemons
    PokemonManager.shared.didFinish = { [weak self] in
      
      self?.viewModel.pokemons = PokemonManager.shared.pokemons
      self?.viewModel.filteredPokemons = (self?.viewModel.pokemons)!
      
      self?.viewModel.updateCategoryTypes()
      self?.viewModel.updatePokemons()
      
      self?.categoryTypeCollectionView.reloadData()
      self?.pokemonTableView.reloadData()
      
      if self?.lottieContainerView.alpha == 1 {
        UIView.animate(withDuration: 0.3, delay: 0, options: []) { [weak self] in
          self?.blurEffectView.alpha = 0
          self?.lottieContainerView.alpha = 0
        }
      }
    }
    
    animationView = LottieAnimationView(name: "PokeballLoadingAnimation")
    animationView.frame = lottieContainerView.bounds
    animationView.loopMode = .loop
    lottieContainerView.addSubview(animationView)
    animationView.play()
  }
}

//MARK: - TABLEVIEW
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.filteredPokemons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.pokemon , for: indexPath) as! PokemonTableViewCell
    cell.configure(pokemon: viewModel.filteredPokemons[indexPath.row])
    cell.selectionStyle = .none
    
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedPokemon = viewModel.filteredPokemons[indexPath.row]
    let name = selectedPokemon.name?.capitalizeFirstLetter()
    let imageURL = selectedPokemon.sprites?.other?.artImage?.url
    
    let pokemonDetailViewController = UIStoryboard.viewController(fromStoryboard: StoryboardIdentifier.pokemonDetail)  as! PokemonDetailViewController
    pokemonDetailViewController.viewModel.title = name ?? ""
    pokemonDetailViewController.viewModel.imageURL = imageURL
    pokemonDetailViewController.viewModel.pokemon = selectedPokemon
    pokemonDetailViewController.viewModel.pokemonDetails = viewModel.getPokemonDetails(pokemon: selectedPokemon)
    
    UISelectionFeedbackGenerator().selectionChanged()
    
    navigationController?.pushViewController(pokemonDetailViewController, animated: true)
  }
}

// MARK: - SEARCHBAR
extension ViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    viewModel.searchBarText = searchText
    viewModel.updatePokemons()
    
    pokemonTableView.reloadData()
  }
}

//MARK: -COLLECTIONVIEW
extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.categoryTypes.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.categoryType, for: indexPath) as! CategoryTypeCollectionViewCell
    let categoryType = viewModel.categoryTypes[indexPath.row]
    
    cell.configure(categoryName: categoryType.type.capitalizeFirstLetter(), isSelected: categoryType.isSelected)
    
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (categoryTypeCollectionView.frame.width - 20) / 3 , height: 50)
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedCategoryType = viewModel.categoryTypes[indexPath.row]
    
    if selectedCategoryType.isSelected == true {
      selectedCategoryType.isSelected = false
    } else {
      viewModel.categoryTypes.forEach { $0.isSelected = false }
      selectedCategoryType.isSelected = !selectedCategoryType.isSelected
    }

    viewModel.updateCategoryTypes()
    viewModel.updatePokemons()
    
    categoryTypeCollectionView.reloadData()
    pokemonTableView.reloadData()
  }
}
