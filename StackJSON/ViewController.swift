//
//  ViewController.swift
//  StackJSON
//
//  Created by weaken on 2022/12/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "stack", ofType: "json") else {
            return
        }
        
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: jsonData) as? [AnyHashable: Any], let hstack = json["$App"] as? [AnyHashable: Any] else {
            return
        }
        
        let hStackView = JSONHStack(json: hstack)
        view.addSubview(hStackView)
        hStackView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
    }


}

