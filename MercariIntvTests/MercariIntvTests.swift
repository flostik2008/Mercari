//
//  MercariIntvTests.swift
//  MercariIntvTests
//
//  Created by Evgeny Vlasov on 9/20/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import XCTest
@testable import MercariIntv

class MercariIntvTests: XCTestCase {
    
    func testItemPrice() {
        let dict = ["name": "men3","status": "sold_out","price": 38,"photo": "https://dummyimage.com/400x400/000/fff?text=men3"] as [String : Any]
        let item = Item(postDict: dict)
        XCTAssertEqual(item.price, "38")
    }
    
    func testArrayOfItems() {
        var items = [Item]()
        for _ in 0...5 {
            let item = Item()
            items.append(item)
        }
        let controller = MainVC()
        controller.arrayOfItems = items
        XCTAssertEqual(controller.arrayOfItems.count, items.count)
    }
}


