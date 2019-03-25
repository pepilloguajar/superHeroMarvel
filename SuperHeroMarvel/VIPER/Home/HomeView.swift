//
//  HomeView.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

class HomeView: BaseView<HomePresenterProtocol>, UITableViewDelegate, UITableViewDataSource {
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var navigationBar: BaseNavigationBar!
    @IBOutlet weak var tableViewHero: UITableView!
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeNavigationBar()
        
        self.tableViewHero.delegate = self
        self.tableViewHero.dataSource = self
        self.tableViewHero.register(UINib(nibName: "SuperHeroTableViewCell", bundle: nil), forCellReuseIdentifier: "SuperHeroTableViewCell")
    }

    // MARK: Private Functions
    
    // Configuramos la navigation bar
    func customizeNavigationBar() {
        self.navigationBar.viewModel = BaseNavigationBarModel(title: "Super Hero Marvel",
                                                              leftButton: .none,
                                                              rightButton: .none,
                                                              showViewBottomLine: true,
                                                              showLogoImage: false)
        
        self.navigationBar.delegate = self
        self.navigationBar.setWhiteStyle()
    }
    
    func reloadView() {
        self.tableViewHero.reloadData()
    }
    
    // MARK: TableView config
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.modelHeroes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableViewHero.dequeueReusableCell(withIdentifier: "SuperHeroTableViewCell", for: indexPath) as? SuperHeroTableViewCell ?? SuperHeroTableViewCell()
        
        guard let modelRow = self.presenter?.modelHeroes[indexPath.row] else { return cell }
        
        cell.configureCell(superHero: modelRow)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.goToDetailHero(index: indexPath.row)
    }
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension HomeView: BaseViewControllerViewDidLoadProtocol {
    
    func i18N() {
        
    }
    
    func initializeGUI() {

    }
}

extension HomeView: BaseViewControllerViewWillAppearProtocol {
    
    func callWebService() {
        
        self.presenter?.getHomeData()
    }
    
    func manageGUI() {
        
    }
}

extension HomeView: BaseViewControllerRefresh {
    func refresh() {
        
    }
    
    func backToBackGroundRefresh() {}
}

extension HomeView: BaseNavigationBarDelegate {
    func leftButtonAction() {
        
    }
    
    func rightButtonAction() {

    }
    
}
