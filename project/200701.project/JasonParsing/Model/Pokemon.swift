//
//  Pokemon.swift
//  JasonParsing
//
//  Created by 김동현 on 2020/07/01.
//  Copyright © 2020 김동현. All rights reserved.
//
// "https://pokemon.treduler.pro/"
//
// Codable을 상속 받아야 jason 형식의 데이터를 쉽고 빠르게 Swift 데이터 형식으로 바꿔줄수 있습니다.
//
import Foundation

struct Pokemon: Codable {
    var name: String?
    var imageUrl: String?
    var id: Int?
    var weight: Int?
    var height: Int?
    var defense: Int?
    var attack: Int?
    var description: String?
    var type: String?
    var baseExperience: Int?
}
