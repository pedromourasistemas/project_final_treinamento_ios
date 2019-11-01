//
//  CollectionViewCell.swift
//  ProjectFinal-TreinamentoIOS
//
//  Created by Pedro Henrique de Moura on 28/10/19.
//  Copyright © 2019 Pedro Moura. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var languageImage: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    
    func displayContent(image: UIImage, title: String)
    {
        languageImage.image = image
        languageLabel.text  = title
    }
    
}
