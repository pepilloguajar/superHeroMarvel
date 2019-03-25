//
//  SuperHero.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

class SuperHero {
    
    var name: String?
    var photo: String?
    var realName: String?
    var height: String?
    var power: String?
    var abilities: String?
    var groups: [String?]?
    
    init() {}
    
    convenience init(superHeroEntity: SuperHeroEntity) {
        self.init()
        self.name = superHeroEntity.name
        self.photo = superHeroEntity.photo
        self.realName = superHeroEntity.realName
        self.height = superHeroEntity.height
        self.power = superHeroEntity.power
        self.abilities = superHeroEntity.abilities
        self.groups = superHeroEntity.groups?.components(separatedBy: ",")
        
    }
    
}
