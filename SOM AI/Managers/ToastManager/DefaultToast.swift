//
//  DefaultToast.swift
//  SOM AI
//
//  Created by Bagas Ilham on 17/11/2023.
//

import SwiftEntryKit
import UIKit

class DefaultToast: UIView {
    // MARK: - Private Properties -

    private lazy var toastContent: UIView = {
        let view = UIView()
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 12
        
        view.addSubviews(toastMessageLabel, closeButton)
        closeButton.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
        toastMessageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(closeButton.snp.leading).offset(-16)
        }
        
        return view
    }()

    lazy var toastMessageLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.interMedium(size: 14)
        label.numberOfLines = 2
        label.textAlignment = .left
        
        return label
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = R.color.contentWhite()
        
        button.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        
        return button
    }()

    // MARK: - Lifecycle -

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

private extension DefaultToast {
    func makeUI() {
        insetsLayoutMarginsFromSafeArea = true
        clipsToBounds = true
        contentMode = .scaleToFill
        autoresizesSubviews = true

        layer.cornerCurve = .continuous
        layer.cornerRadius = 12
        layer.shadowColor = R.color.contentDark()!.cgColor
        layer.masksToBounds = false
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath

        addSubview(toastContent)
        toastContent.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }

    @objc
    func closeButtonAction() {
        ToastManager.shared.dismiss()
    }
}

