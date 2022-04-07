//
//  ModuleFactoryProtocol.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import Foundation

protocol AnyModuleFactoryProtocol {
  func create<T: BaseModuleFactoryProtocol>(_ type: T.Type) -> (input: T.ModuleInput, viewable: ModuleViewable, router: BaseRouterProtocol)
}


extension AnyModuleFactoryProtocol {
  func create<T: BaseModuleFactoryProtocol>(_ type: T.Type) -> (input: T.ModuleInput, viewable: ModuleViewable, router: BaseRouterProtocol) {
    return T.create()
  }
}


final class AnyModuleFactory: AnyModuleFactoryProtocol {}
