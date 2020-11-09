//
//  KRW.swift
//  StreamyTask
//
//  Created by Yessen Yermukhanbet on 11/9/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit

class KRW: NSObject {
    var name: String
    var price: String
    var volume: String
    static var saved = KRW()
    static var KRWlist: [KRW] = []
    init(name: String, price: String, volume: String){
        self.name = name
        self.price = price
        self.volume = volume
    }
    override init(){
        self.name = ""
        self.price = ""
        self.volume = ""
    }
     required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
