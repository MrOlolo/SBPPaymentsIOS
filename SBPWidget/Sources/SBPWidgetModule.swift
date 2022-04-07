//
//  SBPWidgetModule.swift
//  SBPWidget
//
//  Created by m on 22.03.2021.
//

import UIKit

typealias EventHandler<T> = ((T) -> Void)
public typealias VoidClosure = () -> Void

public class SBPWidgetModule {
    public typealias CompletionHandler = (Result<String?, Error>) -> Void

    private var completion: CompletionHandler?

    public init() {}

    public func show(on viewController: UIViewController, completion: @escaping CompletionHandler) {
        App.Colors.sheetBackground = App.Colors.defaultSheetBackground
        App.Colors.textColor = App.Colors.deafultTextColor
        App.Images.logo = App.Images.darkLogo

        self.completion = completion
        let sbpModule = AnyModuleFactory().create(SBPWidgetModuleFactory.self)
        sbpModule.input.moduleOutput = self
        sbpModule.router.transition.open(sbpModule.viewable.viewController, from: viewController, completion: nil)
    }

    public func show(on viewController: UIViewController, backgroundColor: Int, textColor: Int, completion: @escaping CompletionHandler) {
        App.Colors.sheetBackground = UIColor(argb: backgroundColor)
        App.Colors.textColor = UIColor(argb: textColor)
        if colorIsDark(rgb: backgroundColor) {
            App.Images.logo = App.Images.lightLogo
        } else {
            App.Images.logo = App.Images.darkLogo
        }

        self.completion = completion
        let sbpModule = AnyModuleFactory().create(SBPWidgetModuleFactory.self)
        sbpModule.input.moduleOutput = self
        sbpModule.router.transition.open(sbpModule.viewable.viewController, from: viewController, completion: nil)
    }

    private func callback(_ result: Result<String?, Error>) {
        completion?(result)
        completion = nil
    }
}

extension SBPWidgetModule: SBPWidgetModuleOutput {
    func selectedBankApplicationScheme(_ scheme: String?) {
        callback(.success(scheme))
    }

    func gotError(error: Error) {
        callback(.failure(error))
    }
}
