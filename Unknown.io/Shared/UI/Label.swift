//
//  Label.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 12.04.2025.
//

import UIKit.UILabel

class DefaultLabel: UILabel {
        
    convenience init(text: String, size: CGFloat = 13, color: UIColor = .white) {
        self.init(frame: .zero)
        self.text = text
        font = .systemFont(ofSize: size)
        textColor = color
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init?(coder: NSCoder)")
    }
    
    func configure(size: CGFloat = 13, color: UIColor = .white) {
        textColor = .white
        font = .systemFont(ofSize: size)
    }
}
