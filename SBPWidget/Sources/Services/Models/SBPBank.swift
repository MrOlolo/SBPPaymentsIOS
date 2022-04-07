//
//  SBPBank.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 17.03.2021.
//

import Foundation

class SBPBankRaw: Decodable {
  var version: String
  var dictionary: [SBPBank]
}


class SBPBank: Decodable {
  var bankName: String
  var logoURL: String
  var schema: String
  var isInstalled: Bool = false
  
  enum CodingKeys: String, CodingKey {
    case bankName, logoURL, schema
  }
}
