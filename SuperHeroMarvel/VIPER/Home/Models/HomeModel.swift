//
//  HomeModel.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of Home
class HomeModel {
    var superheroes: [SuperHero]?
    init() {}

}

//extension to initialize the model Home from its struct
extension HomeModel {
    convenience init(homeModelEntity: HomeModelEntity) {
        self.init()
        self.superheroes = homeModelEntity.superheroes?.map{ SuperHero(superHeroEntity: $0) }
    }
}
