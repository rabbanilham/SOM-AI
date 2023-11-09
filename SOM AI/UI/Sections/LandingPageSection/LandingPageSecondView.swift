//
//  LandingPageSecondView.swift
//  SOM AI
//
//  Created by Bagas Ilham on 08/11/2023.
//

import SnapKit
import UIKit

final class LandingPageSecondView: UIView {
    
    // MARK: - UI Properties -
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 24
        
        stackView.addArrangedSubviews(logoImageView, titleLabel, descriptionLabel)
        
        return stackView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.logoIcon())
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(64)
        }
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        var attributedString = NSMutableAttributedString(
            string: "Dosen kamu slow response? Tenang, ada ",
            attributes: [
                .font: R.font.interBlack(size: 36)!,
                .foregroundColor: R.color.contentDark()!
            ]
        )
        let additionalString = NSMutableAttributedString(
            string: "SOM AI",
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
        label.text = "SOM AI selalu ada kapanpun dan dimanapun kalau kamu butuh bantuan ketika ngerjain skripsi. Bukan hanya tentang skripsimu aja, kamu juga bisa melampiaskan emosimu dengan bercerita sepuasnya ke SOM AI lho!"
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

private extension LandingPageSecondView {
    func makeUI() {
        backgroundColor = R.color.backgroundLight()
        addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }
}
