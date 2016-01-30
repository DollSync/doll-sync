//
//  AirService.swift
//  AirCommCamera
//
//  Created by 文光石 on 2015/12/17.
//  Copyright © 2015年 Threees. All rights reserved.
//

import UIKit

class AirService: NSObject {
    //static let servUrl = "https://air-camera.herokuapp.com/api/v1/items"
    static let servUrl = "http://air-camera.herokuapp.com/api/v1/items"
    
    class func uploadMovie(path: String) {
        AirNetworkManager.uploadMovieWithUrl(servUrl, path: path) { (result) -> Void in
            print(result)
        }
    }
}
