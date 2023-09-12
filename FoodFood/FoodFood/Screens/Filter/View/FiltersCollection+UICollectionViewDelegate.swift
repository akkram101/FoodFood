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

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            
            layoutAttribute.frame.origin.x = leftMargin
            
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }
        
        return attributes
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

