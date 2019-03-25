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
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var navigationBar: BaseNavigationBar!
    @IBOutlet weak var photoHero: UIImageView!
    @IBOutlet weak var nameHero: UILabel!
    
    @IBOutlet weak var realNameView: UIView!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var realNameText: UILabel!
    
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightText: UILabel!
    
    @IBOutlet weak var powerView: UIView!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var powerText: UILabel!
    
    @IBOutlet weak var abilitiesView: UIView!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var abilitiesText: UILabel!
    
    @IBOutlet weak var groupsView: UIView!
    @IBOutlet weak var groupsLabel: UILabel!
    @IBOutlet weak var groupsText: UILabel!
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeNavigationBar()
        
    }
    
    // MARK: Private Functions
    // Configuramos la navigation bar
    func customizeNavigationBar() {
        self.navigationBar.viewModel = BaseNavigationBarModel(title: "super_hero_details".localized,
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
        self.realNameLabel.text = "real_name".localized
        self.heightLabel.text = "height".localized
        self.powerLabel.text = "power".localized
        self.abilitiesLabel.text = "abilities".localized
        self.groupsLabel.text = "groups".localized
        
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
        self.realNameText.text = self.presenter?.heroDetailAssemblyDTO?.superHero?.realName
        self.heightText.text = self.presenter?.heroDetailAssemblyDTO?.superHero?.height
        self.powerText.text = self.presenter?.heroDetailAssemblyDTO?.superHero?.power
        self.abilitiesText.text = self.presenter?.heroDetailAssemblyDTO?.superHero?.abilities
        self.groupsText.text = self.presenter?.heroDetailAssemblyDTO?.superHero?.groups?.compactMap{ $0 }.joined(separator: ", ")
        
        // Añadimos corner y sombra a la vista contenedora de los datos
        self.containerView.layer.cornerRadius = 4
        self.containerView.layer.shadowColor = UIColor.black.cgColor
        self.containerView.layer.shadowOpacity = 0.8
        self.containerView.layer.shadowOffset = CGSize.zero
        self.containerView.layer.shadowRadius = 4
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
