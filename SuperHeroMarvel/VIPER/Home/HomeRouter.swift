//
//  HomeRouter.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject {
    
    func presentDetailView()
}

final class HomeRouter: BaseRouter<HomePresenterProtocol, HomeView>, HomeRouterProtocol {
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func presentDetailView() {
        
    }
}
