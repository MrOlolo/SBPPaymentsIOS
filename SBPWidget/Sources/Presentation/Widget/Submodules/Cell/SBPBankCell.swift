//
//  SBPBankCell.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 05.12.2020.
//  Copyright © 2020 Mykola Hordynchuk. All rights reserved.
//

import UIKit

class SBPBankCell: BaseTableViewCell<SBPBankCellView> {
    func configure(with item: SBPWidgetBankViewItem, colorCode: Int? = nil, textColorCode: Int? = nil) {
        if let color = colorCode {
            mainView.container.backgroundColor = UIColor(rgb: color)
        }

        if let color = textColorCode {
            mainView.titleLabel.textColor = UIColor(rgb: color)
        }

        mainView.titleLabel.text = item.title
        mainView.logoImageView.download(from: item.logoURL)
    }
}
