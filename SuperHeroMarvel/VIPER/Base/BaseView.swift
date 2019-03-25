//
//  BaseView.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewControllerViewDidLoadProtocol {
    
    func i18N() // Internacionalicación de los literales
    func initializeGUI() // Inicialización de los componentes gráficos
}

protocol BaseViewControllerViewWillAppearProtocol {
    
    func callWebService() // Llamadas a Servicios Web
    func manageGUI() // Modificación de los componentes gráficos
}


class BaseView<Presenter: Any>: BaseViewController {
    
    internal var presenter: Presenter?
    var isPush: Bool = true // Necesario para realizar el refresh de la pantalla, solo cuando se hace push, y no pop.
    
    deinit {
        self.presenter = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewController = self as? BaseViewControllerViewDidLoadProtocol {
            
            viewController.i18N()
            viewController.initializeGUI()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let viewController = self as? BaseViewControllerViewWillAppearProtocol {
            
            // Si es push, y la pantalla implementa el refresh, se refresca la información de la pantalla.
            if self.isPush {
                
                viewController.callWebService()
            }
            viewController.manageGUI()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.isPush = false
    }
    
    func showAlertWith(title: String, message: String, actions: NSArray?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        if actions == nil {
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        } else {
            for action in actions! {
                alert.addAction((action as? UIAlertAction) ?? UIAlertAction())
            }
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithError(title: String, message: String, actions: NSArray?) {
        self.showAlertWith(title: title, message: message, actions: actions)
    }
}
