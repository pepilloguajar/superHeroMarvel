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
    var tableModel: [SuperHero] { get set }
    func getHomeData()
    func goToDetailHero(hero: SuperHero)
    func filterModel(text: String)
}

final class HomePresenter: BasePresenter<HomeView, HomeRouterProtocol, HomeInteractorProtocol>, HomePresenterProtocol {
    
    var homeAssemblyDTO: HomeAssemblyDTO?
    var modelHeroes: [SuperHero] = []
    var tableModel: [SuperHero] = []
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getHomeData() {
        self.getHomeDataAction()
    }
    
    internal func goToDetailHero(hero: SuperHero) {
        self.goToDetailHeroAction(hero: hero)
    }
    
    internal func filterModel(text: String) {
        self.filterModelAction(text: text)
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
            self.view?.showAlertWithError(title: "error".localized, message: "error_message", actions: nil)
            return
        }
        
        self.modelHeroes = listSuperHeroes
        self.tableModel = listSuperHeroes
        self.view?.reloadView()
        
    }
    
    fileprivate func goToDetailHeroAction(hero: SuperHero) {
        let dto = HeroDetailAssemblyDTO(superHero: hero)
        
        self.router?.presentDetailView(dto: dto)
    }
    
    fileprivate func filterModelAction(text: String) {
        self.tableModel = text.isEmpty ? modelHeroes
                : self.modelHeroes.filter{ ($0.name?.lowercased().contains(text.lowercased()) ?? false) || ($0.realName?.lowercased().contains(text.lowercased()) ?? false) }

        self.view?.reloadView()
    }
}
