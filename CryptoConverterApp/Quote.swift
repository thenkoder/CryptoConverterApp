//
//  Quote.swift
//  CryptoConverterApp
//
//  Created by Другов Родион on 16.11.2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

import Foundation

struct Quote: Decodable {
    var id: String
    var name: String
    var symbol: String
    var rank: String
    var usdPrice: String
    var btcPrice: String
    var twentyFourHoursVolumeUsd: String
    var marketCapUsd: String
    var availableSupply: String
    var totalSupply: String
    var maxSupply: String?
    var percentChangeOneH: String
    var percentChangeTwentyFourH: String
    var percentChangeSevenD: String
    var lastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case rank
        case usdPrice = "price_usd"
        case btcPrice = "price_btc"
        case twentyFourHoursVolumeUsd = "24h_volume_usd"
        case marketCapUsd = "market_cap_usd"
        case availableSupply = "available_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case percentChangeOneH = "percent_change_1h"
        case percentChangeTwentyFourH = "percent_change_24h"
        case percentChangeSevenD = "percent_change_7d"
        case lastUpdated = "last_updated"
    }
}
