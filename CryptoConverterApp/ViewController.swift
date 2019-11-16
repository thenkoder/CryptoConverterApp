//
//  ViewController.swift
//  CryptoConverterApp
//
//  Created by Другов Родион on 16.11.2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

//956d90c5-3ff6-48a9-8948-7c206dcfaed2

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var quotes = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.coinmarketcap.com/v1/ticker/"
        let parameters = [String:String]()
        let headers = ["X-CMC_PRO_API_KEY":"956d90c5-3ff6-48a9-8948-7c206dcfaed2"]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                return
            }
            guard let data = dataResponse.data else { return }
            print(data)
            
            let decoder = JSONDecoder()
            
            do {
                let object = try decoder.decode([Quote].self, from: data)
                self.quotes = object
                print(self.quotes)
                
                //            self.tableView.reloadData()
            } catch let jsonError {
                print("Failed to decode JSON: ", jsonError)
            }
        }
    }
}

