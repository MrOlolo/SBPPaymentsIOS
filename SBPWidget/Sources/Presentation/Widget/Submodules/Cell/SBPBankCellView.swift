//
//  SBPBankCellView.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 05.12.2020.
//  Copyright © 2020 Mykola Hordynchuk. All rights reserved.
//

import UIKit

class SBPBankCellView: BaseInteractiveView {
    let container = UIView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()

    override func addViews() {
        addSubview(container)
        [logoImageView, titleLabel].forEach { container.addSubview($0) }
    }

    override func anchorViews() {
        container
            .anchorTop(topAnchor, 5)
            .anchorLeft(leftAnchor, 0)
            .anchorRight(rightAnchor, 0)
            .anchorBottom(bottomAnchor, 5)
            .anchorHeight(72)

        logoImageView
            .anchorCenterYToSuperview()
            .anchorLeft(leftAnchor, 10)
            .anchorWidth(50)
            .anchorHeight(50)

        titleLabel
            .anchorLeft(logoImageView.rightAnchor, 10)
            .anchorCenterYToSuperview()
    }

    override func configureViews() {
        container.layer.cornerRadius = 15
        container.backgroundColor = App.Colors.bankContainerColor

        logoImageView.clipsToBounds = true
        logoImageView.layer.cornerRadius = 12
        titleLabel.font = .systemFont(ofSize: 18, weight: .regular)
        titleLabel.textColor = App.Colors.textColor
    }
}

extension SBPBankCellView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        container.backgroundColor = App.Colors.bankContainerTouchedColor
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        container.backgroundColor = App.Colors.bankContainerColor
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        container.backgroundColor = App.Colors.bankContainerColor
    }
}
