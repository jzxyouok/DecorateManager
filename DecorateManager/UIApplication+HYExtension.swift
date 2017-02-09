//
//  UIApplication+HYExtension.swift
//  delegate
//
//  Created by Harry on 2017/2/8.
//  Copyright © 2017年 Harry. All rights reserved.
//

import UIKit
extension UIApplication {
    
    func open(withUrl url: String, completionHandler completion:@escaping((Bool) -> Void)) -> Void {
        if #available(iOS 10.0, *) {
            self.open(URL.init(string: url)!, options: [:], completionHandler: { (successed) in
                completion(successed)
            })
        } else {
            completion(self.openURL(URL.init(string: url)!))
        }
    }
    
}
