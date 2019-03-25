//
//  HeroDetailPresenter.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

protocol HeroDetailPresenterProtocol: AnyObject {
    
    var heroDetailAssemblyDTO: HeroDetailAssemblyDTO? { get set }
    func goToHome()
    
}

final class HeroDetailPresenter: BasePresenter<HeroDetailView, HeroDetailRouterProtocol, HeroDetailInteractorProtocol>, HeroDetailPresenterProtocol {
    
    var heroDetailAssemblyDTO: HeroDetailAssemblyDTO?
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func goToHome() {
        self.goToHomeAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func goToHomeAction() {
        self.router?.goToHome()
    }
}
