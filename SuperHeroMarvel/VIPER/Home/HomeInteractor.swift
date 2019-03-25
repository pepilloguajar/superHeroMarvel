//
//  HomeInteractor.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

protocol HomeInteractorProtocol: AnyObject {
    
    func getHomeData(success: @escaping (HomeModel?) -> Void, failure: @escaping (NSError) -> Void)
}

final class HomeInteractor: BaseInteractor<HomePresenterProtocol>, HomeInteractorProtocol {
    
    internal var provider: HomeProviderProtocol?
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getHomeData(success: @escaping (HomeModel?) -> Void, failure: @escaping (NSError) -> Void) {
        self.getHomeDataAction(success: success, failure: failure)
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getHomeDataAction(success: @escaping (HomeModel?) -> Void, failure: @escaping (NSError) -> Void) {
        
        self.provider?.getHomeData(success: success, failure: failure)
    }
}
