//
//  JSONSpacer.swift
//  StackJSON
//
//  Created by weaken on 2022/12/29.
//

import UIKit

class JSONSpacer: UIView {

    init(json: [AnyHashable: Any]) {
        super.init(frame: .zero)
        
        parse(json: json)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func parse(json: [AnyHashable: Any]) {
        guard let style = json["style"] as? [String: Any] else {
            return
        }
        
        for key in style.keys {
            let valye = style[key]!
            switch key {
            case "background":
                self.backgroundColor = .red
            case "size":
                self.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            default: break
            }
        }
    }
}
