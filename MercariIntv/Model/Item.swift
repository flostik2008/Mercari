//
//  Item.swift
//  MercariIntv
//
//  Created by Evgeny Vlasov on 9/20/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    var imageURL: String!
    var title: String!
    var price: String!
    var soldOut: String!
    
    var items = [Item]()
    
    init() {
        
    }
    
    init(postDict: [String:Any]){
        // create post item from givven dictionary.
        
        if let name = postDict["name"] as? String {
            self.title = name
        }
        
        if let photoLink = postDict["photo"] as? String {
            self.imageURL = photoLink
        }
        
        if let price = postDict["price"] as? Int {
            self.price = String(price)
        }
        
        if let soldOutStat = postDict["status"] as? String {
                self.soldOut = soldOutStat
        }
    }
    
    func downloadData(completed: @escaping ([Item])->()) {
       // right now we are fetching from local file. To fetch from a server, we just need to add a json link and an Alamofire request.
        
            if let path = Bundle.main.path(forResource: "all", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let object = json as? [String: Any] {
                            if let arrayOfDict = object["data"] as? [[String:Any]] {
                                for dict in arrayOfDict {
                                    let item = Item(postDict: dict)
                                    items.append(item)
                                }
                            }
                        }
                    } catch let error{
                        print(error.localizedDescription)
                    }
                } catch let error{
                    print(error.localizedDescription)
                }
            } else {
                print("no file")
            }
        completed(self.items)
    }


}



