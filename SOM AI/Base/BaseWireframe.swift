//
//  BaseWireframe.swift
//  SOM AI
//
//  Created by Bagas Ilham on 16/11/2023.
//

import UIKit

class BaseWireframe {
    private unowned var _viewController: UIViewController

    // To retain view controller reference upon first access
    private var _temporaryStoredViewController: UIViewController?

    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
}

// MARK: - Extensions -
extension BaseWireframe: WireframeInterface {
}

extension BaseWireframe {
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

