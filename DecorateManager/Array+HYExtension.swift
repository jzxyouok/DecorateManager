//
//  Array+HYExtension.swift
//  delegate
//
//  Created by Harry on 2017/2/8.
//  Copyright © 2017年 Harry. All rights reserved.
//

import Foundation
extension Array {
    
    mutating func addObject(fromArray array:[Element]?) -> Void {
        if array != nil {
            for item in array! {
                self.append(item)
            }
        }
    }
}
