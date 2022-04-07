//
//  SBPWidgetViewController.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 04.12.2020.
//  Copyright © 2020 Mykola Hordynchuk. All rights reserved.
//

import UIKit

enum SBPWidgetViewEvent {
  case onTableViewEvent(event: SBPWidgedTableManagerEvent)
  case onCloseTap
}


protocol SBPWidgetPresenterToViewProtocol: AnyObject {
  func setupInitialState()
  func update(with items: [SBPWidgetBankViewItem])
}


final class SBPWidgetViewController: BaseViewController<SBPWidgetView> {
  var presenter: SBPWidgetViewToPresenterProtocol?
  var sbpBankTableManager: SBPWidgedTableManager?
  
  let offset = 82
  let maxItems = 4
  
  override func viewWillAppearAtFirstTime() {
    presenter?.onViewFirstWillAppear()
  }
}


extension SBPWidgetViewController: SBPWidgetPresenterToViewProtocol {
  func setupInitialState() {
    configureUI()
    configureActions()
  }
  
  func update(with items: [SBPWidgetBankViewItem]) {
    if items.count > 0 {
      if items.count > maxItems {
        mainView.bankContainerHeightConstraint?.constant = CGFloat(maxItems * offset)
      } else {
        mainView.bankContainerHeightConstraint?.constant = CGFloat(items.count * offset)
      }
      mainView.emptyContainer.isHidden = true
      sbpBankTableManager?.cells = items.map { SBPWidgetCellType.item($0) }
    } else {
      mainView.bankContainerHeightConstraint?.constant = CGFloat(offset)
      mainView.emptyContainer.isHidden = false
      mainView.tableView.isHidden = true
    }
  }
}


private
extension SBPWidgetViewController {
  func configureUI() {
    sbpBankTableManager = SBPWidgedTableManager(tableView: mainView.tableView)
  }
  
  func configureActions() {
    sbpBankTableManager?.eventHandler = { [unowned self] event in
      self.presenter?.onViewEvent(.onTableViewEvent(event: event))
    }
    mainView.closeButton.addTarget(self, action: #selector(onCloseTap(_:)), for: .touchUpInside)
  }
  
  @objc func onCloseTap(_ sender: UIButton) {
    presenter?.onViewEvent(.onCloseTap)
  }
}
