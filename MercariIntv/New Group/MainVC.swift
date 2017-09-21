//
//  ViewController.swift
//  MercariIntv
//
//  Created by Evgeny Vlasov on 9/20/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    
    var arrayOfItems = [Item]()
    var item = Item()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
        // generate array of Item
        item.downloadData{posts in
            self.arrayOfItems = posts
            self.collection.reloadData()
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? Cell {
            
            let item = arrayOfItems[indexPath.row]
            cell.configure(image: item.imageURL, title: item.title, price: item.price, soldOut: item.soldOut)
        
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfItems.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

}

