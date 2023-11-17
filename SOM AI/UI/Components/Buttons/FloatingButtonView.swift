//
//  FloatingButtonView.swift
//  SOM AI
//
//  Created by Bagas Ilham on 07/11/2023.
//

import UIKit

final class FloatingButtonView: UIView {
    enum FloatingButtonType {
        case primary
        case secondary
    }
    
    // MARK: - Private Properties -
    
    private var buttonType: FloatingButtonType = .primary
    
    // MARK: - UI Properties -
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.backgroundDark()
        view.clipsToBounds = true
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 12
        view.snp.makeConstraints({ $0.height.equalTo(48) })
        
        view.addSubview(mainButton)
        mainButton.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(1.25)
            make.trailing.equalToSuperview().offset(-1.25)
            make.bottom.equalToSuperview().offset(-4.5)
        }
        
        return view
    }()
    
    lazy var mainButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.clipsToBounds = true
        button.layer.borderColor = R.color.backgroundDark()?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 10.75
        switch buttonType {
        case .primary:
            button.tintColor = R.color.contentOrange()
        case .secondary:
            button.tintColor = R.color.backgroundWhite()
        }
        
        
        return button
    }()
    
    // MARK: - Init -
    
    init(buttonType: FloatingButtonType) {
        super.init(frame: .zero)
        self.buttonType = buttonType
        makeUI()
    }
    
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
    func addAction(
        for controlEvents: UIControl.Event = .touchUpInside,
        action: @escaping () -> Void
    ) {
        let _action = UIAction { _ in action() }
        mainButton.addAction(_action, for: controlEvents)
    }
    
    func addTarget(
        _ target: Any?,
        action: Selector,
        for event: UIControl.Event
    ) {
        mainButton.addTarget(target, action: action, for: event)
    }
    
    func setImage(_ image: UIImage?) {
        mainButton.setImage(image, for: .normal)
    }
    
    func setTitle(_ title: String) {
        let titleColor: UIColor = {
            switch buttonType {
            case .primary: return R.color.contentWhite()!
            case .secondary: return R.color.contentDark()!
            }
        }()
        var _title = title
        if mainButton.image(for: .normal) != nil {
            _title = " \(title)"
        }
        mainButton.setAttributedTitle(
            NSAttributedString(
                string: _title,
                attributes: [
                    .font: R.font.interBold(size: 14)!,
                    .foregroundColor: titleColor
                ]),
            for: .normal
        )
    }
}
