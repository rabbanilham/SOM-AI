//
//  UIButton+Extension.swift
//  SOM AI
//
//  Created by Bagas Ilham on 16/11/2023.
//

import UIKit

extension UIButton {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, action: @escaping () -> Void) {
        let actionObj = UIAction { _ in action() }
        addAction(actionObj, for: controlEvents)
    }
}
