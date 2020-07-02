//
//  JasonParsing
//
//  Created by 김동현 on 2020/07/01.
//  Copyright © 2020 김동현. All rights reserved.
//
//
// 제이슨 데이터 parsing 작업
//
import Foundation

protocol PokemonServiceProtocol: class {
  func pokemonService(pokemons: [Pokemon])
}

class PokemonService {
  
  // 통신을 할 url을 저장
  let url = "https://pokemon.treduler.pro/"
  
  weak var delegate: PokemonServiceProtocol?
  
  // url 존재 확인후 데이터 처리
  func fatchPokemon() {
    if let url = URL(string: url) {
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
          print ("error 발생", error.localizedDescription)
        } else {
          if let data = data {
            // json -> swift 파일형식으로 바꿈 (디코드)
            do {
              let pokemins = try JSONDecoder().decode([Pokemon].self, from: data)
              DispatchQueue.main.async {self.delegate?.pokemonService(pokemons: pokemins)}
            } catch let error {
              print ("error 발생", error.localizedDescription)
            }
          }
        }
      }.resume()
    }
  }
}
