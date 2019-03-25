//
//  HeroDetailInteractor.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

protocol HeroDetailInteractorProtocol: AnyObject {
    
    func getHeroDetailData()
}

final class HeroDetailInteractor: BaseInteractor<HeroDetailPresenterProtocol>, HeroDetailInteractorProtocol {
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getHeroDetailData() {
        self.getHeroDetailDataAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getHeroDetailDataAction() {
        
    }
}
