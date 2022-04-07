//
//  Presenter+ErrorHandlable.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import Foundation

protocol ErrorHandlable: AnyObject {
  func onInteractorError(_ error: Error)
}
