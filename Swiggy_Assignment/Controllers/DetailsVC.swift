//
//  DetailsVC.swift
//  Swiggy_Assignment
//
//  Created by Karan Verma on 07/12/24.
//

import UIKit

class DetailsVC: UIViewController {
    
    var restaurant: Restaurant?

    private var imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var titlelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configure()
    }
    
    private func setup(){
        view.addSubview(imgView)
        view.addSubview(titlelabel)
        view.addSubview(ratingLabel)
        view.addSubview(descriptionLabel)
        view.backgroundColor = .white
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: view.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imgView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            titlelabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 16),
            titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titlelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            ratingLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 8),
            ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    private func configure() {
        DispatchQueue.main.async{ [self] in
            if let restaurant = restaurant {
                imgView.image = UIImage(named: restaurant.image)
                titlelabel.text = restaurant.name
                ratingLabel.text = restaurant.rating
                descriptionLabel.text = restaurant.description
            }
        }
    }
}
