//
//  PokemonCell.swift
//  JasonParsing
//
//  Created by 김동현 on 2020/07/01.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    // MARK: Properties
  var pokemon: Pokemon? {
    didSet {
      guard let pokemon = self.pokemon else { return }
      pokemonName.text = pokemon.name
    }
  }
  
    var pokemonName: UILabel = {
       let label = UILabel()
        label.text = "practice"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Helper
    func configureViewComponents() {
        backgroundColor = .red
        layer.cornerRadius = 10
        
        
        addSubview(pokemonName)
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        pokemonName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pokemonName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
