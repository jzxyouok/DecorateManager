//
//  UITableView+HYExtension.swift
//  delegate
//
//  Created by Harry on 2017/2/8.
//  Copyright © 2017年 Harry. All rights reserved.
//

import UIKit

extension UITableView {
    struct RuntimeKey {
        static let HYKey = UnsafeRawPointer.init(bitPattern: "HYUITableViewRuntimeKey".hashValue)
    }
    
    var isTheSecondTimeLoadData: Bool {
        set {
            let value = NSNumber.init(value: newValue)
            objc_setAssociatedObject(self, UITableView.RuntimeKey.HYKey, value, .OBJC_ASSOCIATION_RETAIN)
        }
        
        get {
            let value = objc_getAssociatedObject(self, UITableView.RuntimeKey.HYKey) as? NSNumber
            if (value != nil){
                return Bool.init(value!)
            }
            return false
        }
    }
    
    
    class func tableView(withStyle style: UITableViewStyle, frame: CGRect) -> UITableView {
        let tableView = UITableView.init(frame: frame, style: style)
        tableView.backgroundColor = UIColor.white
        tableView.tableFooterView = UITableViewHeaderFooterView.init()
        return tableView
    }
    
    func set(delegate: UITableViewDelegate?, dataSource: UITableViewDataSource?) ->() {
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    
    func showNoticeIfNecessary(withDataSourceCount count: Int, image: UIImage?, imageMinY: CGFloat, message: String?, subMessage: String?, buttonTitle: String?, target: Any?, action: Selector?) -> Void {
        if !(self.isTheSecondTimeLoadData) {
            return
        }
        
        if (count > 0) {
            self.backgroundView = nil
            self.separatorStyle = .singleLine
        }else {
            self.separatorStyle = .none
            let contentView = UIView.view(withFrame: CGRect.zero, backgroundColor: UIColor.white)
            
            var imageWidth = min(HYWidth(125), 250)
            if (480 >= HYScreenHeight()) {
                imageWidth = 90
            }
            let frame = CGRect.init(x: self.midX - imageWidth / 2.0, y: imageMinY, width: imageWidth, height: imageWidth * 2.0)
            
            let imageView = UIImageView.imageView(withFrame: frame, image: image)
            contentView.addSubview(imageView)
            
            var font = UIFont.systemFont(ofSize: 20)
            if (480 >= HYScreenHeight()){
                font = UIFont.systemFont(ofSize: 18)
            }
            
            let size = message?.size(withFont: font, maxWidth: HYScreenWidth() - 60)
            
            let messageLabel = UILabel.label_WordWrap(withFrame: CGRect.zero, text: message, font: font)
            messageLabel.textColor = UIColor.lightGray
            messageLabel.sizeToFit()
            messageLabel.x = self.midX - (size?.width)! / 2.0
            messageLabel.y = imageView.maxY
            messageLabel.size = size!
            contentView.addSubview(messageLabel)
            
            if (buttonTitle != nil) {
                let rect = CGRect.init(x: messageLabel.midX - HYWidth(250) / 2.0,
                                       y: messageLabel.maxY + 3,
                                       width: HYWidth(250),
                                       height: 48)
                let button = UIButton.roundedButton(withFrame: rect,
                                                    title: buttonTitle,
                                                    color: UIColor.green,
                                                    highlightColor: UIColor.lightGray,
                                                    radius: 24,
                                                    target: target,
                                                    action: action)
                contentView.addSubview(button)
            } else if (subMessage != nil){
                let subSize = subMessage?.size(withFont: font, maxWidth: HYScreenWidth() - 60)
                let label = UILabel.label_WordWrap(withFrame: CGRect.zero,
                                                   text: subMessage,
                                                   font: font)
                label.textColor = UIColor.lightGray
                label.textAlignment = .center
                label.x = self.midX - (subSize?.width)! / 2.0
                label.y = HYScreenHeight() - (size?.height)! - HYWidth(15)
                label.size = subSize!
                contentView.addSubview(label)
            }
            self.backgroundView = contentView
        }
    }
    
}
