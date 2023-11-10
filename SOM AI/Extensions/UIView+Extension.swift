//
//  UIView+Extension.swift
//  SOM AI
//
//  Created by Bagas Ilham on 08/11/2023.
//

import UIKit

extension UIView {
    enum ViewSide {
        case left, right, top, bottom
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func fadeIn(
        _ duration: TimeInterval = 0.15,
        delay: TimeInterval = 0.0,
        completion: @escaping ((Bool) -> Void) = { (finished: Bool) -> Void in }
    ) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: UIView.AnimationOptions.curveEaseIn,
            animations: { self.alpha = 1.0 },
            completion: completion
        )
    }
    
    func fadeInWithScale(
        _ duration: TimeInterval = 0.5,
        delay: TimeInterval = 0.0,
        completion: @escaping ((Bool) -> Void) = { (finished: Bool) -> Void in }
    ) {
        self.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: .transitionCurlUp,
            animations: {
                self.alpha = 1.0
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            },
            completion: completion
        )
    }
    
    func fadeOut(
        _ duration: TimeInterval = 0.15,
        delay: TimeInterval = 0.0,
        completion: @escaping (Bool) -> Void = { (finished: Bool) -> Void in }
    ) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: UIView.AnimationOptions.curveEaseIn,
            animations: { 
                self.alpha = 0.0
            },
            completion: completion
        )
    }
    
    func fadeOutWithScale(
        _ duration: TimeInterval = 0.5,
        delay: TimeInterval = 0.0,
        completion: @escaping (Bool) -> Void = { (finished: Bool) -> Void in }
    ) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: .transitionCurlUp,
            animations: {
                self.alpha = 0.0
                self.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            },
            completion: completion
        )
    }
    
    func bounceEffect() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { isComplete in
            if isComplete {
                UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            }
        })
    }
}
