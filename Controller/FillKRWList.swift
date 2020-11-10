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
    public func fillPairs(){
        let url = URL(string: "https://api.gopax.co.kr/trading-pairs")
        NetworkAdapter.sharedInstance.getPairs(from: url!){ (success, result) in
            if success{
                var index = 0
                for item in result!{
                    if(item["quoteAsset"] as! String) == "KRW"{
                        KRW.KRWPairs.append(item["name"] as! String)
                    }else if (item["quoteAsset"] as! String) == "BTC"{
                        BTC.BTCPairs.append(item["name"] as! String)
                    }
                    print(index)
                    index = index + 1
                }
                self.fillKRW()
            }
        }
    }
    public func fillKRW(){
        print("KRW")
        var count = 0
        for item in KRW.KRWPairs{
            let url = URL(string: "https://api.gopax.co.kr/trading-pairs/\(item)/ticker")
                NetworkAdapter.sharedInstance.getData(from: url!){ (success, result) in
                    print(result)
                    if success{
                        let price = result!["price"] as! Double
                        let volume = result!["volume"] as! Double
                            KRW.KRWlist.append(KRW(name: item, price: String(price), volume: String(volume)))
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
    public func fillBTC(){
        print("BTC")
        var count = 0
        for item in BTC.BTCPairs{
                print(item)
                let url = URL(string: "https://api.gopax.co.kr/trading-pairs/\(item)/ticker")
                NetworkAdapter.sharedInstance.getData(from: url!){ (success, result) in
                    if success{
                        let price = result!["price"] as! Double
                        let volume = result!["volume"] as! Double
                        BTC.BTClist.append(BTC(name: item, price: String(price), volume: String(volume)))
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
extension NSObject {
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
