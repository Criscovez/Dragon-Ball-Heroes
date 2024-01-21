//
//  TransformationsTableViewController.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 19-01-24.
//

import UIKit

class TransformationsTableViewController: UITableViewController {
    typealias DataSource = UITableViewDiffableDataSource<Int, HeroTransformation>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, HeroTransformation>
    // MARK: - Model
    
    
    private var idHero: String
    private var transformations: [HeroTransformation] = []
    private let networkModel = NetworkModel.shared
    private var dataSource: DataSource?
    
    
    // MARK: - Initializers
    init(idHero: String) {
        self.idHero = idHero
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        tableView.register(
            UINib(nibName:  HeroTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: HeroTableViewCell.identifier
        )
        
        tableView.estimatedRowHeight = 100
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, transformation in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HeroTableViewCell.identifier,
                for: indexPath
            ) as? HeroTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: transformation)
            return cell
        }
        
        tableView.dataSource = dataSource
        
        networkModel.getTransformations(id: idHero)  { [weak self] result in
            switch result {
            case let .success(transformations):
                // Forma nueva
                self?.transformations = transformations
                var snapshot = Snapshot()
                snapshot.appendSections([0])
                snapshot.appendItems(transformations)
                self?.dataSource?.apply(snapshot)
                
            case let .failure(error):
                print(error)
            }
        }
    }
}

// MARK: - Configuration
private extension TransformationsTableViewController {
    func setUpView() {
        title = "Transformaciones"
    }
}

// MARK: - TableView Delegate
extension TransformationsTableViewController {
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        
        DispatchQueue.main.async {
            let transformation = self.transformations[indexPath.row]
            let transformationDetailViewController = TransformationDetailViewController(trasformation: transformation)
            self.navigationController?.show(transformationDetailViewController, sender: nil)
            
        }
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
    }
}
