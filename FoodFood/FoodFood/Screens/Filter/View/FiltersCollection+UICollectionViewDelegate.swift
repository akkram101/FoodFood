//
//  FiltersCollection+UICollectionViewDelegate.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import Foundation
import UIKit

extension FiltersCollection: FilterCollectionCellDelegate {
    
    func filterCell(_ filterCell: FilterCollectionCell, didAddFilter filter: FilterCriterion) {
        self.delegate?.filtersCollection(self, didSelectFilter: filter)
    }
    
    func filterCell(_ filterCell: FilterCollectionCell, didRemoveFilter filter: FilterCriterion) {
        self.delegate?.filtersCollection(self, didUnselectFilter: filter)
    }
    
}

extension FiltersCollection: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model = data[indexPath.row]
        
        let minCellWidth = FilterCollectionCell.minWidth
        let actualCellWidth = FilterCollectionCell.getActualWidth(withText: model.title)
        
        if actualCellWidth > minCellWidth {
            return CGSize(width: adapt(actualCellWidth), height: adapt(50))
        }
        
        return CGSize(width: adapt(minCellWidth), height: adapt(50))
    }
    
}

