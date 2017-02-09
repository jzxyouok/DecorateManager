//
//  NSNotificationName+Extension.swift
//  delegate
//
//  Created by Harry on 2017/2/8.
//  Copyright © 2017年 Harry. All rights reserved.
//

import Foundation

/**
 * 自定义全局静态通知名
 */

extension NSNotification.Name {
    
    public struct HYButtonClick {
        public static let confirm = Notification.Name.init(rawValue: "HYButtonClickConfirmNotification")
        public static let cancel = Notification.Name.init(rawValue: "HYButtonClickCancelNotification")
    }
}

