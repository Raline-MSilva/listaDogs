//
//  ViewController.swift
//  LearningTask-7.2
//
//  Created by rafael.rollo on 13/05/2022.
//

import UIKit

class ListaViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dogsAPI: DogsAPI?
    
    var racas: [Raça] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        carregaRacas()
    }
    
    func carregaRacas() {
        guard let dogsAPI = dogsAPI else { return }
        racas = dogsAPI.listaRaças()
    }

}

// MARK: DataSource
extension ListaViewController: UICollectionViewDataSource {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return racas.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogViewCell", for: indexPath) as? DogViewCell else {
             fatalError("erro ao carregar a celula")
        }
        cell.data = racas[indexPath.row]
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                return configureReusableHeaderView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        
            default:
                fatalError("Erro ao carregar a view")
            }
        }
        
        private func configureReusableHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as? SectionHeaderView else {
                fatalError("Não foi possível carregar a view para seção")
            }
            
            header.tituloLabel = "Raças"
            return header
        }
}
