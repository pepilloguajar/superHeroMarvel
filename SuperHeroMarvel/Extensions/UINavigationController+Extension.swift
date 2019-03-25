//
//  UINavigationController+Extension.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    open override var shouldAutorotate: Bool {
        return true
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (visibleViewController?.supportedInterfaceOrientations)!
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return (visibleViewController?.preferredInterfaceOrientationForPresentation)!
    }
}
