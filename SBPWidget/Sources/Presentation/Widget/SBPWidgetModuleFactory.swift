//
//  SBPWidgetModuleFactory.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 04.12.2020.
//  Copyright © 2020 Mykola Hordynchuk. All rights reserved.
//

import Foundation

final class SBPWidgetModuleFactory: BaseModuleFactoryProtocol {
    static func create() -> (input: SBPWidgetModuleInput, viewable: ModuleViewable, router: BaseRouterProtocol) {
        let view = SBPWidgetViewController()
        let presenter = SBPWidgetPresenter()
        let interactor = SBPWidgetInteractor()
        let router = SBPWidgetRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        interactor.sbpBankService = SBPBankService()

        router.view = view
        router.transition.dismissCallback = presenter.handleDismiss

        return (presenter, view, router)
    }
}
