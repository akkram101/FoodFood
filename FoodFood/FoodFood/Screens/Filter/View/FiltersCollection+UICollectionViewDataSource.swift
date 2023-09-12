//
//  FiltersCollection+UICollectionViewDataSource.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension FiltersCollection: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionCell.reuseIdentifier, for: indexPath) as? FilterCollectionCell else { return UICollectionViewCell() }
        
        let model = data[indexPath.row]
        
        cell.delegate = self
        cell.model = model
        
        return cell
    }
    
    
}
