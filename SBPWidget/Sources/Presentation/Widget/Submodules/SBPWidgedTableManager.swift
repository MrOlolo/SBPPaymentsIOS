//
//  SBPWidgedTableManager.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 05.12.2020.
//  Copyright © 2020 Mykola Hordynchuk. All rights reserved.
//

import UIKit

enum SBPWidgedTableManagerEvent {
  case onRowCellTap(Int)
}

final class SBPWidgedTableManager: NSObject {
  var eventHandler: EventHandler<SBPWidgedTableManagerEvent>?
  private let tableView: UITableView

  var cells: [SBPWidgetCellType] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  init(tableView: UITableView) {
    self.tableView = tableView
    super.init()
    self.tableView.dataSource = self
    self.tableView.delegate = self
  }
  
  @objc func injected() {
    tableView.reloadData()
  }
}

extension SBPWidgedTableManager: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cells.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellType = cells[indexPath.row]
    switch cellType {
    case .item(let item):
      let cell: SBPBankCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.configure(with: item)
      cell.selectionStyle = .none
      return cell
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    eventHandler?(.onRowCellTap(indexPath.item))
  }
}
