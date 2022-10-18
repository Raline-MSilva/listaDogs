//
//  DogViewCell.swift
//  LearningTask-7.2
//
//  Created by Raline Maria da Silva on 18/10/22.
//

import UIKit

protocol DogViewCellData {
    var nome: String { get }
    var imagem: String { get }
}
class DogViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nome: UILabel!
    
    var data: DogViewCellData? {
        didSet {
            guard let data = data else { return }
            
            imageView.image = .init(named: data.imagem)
            nome.text = data.nome
        }
    }
    
    override func layoutSubviews() {
          super.layoutSubviews()
          
          imageView.layer.masksToBounds = true
          imageView.layer.cornerRadius = contentView.bounds.width / 2
      }
}
