//
//  WebService.swift
//  spacexData
//
//  Created by İSMAİL AÇIKYÜREK on 26.07.2022.
//


import Foundation
import UIKit
import Alamofire


//MARK: Protocol
protocol SpacexDataServiceProtokol {
    func fethAllPosts(url:String,onSuccess: @escaping ([SpacexDataModel]) -> Void, onFail: @escaping (String?) -> Void)
}

//MARK: Get Datas
struct SpacexDataService: SpacexDataServiceProtokol {
    func fethAllPosts(url: String, onSuccess: @escaping ([SpacexDataModel]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(url, method: .get).validate().responseDecodable(of: [SpacexDataModel].self) { (response) in
            guard let items =  response.value else {
                onFail(response.debugDescription)
                return
            }

            onSuccess(items)
        }
    }
    
    
}
