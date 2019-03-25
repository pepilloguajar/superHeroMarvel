//
//  HeroDetailModel.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of HeroDetail
class HeroDetailModel {
    var idHeroDetail: String?
    init() {}

}

//extension to initialize the model HeroDetail from its struct
extension HeroDetailModel {
    convenience init(heroDetailModelEntity: HeroDetailModelEntity) {
        self.init()
        self.idHeroDetail = heroDetailModelEntity.idHeroDetail
    }
}
