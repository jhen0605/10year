//
//  sliderImage.swift
//  10year
//
//  Created by 簡吟真 on 2021/4/23.
//

import UIKit

@IBDesignable
class sliderImage: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setThumbImage(thumbImage, for: .normal)
        }
    }

}
