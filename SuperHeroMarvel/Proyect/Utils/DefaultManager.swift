//
//  DefaultManager.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

class DefaultsManager: NSObject {
    
    #if DEV
    static let environementDefault: Environement = Environement.DEV
    #elseif PRO
    static let environementDefault: Environement = Environement.PRO
    #endif
    
    static func getBaseUrl() -> String {
        
            switch self.environementDefault {
            case .DEV:
                return "https://api.myjson.com"

            case .PRO:
                return "https://api.myjson.com"
            }
    }
    
    static func getURL(apiURL: ApiUrl) -> String {
        
        switch apiURL {
        case .listHero:
            return "/bins/bvyob"
        }
        
    }
    
}
