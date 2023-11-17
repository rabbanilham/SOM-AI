//
//  ToastManager.swift
//  SOM AI
//
//  Created by Bagas Ilham on 17/11/2023.
//

import SwiftEntryKit
import UIKit

final class ToastManager {
    static let shared = ToastManager()
}

// MARK: - Extensions

private extension ToastManager {
    func createToastAttribute() -> EKAttributes {
        var attribute = EKAttributes.topFloat

        attribute.displayDuration = 2
        attribute.displayMode = .inferred
        attribute.entryBackground = .clear
        attribute.screenBackground = .clear
        attribute.screenInteraction = .forward
        attribute.entryInteraction = .absorbTouches
        attribute.positionConstraints.size = .sizeToWidth
        attribute.positionConstraints.maxSize = .init(width: .offset(value: 16), height: .constant(value: 66))
        attribute.positionConstraints.verticalOffset = UINavigationController().navigationBar.frame.size.height + 10
        attribute.entranceAnimation = .init(
            translate: .init(duration: 0.75, anchorPosition: .automatic, spring: .init(damping: 0.35, initialVelocity: 10))
        )
        attribute.exitAnimation = .init(translate: .none, scale: .none, fade: .init(from: 1, to: 0, duration: 0.3))
        attribute.popBehavior = .animated(animation: .init(translate: .none, scale: .none, fade: .init(from: 1, to: 0, duration: 0.3)))

        return attribute
    }
}

extension ToastManager {
    func showSuccessToast(message: String?, hideDismissButton: Bool = true) {
        let attribute = createToastAttribute()
        let view = DefaultToast()
        view.backgroundColor = R.color.backgroundOrange()
        view.toastMessageLabel.text = message
        view.toastMessageLabel.addLineSpacing(4)
        view.toastMessageLabel.textColor = R.color.contentWhite()
        view.closeButton.isHidden = hideDismissButton
        SwiftEntryKit.display(entry: view, using: attribute)
    }

    func showErrorToast(message: String?) {
        let attribute = createToastAttribute()
        let view = DefaultToast()
        view.backgroundColor = R.color.contentError()
        view.toastMessageLabel.text = message
        view.toastMessageLabel.addLineSpacing(4)
        view.toastMessageLabel.textColor = R.color.contentWhite()
        SwiftEntryKit.display(entry: view, using: attribute)
    }

    func dismiss() {
        SwiftEntryKit.dismiss(.displayed)
    }
}
