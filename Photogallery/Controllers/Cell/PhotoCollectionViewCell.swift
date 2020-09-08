//
//  PhotoCollectionViewCell.swift
//  Photogallery
//
//  Created by Roman Oliinyk on 07.09.2020.
//  Copyright © 2020 Roman Oliinyk. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotoCell"
    
    private let checkMark: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()
    
     let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoURL = unsplashPhoto.urls["regular"]
            guard let imageURL = photoURL, let url = URL(string: imageURL)  else { return }
            photoImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        updateSelectedState()
        setupImageViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override var isSelected: Bool {
        didSet {
          updateSelectedState()
        }
    }
    
    private func updateSelectedState() {
        photoImageView.alpha = isSelected ? 0.7 : 1
        checkMark.alpha = isSelected ? 1 : 0
    }
    
    private func setupImageViews() {
        self.addSubview(photoImageView)
        self.addSubview(checkMark)
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        checkMark.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -8).isActive = true
        checkMark.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -8).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
