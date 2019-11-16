//
//  NetworkServices.swift
//  AlamofireMusic
//
//  Created by Владимир Файб on 16.11.2019.
//  Copyright © 2019 MacService. All rights reserved.
//

import UIKit
import Alamofire

class NetworkServices {
  func fetch(competion: @escaping ([Quote]?) -> Void) {
    let url = "https://api.coinmarketcap.com/v1/ticker/"
    let parameters = [String:String]()
    let headers = ["X-CMC_PRO_API_KEY":"90a3e6ef-c8f9-47d1-8748-9630a4abfd85"]
    
    Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseData { (dataResponse) in
      if let error = dataResponse.error {
        print("Error received requestiong data: \(error.localizedDescription)")
        competion(nil)
        return
      }
      guard let data = dataResponse.data else { return }
      
      let decoder = JSONDecoder()
      
      do {
        let object = try decoder.decode([Quote].self, from: data)
        competion(object)
//        self.quotes = object
//        
//        self.tableView.reloadData()
      } catch let jsonError {
        print("Failed to decode JSON: ", jsonError)
        competion(nil)
      }
    }
  }
}
