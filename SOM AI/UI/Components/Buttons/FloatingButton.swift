//
//  FloatingButton.swift
//  SOM AI
//
//  Created by Bagas Ilham on 07/11/2023.
//

import UIKit

final class FloatingButtonView: UIView {
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.backgroundDark()
        view.clipsToBounds = true
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 12
        
        view.addSubview(mainButton)
        mainButton.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(1.25)
            make.trailing.equalToSuperview().offset(-1.25)
            make.bottom.equalToSuperview().offset(-4.5)
        }
        
        return view
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.clipsToBounds = true
        button.layer.borderColor = R.color.backgroundDark()?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 10.75
        button.tintColor = R.color.contentOrange()
        
        return button
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

// MARK: - Private Extension -

private extension FloatingButtonView {
    func makeUI() {
        addSubview(mainView)
        mainView.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }
}

// MARK: - Public Extension -

extension FloatingButtonView {
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) {
        mainButton.addTarget(target, action: action, for: event)
    }
    
    func setTitle(_ title: String) {
        mainButton.setAttributedTitle(
            NSAttributedString(
                string: title,
                attributes: [.font: R.font.interBold(size: 14)!]),
            for: .normal
        )
    }
}
