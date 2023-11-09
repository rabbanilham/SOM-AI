//
//  UIStackView+Extension.swift
//  SOM AI
//
//  Created by Bagas Ilham on 07/11/2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
