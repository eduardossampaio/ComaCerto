//
//  ReactionCollectionCellView.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit
class ReactionCollectionCellView : UICollectionViewCell{
    
    @IBOutlet weak var reactionImage: UIImageView!
    @IBOutlet weak var reactionName: UILabel!
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                self.contentView.backgroundColor =  UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
            }
            else{
                self.contentView.backgroundColor = UIColor(white: 1, alpha: 0)
            }
        }
    }
}
