//
//  HeroDetailView.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

class HeroDetailView: BaseView<HeroDetailPresenterProtocol> {
    // MARK: IBOutlets declaration of all controls
    
    @IBOutlet weak var navigationBar: BaseNavigationBar!
    @IBOutlet weak var photoHero: UIImageView!
    @IBOutlet weak var nameHero: UILabel!
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeNavigationBar()
    }
    
    
    // MARK: Private Functions
    // Configuramos la navigation bar
    func customizeNavigationBar() {
        self.navigationBar.viewModel = BaseNavigationBarModel(title: "Hero detail",
                                                              leftButton: .back,
                                                              rightButton: .none,
                                                              showViewBottomLine: false,
                                                              showLogoImage: false)
        
        self.navigationBar.delegate = self
        self.navigationBar.setWhiteStyle()
    }
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension HeroDetailView: BaseViewControllerViewDidLoadProtocol {
    
    func i18N() {
        
    }
    
    func initializeGUI() {

    }
}

extension HeroDetailView: BaseViewControllerViewWillAppearProtocol {
    
    func callWebService() {

    }
    
    func manageGUI() {
        if let photoData = self.presenter?.heroDetailAssemblyDTO?.superHero?.photoData {
            self.photoHero.image = UIImage(data: photoData)
        }
        self.nameHero.text = self.presenter?.heroDetailAssemblyDTO?.superHero?.name
        
        
    }
}

extension HeroDetailView: BaseViewControllerRefresh {
    func refresh() {
        
    }
    
    func backToBackGroundRefresh() {}
}

extension HeroDetailView: BaseNavigationBarDelegate {
    func leftButtonAction() {
        self.presenter?.goToHome()
    }
    
    func rightButtonAction() {
        
    }
    
}
