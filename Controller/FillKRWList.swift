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
    //get pairs
    public func fillPairs(){
        let url = URL(string: "https://api.gopax.co.kr/trading-pairs")
        NetworkAdapter.sharedInstance.getPairs(from: url!){ (success, result) in
            if success{
                for item in result!{
                    if(item["quoteAsset"] as! String) == "KRW"{
                        KRW.KRWPairs.append(item["name"] as! String)
                    }else if (item["quoteAsset"] as! String) == "BTC"{
                        BTC.BTCPairs.append(item["name"] as! String)
                    }
                }
                self.fillKRW()
            }
        }
    }
    //get info about KRW
    public func fillKRW(){
        var count = 0
        for item in KRW.KRWPairs{
            let url = URL(string: "https://api.gopax.co.kr/trading-pairs/\(item)/ticker")
                NetworkAdapter.sharedInstance.getData(from: url!){ (success, result) in
                    if success{
                        let price = result!["price"] as! Double
                        let volume = result!["volume"] as! Double
                            KRW.KRWlist.append(KRW(name: item, price: price, volume: volume))
                    }
                }
                if count == 5{
                    count = 0
                    sleep(UInt32(1))
                }else{
                    count = count+1
                }
        }
        self.fillBTC()
    }
    //get info about BTC
    public func fillBTC(){
        var count = 0
        for item in BTC.BTCPairs{
                let url = URL(string: "https://api.gopax.co.kr/trading-pairs/\(item)/ticker")
                NetworkAdapter.sharedInstance.getData(from: url!){ (success, result) in
                    if success{
                        let price = result!["price"] as! Double
                        let volume = result!["volume"] as! Double
                        BTC.BTClist.append(BTC(name: item, price: price, volume: volume))
                    }
                }
            if count == 5{
                count = 0
                sleep(UInt32(1))
            }else{
                count = count+1
            }
        }
    }
}
