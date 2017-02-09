//
//  HYGlobalDefine.swift
//  delegate
//
//  Created by Harry on 2017/2/8.
//  Copyright © 2017年 Harry. All rights reserved.
//

import Foundation
import UIKit

func iOS8()->Bool{return((UIDevice.current.systemVersion as NSString).floatValue >= 8.0)}
func iOS10()->Bool{return((UIDevice.current.systemVersion as NSString).floatValue >= 10.0)}
func HYScreenWidth() -> CGFloat{return UIScreen.main.bounds.size.width}
func HYScreenHeight() -> CGFloat{return UIScreen.main.bounds.size.height}
func HY_PI() -> CGFloat {return CGFloat(M_PI)}
func HY_PI_2() -> CGFloat {return CGFloat(M_PI_2)}
func HYWidth(_ width: CGFloat) -> CGFloat {return width * HYScreenWidth() / 320}

func HYLOG<T>(_ log : T?,className: String = #file,methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
        let filePath = className as NSString
        let filePath_copy = filePath.lastPathComponent as NSString
        let fileName = filePath_copy.deletingPathExtension
        NSLog("\n******[第\(lineNumber)行][\(fileName)  \(methodName)] ******\n \(log )")
    #endif
}
