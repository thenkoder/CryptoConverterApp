//
//  Converter.swift
//  CryptoConverterApp
//
//  Created by Владимир Файб on 16.11.2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

import Foundation

class Converter {
  var baseQuote: Quote
  
  func exchanger(amount: Double, convertQuote: Quote) -> Double? {
    if let usdPrice = convertQuote.usdPriceDouble,
      let baseQuotePrice = baseQuote.usdPriceDouble,
      baseQuotePrice != 0
    {
      return amount * usdPrice / baseQuotePrice
    } else {
      return nil
    }
  }
  
  init(baseQuote: Quote) {
    self.baseQuote = baseQuote
  }
}
