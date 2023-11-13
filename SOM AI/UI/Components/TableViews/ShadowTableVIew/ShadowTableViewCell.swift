//
//  ShadowTableViewCell.swift
//  SOM AI
//
//  Created by Bagas Ilham on 10/11/2023.
//

import UIKit

final class ShadowTableViewCell: UITableViewCell {
    // MARK: - Public Properties -
    
    var isExpanded = false
    
    // MARK: - UI Properties
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.addSubview(frameBorderView)
        frameBorderView.snp.makeConstraints({ $0.edges.equalToSuperview() })
        
        return view
    }()
    
    private lazy var frameBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.backgroundDark()
        view.clipsToBounds = true
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 16
        
        view.addSubview(frameView)
        frameView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(1.5)
            make.trailing.equalToSuperview().offset(-1.5)
            make.bottom.equalToSuperview().offset(-4.5)
        }
        
        return view
    }()
    
    private lazy var frameView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.backgroundLight()
        view.clipsToBounds = true
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 14.5
        
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [questionView, answerLabel])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 24
        
        return stackView
    }()
    
    private lazy var questionView: UIView = {
        let view = UIView()
        view.addSubviews(questionLabel, arrowImageView)
        questionLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.trailing.equalTo(arrowImageView.snp.leading).offset(8)
        }
        arrowImageView.snp.makeConstraints({ $0.top.trailing.equalToSuperview() })
        
        return view
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.interBold(size: 16)
        label.numberOfLines = 0
        label.textColor = R.color.contentDark()
        
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.chevronDown())
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints({ $0.height.width.equalTo(24) })
        
        return imageView
    }()
    
    private lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.isHidden = true
        label.font = R.font.interMedium(size: 16)
        label.numberOfLines = 0
        label.textColor = R.color.contentDisabledPrimary()
        
        return label
    }()
    
    // MARK: - Initializer -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeUI()
    }
}

// MARK: - Private Extension -

private extension ShadowTableViewCell {
    func makeUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.trailing.equalTo(contentView.layoutMarginsGuide)
        }
    }
}


// MARK: - Public Extension -

extension ShadowTableViewCell {
    func configureContent(_ faq: FrequentlyAskedQuestion) {
        questionLabel.text = faq.question
        answerLabel.text = faq.answer
        answerLabel.addLineSpacing(4)
    }
    
    func toggleExpand() {
        isExpanded.toggle()
        if isExpanded {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                self.answerLabel.isHidden = false
                self.answerLabel.fadeIn()
                self.arrowImageView.image = R.image.chevronUp()
                self.frameView.backgroundColor = R.color.backgroundWhite()
                self.frameView.snp.updateConstraints({ $0.bottom.equalToSuperview().offset(-1.5) })
            }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                self.answerLabel.fadeOut()
                self.answerLabel.isHidden = true
                self.arrowImageView.image = R.image.chevronDown()
                self.frameView.backgroundColor = R.color.backgroundLight()
                self.frameView.snp.updateConstraints({ $0.bottom.equalToSuperview().offset(-4.5) })
            }
        }
    }
}
