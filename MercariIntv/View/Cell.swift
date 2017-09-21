//
//  Cell.swift
//  MercariIntv
//
//  Created by Evgeny Vlasov on 9/20/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit
import Haneke

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var soldImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImg.layer.cornerRadius = 10.0
        priceLbl.layer.cornerRadius = priceLbl.frame.height / 2
        priceLbl.clipsToBounds = true

    }
    
    func configure(image: String, title: String, price: String, soldOut: String) {
        
        let url = URL(string: image)
      //  cellImg.contentMode = .scaleAspectFill
        if let huy = url {
            cellImg.hnk_setImageFromURL(huy)
        }
        self.title.text = title
        self.priceLbl.text = "$"+price
        
        if soldOut == "sold_out" {
            soldImg.isHidden = false
        } else {
            soldImg.isHidden = true            
        }
    }
}

