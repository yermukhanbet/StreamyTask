//
//  NetworkAdapter.swift
//  StreamyTask
//
//  Created by Yessen Yermukhanbet on 11/9/20.
//  Copyright © 2020 Yessen Yermukhanbet. All rights reserved.
//

import UIKit
import Alamofire
class NetworkAdapter: NSObject {
    static let sharedInstance = NetworkAdapter()
    public func getPairs(from url: URL, completion:@escaping(_ success:Bool, _ result:[Dictionary<String,Any>]?)-> Void){
        AF.request(url , parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [Dictionary<String, Any>] else {
                    print("Error: Cannot convert data to JSON object")
                    completion(false,nil)
                    return
                }
                completion(true, jsonObject)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
    }
    public func getData(from url: URL, completion:@escaping(_ success:Bool, _ result:[String:Any]?)-> Void){
        AF.request(url , parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    completion(false,nil)
                    return
                }
                completion(true, jsonObject)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
    }
}
