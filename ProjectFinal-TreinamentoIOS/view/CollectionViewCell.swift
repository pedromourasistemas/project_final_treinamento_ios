//
//  CollectionViewCell.swift
//  ProjectFinal-TreinamentoIOS
//
//  Created by Pedro Henrique de Moura on 28/10/19.
//  Copyright © 2019 Pedro Moura. All rights reserved.
//

import UIKit
import Nuke

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var languageImage: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    
    //var imageURL: String?
    
    func displayContent(imageURLParam: String?, title: String)
    {
        Nuke.loadImage(with: URL(string: imageURLParam!)!, into: languageImage)
        languageLabel.text  = title
    }
}
