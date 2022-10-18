//
//  File.swift
//  LearningTask-7.2
//
//  Created by Raline Maria da Silva on 18/10/22.
//

import Foundation

struct Raça {
    let nome: String
    let imagem: String
    
    init(nome: String) {
        self.nome = nome
        self.imagem = nome
    }
}

extension Raça: DogViewCellData {
//    var imagem: String {
//        imagem.description
//    }
}
