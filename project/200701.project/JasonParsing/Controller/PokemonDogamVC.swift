//
//  ViewController.swift
//  JasonParsing
//
//  Created by 김동현 on 2020/07/01.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

let reusableIdentifier = "pokemonCell"

class PokemonDoGamVC: UICollectionViewController {
  
  // MARK: Properties
  var pokemons = [Pokemon]() {
    didSet {
      self.collectionView.reloadData()
    }
  }
  let pokemonService = PokemonService()
  
  
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewComponents()
  }
  
  // MARK: Helper
  func configureViewComponents() {
    collectionView.backgroundColor = .white
    title = "Parsing Practice"
    
    collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: reusableIdentifier)
    pokemonService.fatchPokemon()
    pokemonService.delegate = self
  }
  
}


// MARK: CollectionViewCell Delegate Functions
extension PokemonDoGamVC {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pokemons.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath) as! PokemonCell
    let pokemon = self.pokemons[indexPath.row]
    cell.pokemon = pokemon
    return cell
  }
}

// MARK: UICollectionViewDelegateFlowLayout Delegate Functions
extension PokemonDoGamVC: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - 36) / 3
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
  }
}

extension PokemonDoGamVC: PokemonServiceProtocol {
  func pokemonService(pokemons: [Pokemon]) {
    self.pokemons = pokemons
  }
}
