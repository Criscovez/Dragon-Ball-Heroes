//
//  HeroTransformation.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 16-01-24.
//

import Foundation

struct HeroTransformation: Codable, Hashable, CustomCell {
    let name: String
    let photo: String
    let id, description: String
}
