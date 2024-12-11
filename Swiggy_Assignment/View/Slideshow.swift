//
//  LandscapeSlideshow.swift
//  Swiggy_Assignment
//
//  Created by Karan Verma on 07/12/24.
//


import UIKit

class Slideshow: UIView {
    // MARK: - Properties
    var images: [UIImage?] = []
    private var currentIndex: Int = 0
    private var autoSlideTimer: Timer?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LandscapeCell.self, forCellWithReuseIdentifier: "LandscapeCell")
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
    // MARK: - intializers
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    
        startAutoSlide()
    }
    
    // MARK: - Auto Slide Methods
    private func startAutoSlide() {
        autoSlideTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            self?.autoAdvanceSlide()
        }
    }
    
    private func autoAdvanceSlide() {
        guard images.count > 1 else { return }
        
        currentIndex = (currentIndex + 1) % images.count
        let indexPath = IndexPath(item: currentIndex, section: 0)
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    deinit {
        autoSlideTimer?.invalidate()
    }
}

// MARK: - Collection View Data Source
extension Slideshow: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LandscapeCell", for: indexPath) as! LandscapeCell
        cell.configure(with: images[indexPath.item]!)
        return cell
    }
}

// MARK: - Collection View Delegate Flow Layout
extension Slideshow: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size // same size as collection view
    }
}



// MARK: -  Collection View Cell for Slideshow
class LandscapeCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 17
        imgView.layer.cornerCurve = .continuous
        imgView.layer.borderColor = UIColor.lightGray.cgColor
        imgView.layer.borderWidth = 0.2
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    func configure(with image: UIImage) {
        imageView.image = image
    }
}

