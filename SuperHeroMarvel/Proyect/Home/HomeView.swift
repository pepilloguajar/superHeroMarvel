//
//  HomeView.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import Foundation
import UIKit

class HomeView: BaseView<HomePresenterProtocol>, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var navigationBar: BaseNavigationBar!
    @IBOutlet weak var tableViewHero: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeNavigationBar()
        
        self.tableViewHero.delegate = self
        self.tableViewHero.dataSource = self
        self.tableViewHero.register(UINib(nibName: "SuperHeroTableViewCell", bundle: nil), forCellReuseIdentifier: "SuperHeroTableViewCell")
        
        self.searchTextField.delegate = self
    }

    // MARK: Private Functions
    
    // Configuramos la navigation bar
    func customizeNavigationBar() {
        self.navigationBar.viewModel = BaseNavigationBarModel(title:  "super_hero".localized,
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
        return self.presenter?.tableModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableViewHero.dequeueReusableCell(withIdentifier: "SuperHeroTableViewCell", for: indexPath) as? SuperHeroTableViewCell ?? SuperHeroTableViewCell()
        
        guard let modelRow = self.presenter?.tableModel[indexPath.row] else { return cell }
        
        cell.configureCell(superHero: modelRow)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchTextField.resignFirstResponder()

        guard let hero = self.presenter?.tableModel[indexPath.row] else { return }
        self.presenter?.goToDetailHero(hero: hero)
    }
    
    // MARK: TextField delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchTextField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.presenter?.filterModel(text: textField.text ?? "")
    }
    

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension HomeView: BaseViewControllerViewDidLoadProtocol {
    
    func i18N() {
        self.searchTextField.placeholder = "search_placeholder".localized
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
