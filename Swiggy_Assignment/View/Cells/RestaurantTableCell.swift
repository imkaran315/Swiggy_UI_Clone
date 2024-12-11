//
//  RestaurantTableCell.swift
//  Swiggy_Assignment
//
//  Created by Karan Verma on 07/12/24.
//

import UIKit

protocol RestaurantTableCellDelegate: AnyObject {
    func didTapRestaurant(at indexPath: IndexPath)
}

class RestaurantTableCell: UITableViewCell {
    static let identifier = "RestaurantTableCell"
    var indexPath: IndexPath?
    
    weak var delegate: RestaurantTableCellDelegate?
    
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.cornerCurve = .continuous
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let label3: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    private let label4: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup(){
        contentView.addSubview(imgView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(label4)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        label4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            imgView.widthAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20),
            
            label2.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            label2.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            label3.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            
            label4.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 10)
        ])
    }
    
    func configure(with restaurant: Restaurant){
        DispatchQueue.main.async {
            self.imgView.image = UIImage(named: restaurant.image)
            self.nameLabel.text = restaurant.name
            self.label2.text = restaurant.rating
            self.label3.text = restaurant.category
            self.label4.text = restaurant.address
        }
    }
    
    private func navigateToDetailVC(){
        delegate?.didTapRestaurant(at: indexPath!)
    }
}

// MARK: - methods to handle touch animations

extension RestaurantTableCell{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.transform = self.transform.scaledBy(x: 0.98, y: 0.98)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        } completion: { _ in
            self.navigateToDetailVC()
        }
    }
}
