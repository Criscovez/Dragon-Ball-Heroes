//
//  HeroDetailViewController.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 18-01-24.
//

import UIKit

class HeroDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroDescriptionLabel: UILabel!
    
    // MARK: - Model
    private let hero: DragonBallHero
    
    // MARK: - Initializers
    init(hero: DragonBallHero) {
        self.hero = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @IBAction func transformationButton(_ sender: Any) {
        DispatchQueue.main.async {
            
            let transformationsTableViewController = TransformationsTableViewController(idHero: self.hero.id)
            self.navigationController?.show(transformationsTableViewController, sender: nil)
        }
    }
    
}

// MARK: - View Configuration
private extension HeroDetailViewController {
    func configureView() {
        heroNameLabel.text = hero.name
        heroDescriptionLabel.text = hero.description
        
        guard let imageURL = URL(string: hero.photo)  else {
            return
        }
        
        heroImageView.setImage(url: imageURL)
        
        
    }
}
