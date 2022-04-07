//
//  UIColor+Constants.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 17.03.2021.
//

import UIKit

extension UIColor {
    @nonobjc class var lightGray: UIColor {
        return UIColor(red: 244 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1)
    }

    @nonobjc class var darkGray: UIColor {
        return UIColor(red: 210 / 255.0, green: 210 / 255.0, blue: 210 / 255.0, alpha: 1)
    }

    convenience init(red: Int, green: Int, blue: Int, alpha: Int = 255) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha >= 0 && alpha <= 255, "Invalid alpha component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            alpha: (argb >> 24) & 0xFF
        )
    }
}
