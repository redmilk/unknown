//
//  GradientView.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit

class GradientView: NiblessView {
    override class var layerClass: AnyClass {
        CAGradientLayer.classForCoder()
    }

    var gradient: CAGradientLayer { layer as! CAGradientLayer }
}
