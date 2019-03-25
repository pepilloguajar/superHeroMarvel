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
    var modelHeroes: [SuperHero] { get set }
    func getHomeData()
    func goToDetailHero(index: Int)
}

final class HomePresenter: BasePresenter<HomeView, HomeRouterProtocol, HomeInteractorProtocol>, HomePresenterProtocol {
    
    var homeAssemblyDTO: HomeAssemblyDTO?
    var modelHeroes: [SuperHero] = []
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getHomeData() {
        self.getHomeDataAction()
    }
    
    internal func goToDetailHero(index: Int) {
        self.goToDetailHeroAction(index: index)
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getHomeDataAction() {
        
        self.interactor?.getHomeData(success: { homeModel in
            
            self.getHomeServiceLoaded(homeModel: homeModel)
            
        }, failure: { _ in
            
            self.getHomeServiceLoaded()
            
        })
    }
    
    fileprivate func getHomeServiceLoaded(homeModel: HomeModel? = nil) {
        
        guard let listSuperHeroes = homeModel?.superheroes else {
            self.view?.showAlertWithError(title: "Error", message: "Ha ocurrido un error al descargar los datos", actions: nil)
            return
        }
        
        self.modelHeroes = listSuperHeroes
        self.view?.reloadView()
        
    }
    
    fileprivate func goToDetailHeroAction(index: Int) {
        let dto = HeroDetailAssemblyDTO(superHero: self.modelHeroes[index])
        
        self.router?.presentDetailView(dto: dto)
    }
}
