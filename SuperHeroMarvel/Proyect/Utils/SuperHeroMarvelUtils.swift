//
//  SuperHeroMarvelUtils.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

class SuperHeroMarvelUtils {
    static func getXib(xibFile: XibFile) -> String {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return xibFile.rawValue
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return xibFile.rawValue + "_iPad"
        } else {
            return ""
        }
    }
}
