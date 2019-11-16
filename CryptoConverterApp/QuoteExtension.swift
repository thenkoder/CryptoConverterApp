//
//  QuoteExtension.swift
//  CryptoConverterApp
//
//  Created by Владимир Файб on 16.11.2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

import Foundation

extension Quote {
  var rankInt: Int? {
    return Int(rank)
  }
  var usdPriceDouble: Double? {
    return Double(usdPrice)
  }
  static func quoteString(_ value: Double?) -> String {
    if let value = value {
      return String(format: "%.02f", value)
    } else {
      return ""
    }
  }
}
