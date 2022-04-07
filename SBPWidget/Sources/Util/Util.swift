//
//  util.swift
//  SBPWidget
//
//  Created by Konstantin Ignatiev on 07.04.2022.
//

import Foundation

func colorIsDark(rgb: Int) -> Bool {
    let r = CGFloat((rgb >> 16) & 0xFF)
    let g = CGFloat((rgb >> 8) & 0xFF)
    let b = CGFloat(rgb & 0xFF)
    let a = (r * 0.2126 + g * 0.7152 + b * 0.0722) / 255
    return a < 0.5
}
