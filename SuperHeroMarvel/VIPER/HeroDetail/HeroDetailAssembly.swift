//
//  HeroDetailAssembly.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

final class HeroDetailAssembly: BaseAssembly {
    
    static func heroDetailPresenterNavigationController(heroDetailAssemblyDTO: HeroDetailAssemblyDTO? = nil) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: self.heroDetailPresenterView(heroDetailAssemblyDTO: heroDetailAssemblyDTO))
        
        return navigationController
    }
    
    static func heroDetailPresenterView(heroDetailAssemblyDTO: HeroDetailAssemblyDTO? = nil) -> HeroDetailView {
        
        let view = HeroDetailView(nibName: SuperHeroMarvelUtils.getXib(xibFile: .heroDetailView), bundle: nil)
        view.presenter = self.heroDetailPresenter(view: view)
        view.presenter?.heroDetailAssemblyDTO = heroDetailAssemblyDTO
        
        return view
    }
    
    static fileprivate func heroDetailPresenter(view: HeroDetailView) -> HeroDetailPresenterProtocol {
        
        let presenter = HeroDetailPresenter(view: view)
        presenter.router = self.heroDetailRouter(presenter: presenter, view: view)
        presenter.interactor = self.heroDetailInteractor(presenter: presenter)
        
        return presenter
    }
    
    static fileprivate func heroDetailRouter(presenter: HeroDetailPresenter, view: HeroDetailView) -> HeroDetailRouterProtocol {
        
        let router = HeroDetailRouter(presenter: presenter, view: view)
        
        return router
    }
    
    static fileprivate func heroDetailInteractor(presenter: HeroDetailPresenterProtocol) -> HeroDetailInteractorProtocol {
        
        let interactor = HeroDetailInteractor(presenter: presenter)
        
        return interactor
    }
}

//Struct that represents the transfer object of HeroDetail
struct HeroDetailAssemblyDTO {
    
    let superHero: SuperHero?
}
