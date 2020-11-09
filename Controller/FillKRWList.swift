//
//  FillKRWList.swift
//  StreamyTask
//
//  Created by Yessen Yermukhanbet on 11/9/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit

class FillKRWList: NSObject {
    static var shared = FillKRWList()
    public func getData(){
        let url = URL(string: "https://api.gopax.co.kr/trading-pairs")
        NetworkAdapter.sharedInstance.getPairs(from: url!){ (success, result) in
            if success{
                for item in result!{
                    if (item["quoteAsset"] as! String) == "KRW"{
                        let pairName = item["name"] as! String
                        let newUrl = URL(string: "https://api.gopax.co.kr/trading-pairs/\(pairName)/ticker")
                        NetworkAdapter.sharedInstance.getData(from: newUrl!){ (success, result) in
                            if success{
                                let name = pairName
                                let price = result!["price"] as! Int
                                let volune = result!["volume"] as! Double
                                KRW.KRWlist.append(KRW(name: name, price: String(price), volume: String(volune)))
                            }else{
                                
                            }
                        }
                    }
                    
                }
            }else{
                
            }
        }
    }
}
