//
//  NSObject+Extension.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
