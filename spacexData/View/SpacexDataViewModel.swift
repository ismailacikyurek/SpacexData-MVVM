//
//  SpacexDataViewModel.swift
//  spacexData
//
//  Created by İSMAİL AÇIKYÜREK on 26.07.2022.
//


import UIKit
import Alamofire
import Kingfisher


protocol DashboardViewModelProtocol {
    func initialize()
    func setUpDelegate(_ viewController: SpacexDataViewController)
   
}

protocol DashboardViewModelOutputProtocol {
    func showData(content: [SpacexDataModel])
}

class DashboardViewModel:NSObject {
    private let service: SpacexDataServiceProtokol = SpacexDataService()
    var delegate: DashboardViewModelOutputProtocol?

    func initialize() {
        SpacexDataServicee()
    }
    
     func SpacexDataServicee() {
         let url = "https://api.spacexdata.com/v2/launches"
        service.fethAllPosts(url: url) { [weak self] model in
            self?.delegate?.showData(content: model)
           
        } onFail: { error in
            print(error?.description ?? "An error occured")
        }
    }
}

extension DashboardViewModel: DashboardViewModelProtocol {

    
    func setUpDelegate(_ viewController: SpacexDataViewController) {
        delegate = viewController
    }
    
}


