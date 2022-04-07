//
//  BaseRouter.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import Foundation
import UIKit

protocol BaseRouterProtocol: AnyObject {
  var view: ModuleViewable? { get set }
  var anyModuleFactory: AnyModuleFactoryProtocol? { get }
  var transition: TransitionProtocol { get set }
  
  func openWithNavigation(_ viewController: UIViewController?, transition: TransitionProtocol, completion: VoidClosure?)
  func open(_ viewController: UIViewController?, transition: TransitionProtocol, completion: VoidClosure?)
  func close(completion: VoidClosure?)
}


extension BaseRouterProtocol {

  var anyModuleFactory: AnyModuleFactoryProtocol? {
    return AnyModuleFactory()
  }
  
  var viewController: UIViewController? {
    return view?.viewController
  }
  
  func open(_ viewController: UIViewController?, transition: TransitionProtocol, completion: VoidClosure?) {
    guard let viewController = viewController else {
      assertionFailure("Nothing to open.")
      return
    }
    transition.open(viewController, from: self.viewController, completion: completion)
  }
  
  func openWithNavigation(_ viewController: UIViewController?, transition: TransitionProtocol, completion: VoidClosure?) {
    guard let viewController = viewController else {
      assertionFailure("Nothing to open.")
      return
    }
    let nav = UINavigationController(rootViewController: viewController)
    open(nav, transition: transition, completion: completion)
  }
  
  func close(completion: VoidClosure?) {
    guard let viewController = viewController else {
      assertionFailure("Nothing to close.")
      return
    }
    transition.close(viewController, completion: completion)
  }
}


class BaseRouter: BaseRouterProtocol {
  weak var view: ModuleViewable?
  var transition: TransitionProtocol = HalfModalTransition()
}

