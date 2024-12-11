//
//  BannerImagesTableCell.swift
//  Swiggy_Assignment
//
//  Created by Karan Verma on 07/12/24.
//

import UIKit

class BannerImagesTableCell: UITableViewCell {
    
    static let identifier = "BannerImagesTableCell"
    
    private var slideshow = Slideshow()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup() {
        contentView.addSubview(slideshow)
        
        slideshow.images = DummyData.shared.images // getting images from singleton class of dummy data
        
        slideshow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slideshow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            slideshow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            slideshow.topAnchor.constraint(equalTo: contentView.topAnchor),
            slideshow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
