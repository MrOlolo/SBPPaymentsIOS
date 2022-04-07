//
//  BaseViewController.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import UIKit

class BaseViewController<View: UIView>: UIViewController {
  var mainView: View
  private var wasShownAtLeastOnce = false
  private var showAndHideNavigationBar = false
  
  init(view: View = View()) {
    self.mainView = view
    super.init(nibName: nil, bundle: nil)
  }
  
  @available (*, unavailable) required init?(
    coder aDecoder: NSCoder) {
    fatalError("required init not implemented")
  }
  
  //MARK: ViewController lifecycle
  override func loadView() {
    view = mainView
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if wasShownAtLeastOnce {
      viewWillAppearAgain()
    } else {
      viewWillAppearAtFirstTime()
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if wasShownAtLeastOnce {
      viewDidAppearAgain()
    } else {
      viewDidAppearAtFirstTime()
    }
    
    wasShownAtLeastOnce = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    if showAndHideNavigationBar {
      navigationController?.setNavigationBarHidden(true, animated: true)
    }
  }
  
  func shouldShowAndHideNavigationBar() {
    showAndHideNavigationBar = true
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  func viewWillAppearAtFirstTime() {
    //to override
  }
  
  func viewWillAppearAgain() {
    //to override
  }
  
  func viewDidAppearAtFirstTime() {
    //to override
  }
  
  func viewDidAppearAgain() {
    //to override
  }
}
