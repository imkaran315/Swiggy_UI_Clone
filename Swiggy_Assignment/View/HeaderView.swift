//
//  HeaderView.swift
//  Swiggy_Assignment
//
//  Created by Karan Verma on 07/12/24.
//

import UIKit

class HeaderView : UIView {
    
    private let locationImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location.fill")
        imageView.tintColor = .orange
        return imageView
    }()
    
    private let locationLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .black)
        label.text = "Office"
        return label
    }()
    
    private let locationNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "Block 1st Embassy Village, Swiggy Office"
        return label
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for 'Sweets'"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.cornerRadius = 10
        searchBar.layer.cornerCurve = .continuous
        searchBar.layer.masksToBounds = true
        
        searchBar.searchTextField.leftView = nil // removing search icon in left
        searchBar.layer.borderColor = UIColor.lightGray.cgColor
        searchBar.layer.borderWidth = 0.3
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupSearch()
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup(){
        backgroundColor = .white
    }
    
    private func setupLabels(){
        addSubview(locationImageView)
        addSubview(locationLabel)
        addSubview(locationNameLabel)
        addSubview(profileImage)
        
        
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            locationNameLabel.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -10),
            locationNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            locationNameLabel.widthAnchor.constraint(equalToConstant: 300),
            
            
            locationImageView.leadingAnchor.constraint(equalTo: locationNameLabel.leadingAnchor),
            locationImageView.bottomAnchor.constraint(equalTo: locationNameLabel.topAnchor, constant: -5),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.bottomAnchor.constraint(equalTo: locationImageView.bottomAnchor),
            
            profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            profileImage.heightAnchor.constraint(equalToConstant: 45),
            profileImage.widthAnchor.constraint(equalToConstant: 45),
            profileImage.topAnchor.constraint(equalTo: locationImageView.topAnchor)
            
        ])
    }
    
    private func setupSearch(){
        addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
