//
//  JSONHStack.swift
//  StackJSON
//
//  Created by weaken on 2022/12/29.
//

import UIKit

class JSONHStack: UIView {

    init(json: [AnyHashable: Any]) {
        super.init(frame: .zero)
        
        parse(json: json)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func parse(json: [AnyHashable: Any]) {
        
        guard let content = json["content"] as? [[AnyHashable: Any]] else {
            return
        }
        
        for item in content {
            guard let type = item["type"] as? String else {
                continue
            }
            
            switch type {
            case "Spacer":
                let spacer = JSONSpacer(json: item)
                self.addSubview(spacer)
            case "Text":
                let text = JSONText(json: item)
                self.addSubview(text)
            default: break
            }
        }
        
        let totalW: CGFloat = subviews.reduce(0) { $0 + $1.frame.size.width  }
        let maxH: CGFloat = subviews.max { $0.frame.height > $1.frame.height }?.frame.height ?? 0
        
        var x: CGFloat = 0
        for subview in subviews {
            subview.frame = CGRect(x: x, y: (maxH - subview.frame.height) / 2, width: subview.frame.width, height: subview.frame.height)
            x += subview.frame.width
        }
        
        self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: totalW, height: maxH))
    }
}
