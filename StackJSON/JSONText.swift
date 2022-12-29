//
//  JSONText.swift
//  StackJSON
//
//  Created by weaken on 2022/12/29.
//

import UIKit

class JSONText: UILabel {

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
            case "size":
                self.font = UIFont.systemFont(ofSize: 16)
            case "foregroundColor":
                self.textColor = .black
            default: break
            }
        }
        
        if let value = json["value"] as? String {
            self.text = value
        }
        self.sizeToFit()
    }
}
