//
//  LandingPageFirstView.swift
//  SOM AI
//
//  Created by Bagas Ilham on 07/11/2023.
//

import SnapKit
import UIKit

final class LandingPageFirstView: UIView {
    
    // MARK: - UI Properties -
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.backgroundWhite()
        
        view.addSubviews(blurredCircleView, blurView, mainStackView)
        
        blurredCircleView.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.top).offset(-16)
            make.trailing.equalToSuperview()
        }
        
        blurView.snp.makeConstraints({ $0.edges.equalToSuperview() })
        
        mainStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        return view
    }()
    
    private lazy var blurredCircleView: UIView = {
        let view = UIView()
        view.alpha = 0.25
        view.backgroundColor = R.color.contentOrange()
        view.clipsToBounds = true
        view.layer.cornerRadius = 87.5
        view.snp.makeConstraints({ $0.height.width.equalTo(170) })
        
        return view
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.effect = UIBlurEffect(style: .light)
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        
        stackView.addArrangedSubviews(illustrationImageView, titleLabel, descriptionLabel)
        
        return stackView
    }()
    
    private lazy var illustrationImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.landingIllustration())
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        var attributedString = NSMutableAttributedString(
            string: "Teman penelitian yang ",
            attributes: [
                .font: R.font.interBlack(size: 36)!,
                .foregroundColor: R.color.contentDark()!
            ]
        )
        let additionalString = NSMutableAttributedString(
            string: "pintar & seru",
            attributes: [
                .font: R.font.interBlack(size: 36)!,
                .foregroundColor: R.color.contentOrange()!
            ]
        )
        attributedString.append(additionalString)
        
        let label = UILabel()
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.interMedium(size: 16)
        label.numberOfLines = 0
        label.text = "Yuk ngobrol bareng chatbot gaul yang didukung AI buat bantuin kamu ngerjain skripsi atau tugas kuliah."
        label.textColor = R.color.contentDisabledPrimary()
        label.addLineSpacing(8, alignment: .center)
        
        return label
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

private extension LandingPageFirstView {
    func makeUI() {
        backgroundColor = R.color.backgroundWhite()
        addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.bottom.trailing.equalToSuperview()
        }
    }
}
