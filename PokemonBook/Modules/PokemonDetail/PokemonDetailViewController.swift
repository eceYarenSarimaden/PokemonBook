//
//  PokemonDetailViewController.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 22.03.2023.
//

import UIKit
import Kingfisher
import PanModal

final class PokemonDetailViewController: UIViewController {
  @IBOutlet weak var pokemonNameLabel: UILabel!
  @IBOutlet weak var pokemonImageView: UIImageView!
  @IBOutlet weak var pokemonDetailTableView: UITableView!
  @IBOutlet weak var pokemonTableViewHeightConstraint: NSLayoutConstraint!
  
  var viewModel = PokemonDetailViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    pokemonTableViewHeightConstraint.constant = pokemonDetailTableView.contentSizeHeight
  }
  
  private func setupUI() {
    let tableViewCellNib = UINib(nibName: TableViewCellIdentifier.pokemonDetail, bundle: nil)
    pokemonDetailTableView.register(tableViewCellNib, forCellReuseIdentifier: TableViewCellIdentifier.pokemonDetail)
    
    pokemonNameLabel.text = viewModel.title
    pokemonImageView.kf.indicatorType = .activity
    pokemonImageView.kf.setImage(with: viewModel.imageURL)
    
    viewModel.downloadPokemonImage()

    pokemonDetailTableView.reloadData()
  }
  
  @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
    viewModel.saveImageToGallery()
  }
}

extension PokemonDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.pokemonDetails.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.pokemonDetail , for: indexPath) as! PokemonDetailTableViewCell
    
    let pokemonDetail = viewModel.pokemonDetails[indexPath.row]
    
    cell.configure(pokemonDetail: pokemonDetail)
    cell.selectionStyle = .none
    
    return cell
  }
}

extension PokemonDetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedDetail = viewModel.pokemonDetails[indexPath.row]
    
    guard selectedDetail.results.count > 0 else { return }
    
    UISelectionFeedbackGenerator().selectionChanged()
    
    let pokemonFeatureDetailViewController = UIStoryboard.viewController(fromStoryboard: StoryboardIdentifier.pokemonFeatureDetail) as! PokemonFeatureDetailViewController
    pokemonFeatureDetailViewController.viewModel.pokemon = viewModel.pokemon
    pokemonFeatureDetailViewController.viewModel.pokemonDetail = selectedDetail
 
    navigationController?.presentPanModal(pokemonFeatureDetailViewController)
  }
}
