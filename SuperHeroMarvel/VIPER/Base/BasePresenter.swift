//
//  BasePresenter.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

class BasePresenter <View: AnyObject, Router: Any, Interactor: Any>: NSObject {
    
    //Declared week for the ARC to destroy them.
    internal weak var view: View?
    internal var router: Router?
    internal var interactor: Interactor?
    
    //Class initializer
    convenience init(view: View, router: Router? = nil, interactor: Interactor? = nil) {
        self.init()
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}
