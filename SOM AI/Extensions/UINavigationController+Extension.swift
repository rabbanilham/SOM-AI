//
//  UINavigationController+Extension.swift
//  SOM AI
//
//  Created by Bagas Ilham on 16/11/2023.
//

import UIKit

extension UINavigationController {
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }
}
