//
//  HomeVC.swift
//  Swiggy_Assignment
//
//  Created by Karan Verma on 06/12/24.
//

import UIKit

class HomeVC: UIViewController {
    
    let restaurants = DummyData.shared.restaurants // getting hardcoded data
    
    let refreshControl = UIRefreshControl()
    private var mainTableView = UITableView()
    
    private var header : HeaderView = {
        let header = HeaderView()
        header.layer.shadowColor = UIColor.gray.cgColor
        header.layer.shadowOpacity = 0.5
        header.layer.shadowRadius = 8
        header.layer.shadowOffset = CGSize(width: 0, height: 10)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTableView()
        setupHeaderView()
        
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .allEvents)
        refreshControl.tintColor = .orange
    }
    
    @objc func handleRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { // mimicking API call delay
            self.refreshControl.endRefreshing()
            self.mainTableView.reloadData()
        }
    }
    
    private func setupHeaderView() {
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(mainTableView)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.refreshControl = refreshControl
        mainTableView.contentInset = UIEdgeInsets(top: 120, left: 0, bottom: 0, right: 0)
        mainTableView.showsVerticalScrollIndicator = false
        mainTableView.separatorColor = .clear
        
        // register all cells
        mainTableView.register(BannerImagesTableCell.self, forCellReuseIdentifier: BannerImagesTableCell.identifier)
        mainTableView.register(DishesCollectionTableCell.self, forCellReuseIdentifier: DishesCollectionTableCell.identifier)
        mainTableView.register(RestaurantTableCell.self, forCellReuseIdentifier: RestaurantTableCell.identifier)
        
        // Layout table view
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - TableView methods

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return 1
        default :
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0 :
            return nil
        case 1 :
            return nil
        default :
            return "Restaurants to explore nearby"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerImagesTableCell.identifier) as! BannerImagesTableCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: DishesCollectionTableCell.identifier) as! DishesCollectionTableCell
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableCell.identifier) as! RestaurantTableCell
            
            cell.configure(with: restaurants[indexPath.row % restaurants.count]) // repeating restaurants
            cell.indexPath = indexPath
            cell.delegate = self
            
            return cell
        }
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 145
        case 1:
            return 260
        default :
            return 200
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true) // resigning keyboard
    }
}

// MARK :- Navigation related protocol

extension HomeVC: RestaurantTableCellDelegate {
    func didTapRestaurant(at indexPath: IndexPath) {
        let vc = DetailsVC()
        vc.restaurant = restaurants[indexPath.row % restaurants.count]
        navigationController?.pushViewController(vc, animated: true)
    }
}
