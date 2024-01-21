//
//  HeroesListTableViewController.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 17-01-24.
//

import UIKit

class HeroesListTableViewController: UITableViewController {
    typealias DataSource = UITableViewDiffableDataSource<Int, DragonBallHero>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, DragonBallHero>
    
    // MARK: - Model
    private var heroes: [DragonBallHero] = []
    private let networkModel = NetworkModel.shared
    private var dataSource: DataSource?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        tableView.register(
            UINib(nibName:  HeroTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: HeroTableViewCell.identifier
        )
        
        tableView.estimatedRowHeight = 100
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, heroe in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HeroTableViewCell.identifier,
                for: indexPath
            ) as? HeroTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: heroe)
            return cell
        }
        
        tableView.dataSource = dataSource
        
        networkModel.getHeroes  { [weak self] result in
            switch result {
            case let .success(heroes):
                // Forma nueva
                self?.heroes = heroes
                var snapshot = Snapshot()
                snapshot.appendSections([0])
                snapshot.appendItems(heroes)
                self?.dataSource?.apply(snapshot)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}

// MARK: - Configuration
private extension HeroesListTableViewController {
    func setUpView() {
        title = "Heroes"
    }
}

// MARK: - TableView Delegate
extension HeroesListTableViewController {
    
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        
        DispatchQueue.main.async {
            let hero = self.heroes[indexPath.row]
            let heroDetailViewController = HeroDetailViewController(hero: hero)
            self.navigationController?.show(heroDetailViewController, sender: nil)
            
        }
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
    }
}
