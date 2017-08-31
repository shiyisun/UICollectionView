
//
//  JSCollectionViewFlowLayout.swift
//  信用能源
//
//  Created by Jusive on 2017/8/10.
//  Copyright © 2017年 Jusive. All rights reserved.
//

import UIKit
import Foundation
class JSCollectionViewFlowLayout: UICollectionViewFlowLayout {
     var _attributeArray:Array<Any>?
    var _itemCount:NSInteger?
    var itemCount:NSInteger?{
            set{
                     _itemCount = newValue
             }
            get{
                return _itemCount
            }
    }
    override func prepare() {
       super.prepare()
         _attributeArray = (NSMutableArray() as! Array<Any>)
        self.itemSize = CGSize(width:100,height:100)
        self.scrollDirection = .vertical
        let WIDTH = (JSCREENW - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing)/2
        var colHight:Array<CGFloat> = [self.sectionInset.top,self.sectionInset.bottom]
        for i in 0..._itemCount!.hashValue {
            let index = NSIndexPath.init(item: i, section: 0)
            let attribute = UICollectionViewLayoutAttributes.init(forCellWith: index as IndexPath)
            let height = arc4random()%150+40
            var width = 0
            if colHight[0] < colHight[1]{
                colHight[0] = colHight[0]+CGFloat(Float(height)) + self.minimumLineSpacing
                width = 0
            }else{
                colHight[1] = colHight[1]+CGFloat(Float(height))+self.minimumLineSpacing
                width = 1
            }
            attribute.frame = CGRect(x:self.sectionInset.left+(self.minimumInteritemSpacing+WIDTH)*CGFloat(Float(width)), y:colHight[width]-CGFloat(Float(height))-self.minimumLineSpacing, width:WIDTH, height:CGFloat(Float(height)))
            _attributeArray?.append(attribute)
        }
        if (colHight[0]>colHight[1]) {
            self.itemSize = CGSize(width:WIDTH, height:(colHight[0]-self.sectionInset.top)*2/CGFloat(Float(_itemCount!))-self.minimumLineSpacing);
        }else{
            self.itemSize = CGSize(width:WIDTH,height:(colHight[1]-self.sectionInset.top)*2/CGFloat(Float(_itemCount!))-self.minimumLineSpacing)
        }
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return _attributeArray as? [UICollectionViewLayoutAttributes]
    }
}

