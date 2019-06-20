//
//  ResizingTokenFieldFlowLayout.swift
//  ResizingTokenField
//
//  Created by Tadej Razborsek on 19/06/2019.
//  Copyright © 2019 Tadej Razborsek. All rights reserved.
//

import UIKit

/// A UICollectionViewFlowLayout subclass, which.
/// - tracks content height changes (onContentHeightChanged)
class ResizingTokenFieldFlowLayout: UICollectionViewFlowLayout {
    
    // Tracking content height changes
    var onContentHeightChanged: ((_ oldHeight: CGFloat, _ newHeight: CGFloat) -> Void)?
    private var oldContentHeight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize {
        let contentSize = super.collectionViewContentSize
        
        let oldHeight = oldContentHeight
        let newHeight = contentSize.height
        oldContentHeight = newHeight
        if oldHeight != newHeight {
            onContentHeightChanged?(oldHeight, newHeight)
        }
        
        return contentSize
    }
    
}
