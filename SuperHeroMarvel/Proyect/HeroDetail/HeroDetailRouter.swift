//
//  HeroDetailRouter.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

protocol HeroDetailRouterProtocol: AnyObject {
    
    func goToHome()
}

final class HeroDetailRouter: BaseRouter<HeroDetailPresenterProtocol, HeroDetailView>, HeroDetailRouterProtocol {
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func goToHome() {
        self.view?.navigationController?.popViewController(animated: true)
    }
}
