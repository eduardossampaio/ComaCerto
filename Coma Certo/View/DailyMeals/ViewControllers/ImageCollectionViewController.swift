//
//  ReactionsCollectionViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class ImageCollectionViewController: UICollectionViewController {
    
    private var lastSelectedCell = 0
    private var firstSelectedWhenCreated = true
    var preselectedItem : Displayable? = nil
    var items = [Displayable]()
    
    typealias OnItemSelected = ((Displayable)->Void)
    var onItemSelected :OnItemSelected?
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emojiCell", for: indexPath) as! ImageCollectionCellView
        let itemToDisplay = items[indexPath.item]
        
        cell.reactionImage.image = itemToDisplay.displayImage()
        cell.reactionName.text = itemToDisplay.displayName()
        if let preselectedItem = self.preselectedItem{
//            if(itemToDisplay == preselectedItem){
//                firstSelectedWhenCreated = false
//                cell.isSelected = true
//                onFeelingSelected?(Feeling.allFeelings[indexPath.item])
//            }
        }
       
//        if (feeling.id == preselectedItem.id && firstSelectedWhenCreated){
//            firstSelectedWhenCreated = false
//            cell.isSelected = true
//            onFeelingSelected?(Feeling.allFeelings[indexPath.item])
//        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousSelectedCell = collectionView.cellForItem(at: IndexPath(item: lastSelectedCell, section: 0)) as! ImageCollectionCellView
        previousSelectedCell.isSelected = false;
        let newSelectedCell = collectionView.cellForItem(at: indexPath)
        newSelectedCell?.isSelected = true
        self.lastSelectedCell = indexPath.item
//        onItemSelected?(Feeling.allFeelings[indexPath.item])
        onItemSelected?(items[indexPath.item])
    }
}