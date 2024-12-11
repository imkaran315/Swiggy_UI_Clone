//
//  DishCollectionCell.swift
//  Swiggy_Assignment
//
//  Created by Karan Verma on 07/12/24.
//

import UIKit

class DishCollectionCell: UICollectionViewCell {
    static let identifier = "DishCollectionCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let dishLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup(){
        backgroundColor = .white
        contentView.addSubview(dishLabel)
        contentView.addSubview(imageView)
        
        dishLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dishLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dishLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dishLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            dishLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
        self.dishLabel.text = nil
    }
    
    func configure(with dish: Dish){
        DispatchQueue.main.async {
            self.imageView.image = UIImage(named: dish.image)
            self.dishLabel.text = dish.name
        }
    }
}

// MARK: - methods to handle touch animations

extension DishCollectionCell{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.transform = self.transform.scaledBy(x: 0.95, y: 0.95)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
}
