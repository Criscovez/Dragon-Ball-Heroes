//
//  DragonBallHero.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 16-01-24.
//

import Foundation

protocol CustomCell {
    var photo: String { get }
    var id: String { get }
    var name: String { get }
    var description: String { get }
}

struct DragonBallHero: Codable, Hashable, CustomCell {
    let photo: String
    let id, name, description: String
}
