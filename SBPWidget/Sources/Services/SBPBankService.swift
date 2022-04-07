//
//  SBPBankService.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 05.12.2020.
//  Copyright © 2020 Mykola Hordynchuk. All rights reserved.
//

import Foundation

protocol SBPBankServiceProtocol {
  func getBankApplications() throws -> [SBPBank]
}

final class SBPBankService: SBPBankServiceProtocol {
  private let url = "https://qr.nspk.ru/proxyapp/c2bmembers.json"
  
  func getBankApplications() throws -> [SBPBank] {
    let url = URL(string: url)!
    let data = try Data(contentsOf: url, options: .alwaysMapped)
    let decoder = JSONDecoder()
    let jsonData = try decoder.decode(SBPBankRaw.self, from: data)
    return jsonData.dictionary
  }
}
