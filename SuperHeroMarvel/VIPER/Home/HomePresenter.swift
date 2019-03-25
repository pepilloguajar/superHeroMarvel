//
//  HomePresenter.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

protocol HomePresenterProtocol: AnyObject {
    
    var homeAssemblyDTO: HomeAssemblyDTO? { get set }
    func getHomeData()
}

final class HomePresenter: BasePresenter<HomeView, HomeRouterProtocol, HomeInteractorProtocol>, HomePresenterProtocol {
    
    var homeAssemblyDTO: HomeAssemblyDTO?
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getHomeData() {
        self.getHomeDataAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getHomeDataAction() {
        
        
        self.interactor?.getHomeData(success: { homeModel in
            
            self.getHomeServiceLoaded(homeModel: homeModel)
            
        }, failure: { error in
            
            self.getHomeServiceLoaded()
            
        })
    }
    
    fileprivate func getHomeServiceLoaded(homeModel: HomeModel? = nil) {
        
        guard let homeModel = homeModel else { return } // Gestionar errores
        
        print(homeModel) // Gestionar success
        
    }
}
