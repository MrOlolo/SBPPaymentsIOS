//
//  Settings.swift
//  SBPWidget
//
//  Created by Konstantin Ignatiev on 07.04.2022.
//

import Foundation

enum App {
    enum Colors {
        static var sheetBackground: UIColor = .white
        static var textColor: UIColor = .black
        static var bankContainerColor: UIColor = .black.withAlphaComponent(0.10)
        static var bankContainerTouchedColor: UIColor = .black.withAlphaComponent(0.25)

        static let defaultSheetBackground: UIColor = .white
        static let deafultTextColor: UIColor = .black
        static let defaultBankContainerColor: UIColor = .black.withAlphaComponent(0.10)
        static let defaultBankContainerTouchedColor: UIColor = .black.withAlphaComponent(0.25)
    }

    enum Images {
        static var logo = "sbp_logo"
        static let darkLogo = "sbp_logo"
        static let lightLogo = "sbp_logo_light"
    }
}
