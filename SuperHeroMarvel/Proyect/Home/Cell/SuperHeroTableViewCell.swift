//
//  SuperHeroTableViewCell.swift
//  SuperHeroMarvel
//
//  Created by JJ Montes on 25/03/2019.
//  Copyright © 2019 jjmontes. All rights reserved.
//

import UIKit

class SuperHeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var nameHero: UILabel!
    @IBOutlet weak var realNameHero: UILabel!
    
    var cellModel: SuperHero?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.containerView.layer.cornerRadius = 4
        self.containerView.layer.shadowColor = UIColor.black.cgColor
        self.containerView.layer.shadowOpacity = 0.8
        self.containerView.layer.shadowOffset = CGSize.zero
        self.containerView.layer.shadowRadius = 4
        
    }

    func configureCell(superHero: SuperHero) {
        self.clearCell()
        
        self.cellModel = superHero
        
        self.nameHero.text = cellModel?.name ?? "Anonimus"
        self.realNameHero.text = cellModel?.realName ?? "Anonimus"
        
        if let imageData = cellModel?.photoData {
            self.imageHero.image = UIImage(data: imageData)
        } else {
            self.getNewsImage(urlString: cellModel?.photo)
        }
    }
    
    func clearCell() {
        self.nameHero.text = ""
        self.realNameHero.text = ""
        self.imageHero.image = nil
        
    }
    
    func getNewsImage(urlString: String?) {
        
        guard let urlString = urlString else { return }
        
        let url = URL(string: urlString)!
        
        let session = URLSession(configuration: .default)
        
        let downloadTask = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error downoading image: \(error)")
            } else {
                if let _ = response as? HTTPURLResponse {
                    if let imageData = data {
                        self.cellModel?.photoData = data
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.imageHero.image = image
                        }
                    } else {
                        print("Error, image is nil")
                    }
                } else {
                    print("No resonse")
                }
            }
        }
        
        downloadTask.resume()
        
    }
    
}
