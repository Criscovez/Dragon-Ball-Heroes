//
//  HeroTableViewCell.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 18-01-24.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    //MARK: - Identifier
    static let identifier = "HeroTableViewCell"
    
    //MARK: - Outlets
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroDescriptionLabel: UILabel!
    
    //MARK: - Configure
    func configure<T: CustomCell>(with heroe: T) {
        
        heroNameLabel.text = heroe.name
        heroDescriptionLabel.text = heroe.description
        
        guard let imageURL = URL(string: heroe.photo)  else {
            return
        }
        
        heroImageView.setImage(url: imageURL)
    }
}
