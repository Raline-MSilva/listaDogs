//
//  SectionHeaderView.swift
//  LearningTask-7.2
//
//  Created by Raline Maria da Silva on 18/10/22.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var titulo: UILabel!
    
    var tituloLabel: String? {
        didSet {
            titulo.text = tituloLabel
        }
    }
}
