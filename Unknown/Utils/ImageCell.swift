//
//  ImageCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit
import SDWebImage

class ImageCell: UICollectionViewCell {
    
    let imageView = SDAnimatedImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundView = imageView
        
        imageView.contentMode = .scaleAspectFill
        imageView.sd_imageTransition = .fade
        imageView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.sd_cancelCurrentImageLoad()
        imageView.image = nil
    }
    
    func setImageURL(_ url: URL?) {
        imageView.sd_setImage(with: url, completed: nil)
    }
}
