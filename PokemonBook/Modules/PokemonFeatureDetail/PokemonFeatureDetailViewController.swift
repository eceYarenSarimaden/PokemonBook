//
//  PokemonFeatureDetailViewController.swift
//  PokemonBook
//
//  Created by Ece Yaren Sarımaden on 25.03.2023.
//

import UIKit
import Kingfisher
import PanModal

final class PokemonFeatureDetailViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var featureTableView: UITableView!
  
  let viewModel = PokemonFeatureDetailViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      setupUI()
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    panModalSetNeedsLayoutUpdate()
    viewModel.pokemonDetail.results.count > 1 ? panModalTransition(to: .longForm) : panModalTransition(to: .shortForm)
  }
  
  func setupUI() {
    let nib = UINib(nibName: "PokemonFeatureTableViewCell", bundle: nil)
    featureTableView.register(nib, forCellReuseIdentifier: "PokemonFeatureTableViewCell")
    
    titleLabel.text = viewModel.pokemonDetail.type.title

    switch viewModel.pokemonDetail.type {
    case .abilities:
      viewModel.requestAbility { [weak self] in
        self?.featureTableView.reloadData()
      }
      
    case .forms:
      viewModel.requestForms { [weak self] in
        self?.featureTableView.reloadData()
      }
    case .moves:
      viewModel.requestAbility { [weak self] in
        self?.featureTableView.reloadData()
      }
    case .stats:
      viewModel.updateStats()
      featureTableView.reloadData()
      
    default:
      break
    }
  }
}

extension PokemonFeatureDetailViewController: PanModalPresentable {
  var panScrollable: UIScrollView? {
    return nil
  }
  
  var cornerRadius: CGFloat {
    return 24
  }
  
  var dragIndicatorBackgroundColor: UIColor {
    return .clear
  }
  
  var shortFormHeight: PanModalHeight {
   return .contentHeight(350)
  }
  
  var longFormHeight: PanModalHeight {
    return .contentHeight(667)
  }
}

extension PokemonFeatureDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.pokemonFeatures.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonFeatureTableViewCell" , for: indexPath) as! PokemonFeatureTableViewCell
    
    let feature = viewModel.pokemonFeatures[indexPath.section]
    
    cell.configure(pokemonFeature: feature)
    cell.selectionStyle = .none
    
    
    return cell
  }
  
  // Header
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return viewModel.pokemonFeatures[section].title
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let myLabel = UILabel()
    myLabel.font = UIFont.boldSystemFont(ofSize: 19)
    myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
    
    let headerView = UIView()
    headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30)
    headerView.addSubview(myLabel)
    myLabel.frame = CGRect(x: 14, y: 0, width: headerView.frame.width - 14, height: 30)
    
    return headerView
  }
}

extension PokemonFeatureDetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if viewModel.pokemonDetail.type == .stats {
      return 70
    }
    
    return 250
  }
}
