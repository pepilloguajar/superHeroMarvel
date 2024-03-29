//
//  BaseNavigationBar.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.

import UIKit

enum LeftButtonType {
    case back
    case none
}

enum RightButtonType {
    case none
}

enum BaseColorLineSeparator {

    case red
    case black

}

protocol BaseNavigationBarDelegate: class {
    func leftButtonAction()
    func rightButtonAction()
}

class BaseNavigationBar: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewBackgroundEnvironement: UIView!
    @IBOutlet weak var viewLineSeparator: UIView!
    @IBOutlet var viewContentLabelTitle: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    
    fileprivate var generalView: UIView!
    
    fileprivate var _viewModel: BaseNavigationBarModel!
    
    weak var delegate: BaseNavigationBarDelegate?
    
    var viewModel: BaseNavigationBarModel! {
        get {
            return _viewModel
        }
        set {
            _viewModel = newValue
            configure()
        }
    }
    
    // MARK: LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    // MARK: PRIVATE
    internal func setup() {
        guard let view = Bundle.main.loadNibNamed("BaseNavigationBar", owner: self, options: nil)?.first as? UIView else { return }
        self.generalView = view
        self.generalView.frame = bounds
        self.addSubview(generalView)
    }
    
    internal func configure() {
        
        self.leftButton.imageView?.contentMode = .scaleAspectFit
        self.rightButton.imageView?.contentMode = .scaleAspectFit
        
        if !self.viewModel.showLogoImage {
            self.logoImage.isHidden = true
            self.titleLabel.isHidden = false
            titleLabel.text = viewModel.title
        } else {
            self.logoImage.isHidden = false
            self.titleLabel.isHidden = true
            self.logoImage.image = nil
        }
    
        switch viewModel.leftButton {

        case .back:
            
            leftButton.isHidden = false
            leftButton.setImage(UIImage(named: "ico_arrow_back"), for: .normal)
            
        default:
            
            leftButton.isHidden = true
        }
        
        self.configureRightButton()
        
        self.viewLineSeparator.isHidden = !self.viewModel.showViewBottomLine
        
    }
    
    @IBAction func leftButtonAction(_ sender: Any) {
        
        self.delegate?.leftButtonAction()
    }
    
    @IBAction func rightButtonAction(_ sender: Any) {
        
        self.delegate?.rightButtonAction()
    }
    
    public func changeTitle(text: String) {

    }
    
    /**
     * Configura el botón derecho de la barra de navegación, según el modelo.
     */
    public func configureRightButton() {
        
        switch viewModel.rightButton {
            
        default:
            
            rightButton.isHidden = true
        }
    }
    
    /**
     * Actualiza el model relacionado al botón derecho, y aplica el cambio de diseño.
     */
    public func changeRightButton(rigthButton: RightButtonType) {
        
        self.viewModel.rightButton = rigthButton
        self.configureRightButton()
    }
    
    public func changeColorSeparatorLine(color: BaseColorLineSeparator) {
    
        switch color {
        case .red:
        
            self.viewLineSeparator.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            
        case .black:
            
            self.viewLineSeparator.backgroundColor = UIColor.black
        
        }
    }
    
    public func setWhiteStyle() {
        self.view.backgroundColor = UIColor.clear
        self.viewBackgroundEnvironement.backgroundColor = UIColor.clear
        self.viewContentLabelTitle.backgroundColor = UIColor.clear
        self.titleLabel.textColor = UIColor.black
    }
    
}

struct BaseNavigationBarModel {
    var title: String
    var leftButton: LeftButtonType
    var rightButton: RightButtonType
    var showViewBottomLine: Bool
    var showLogoImage: Bool
    
    init(title: String,
         leftButton: LeftButtonType,
         rightButton: RightButtonType,
         showViewBottomLine: Bool = true,
         showLogoImage: Bool = false) {
        
        self.title = title
        self.leftButton = leftButton
        self.rightButton = rightButton
        self.showViewBottomLine = showViewBottomLine
        self.showLogoImage = showLogoImage
    }
}
