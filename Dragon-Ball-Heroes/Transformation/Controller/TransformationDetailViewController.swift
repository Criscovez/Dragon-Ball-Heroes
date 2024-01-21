//
//  TransformationDetailViewController.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 19-01-24.
//

import UIKit

class TransformationDetailViewController: UIViewController {
    
    @IBOutlet weak var transformationName: UILabel!
    @IBOutlet weak var transformationDescription: UILabel!
    @IBOutlet weak var transformationImage: UIImageView!
    
    
    private let trasformation: HeroTransformation
    
    // MARK: - Initializers
    init(trasformation: HeroTransformation) {
        self.trasformation = trasformation
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
}

// MARK: - View Configuration
private extension TransformationDetailViewController {
    func configureView() {
        transformationName.text = trasformation.name
        transformationDescription.text = trasformation.description
        
        guard let imageURL = URL(string: trasformation.photo)  else {
            return
        }
        
        transformationImage.setImage(url: imageURL)
        
        
    }
}
