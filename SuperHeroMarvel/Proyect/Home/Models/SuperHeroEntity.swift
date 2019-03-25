//
//  SuperHeroEntity.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

//Struct that represents the data of the models of a class Home
struct SuperHeroEntity: Codable {
    let name: String?
    let photo: String?
    let realName: String?
    let height: String?
    let power: String?
    let abilities: String?
    let groups: String?
}
