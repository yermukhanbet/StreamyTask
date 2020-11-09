//
//  BTC.swift
//  StreamyTask
//
//  Created by Yessen Yermukhanbet on 11/9/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit

class BTC: NSObject {
    var name: String
    var price: String
    var volume: String
    var title: String
    static var saved = BTC()
    static var KRWlist: [BTC] = []
    init(name: String, price: String, volume: String, title: String){
        self.name = name
        self.price = price
        self.volume = volume
        self.title = title
    }
    override init(){
        self.name = ""
        self.price = ""
        self.volume = ""
        self.title = ""
    }
     required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
