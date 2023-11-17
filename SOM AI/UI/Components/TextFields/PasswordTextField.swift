//
//  PasswordTextField.swift
//  SOM AI
//
//  Created by Bagas Ilham on 16/11/2023.
//

import UIKit

final class PasswordTextField: DefaultTextField {
    private lazy var coverToggleImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.eyeOff())
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapCoverToggle)))
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeUI()
    }
}

private extension PasswordTextField {
    func makeUI() {
        isSecureTextEntry = true
        rightView = coverToggleImageView
    }
    
    @objc
    func didTapCoverToggle() {
        isSecureTextEntry.toggle()
        coverToggleImageView.image = isSecureTextEntry ? R.image.eyeOff() : UIImage(systemName: "eye")
    }
}
