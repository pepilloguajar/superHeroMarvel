//
//  HomeProvider.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeProviderProtocol: AnyObject {

    func getHomeData(success: @escaping (HomeModel?) -> Void, failure: @escaping (NSError) -> Void)
}

final class HomeProvider: BaseProvider, HomeProviderProtocol {
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getHomeData(success: @escaping (HomeModel?) -> Void, failure: @escaping (NSError) -> Void) {
        self.getHomeDataService(success: success, failure: failure)
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getHomeDataService(success: @escaping (HomeModel?) -> Void, failure: @escaping (NSError) -> Void) {

        _ = self.getProviderData(dto: ProviderDTO(params: nil,
                                                  method: HomeProviderConstants.HomeRequest.method,
                                                  endpoint: HomeProviderConstants.HomeRequest.endpoint),
                                 baseURL: DefaultsManager.getBaseUrl(),
                                 success: { data in

                                    guard let homeModelEntity = try? JSONDecoder().decode(HomeModelEntity.self, from: data) else {
                                        success (nil)
                                        return
                                    }
                                    let homeModel = HomeModel(homeModelEntity: homeModelEntity)

                                    success(homeModel)

        }, failure: { error in

            failure(error)
        })
    }
}

private struct HomeProviderConstants {
    struct HomeRequest {
        static let endpoint: String = DefaultsManager.getURL(apiURL: .listHero)
        static let method: HTTPMethod = .get
    }
}
