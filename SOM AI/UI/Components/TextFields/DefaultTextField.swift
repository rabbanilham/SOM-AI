//
//  DefaultTextField.swift
//  SOM AI
//
//  Created by Bagas Ilham on 16/11/2023.
//

import UIKit

class DefaultTextField: UITextField {
    // MARK: - Public Properties -
    var padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16) {
        didSet {
            makeUI()
        }
    }

    public var maxCharacterLength = 30 {
        didSet {}
    }

    var hasError: Bool = false {
        didSet {
            layer.borderColor = self.hasError ? R.color.contentError()!.cgColor : R.color.contentDark()!.cgColor
        }
    }
    
    // MARK: - Override -

    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = R.color.backgroundWhite()
            } else {
                backgroundColor = R.color.backgroundDisabled()
            }
        }
    }
    
    override var placeholder: String? {
        didSet {
            self.attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [.foregroundColor: R.color.contentDisabledSecondary()!]
            )
        }
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            textField.layer.borderColor = R.color.contentOrange()!.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            textField.layer.borderColor = R.color.contentDark()!.cgColor
        }
    }
    
    // MARK: - Init -

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeUI()
    }
}

// MARK: - Extensions

extension DefaultTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return range.location < maxCharacterLength
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}

private extension DefaultTextField {
    func makeUI() {
        layer.borderColor = R.color.contentDark()!.cgColor
        layer.borderWidth = 2.0
        layer.cornerCurve = .continuous
        layer.cornerRadius = 12

        clipsToBounds = true
        clearButtonMode = .whileEditing
        delegate = self
        font = R.font.interMedium(size: 14)
        textColor = R.color.contentDark()
        tintColor = R.color.contentOrange()

        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }
}

