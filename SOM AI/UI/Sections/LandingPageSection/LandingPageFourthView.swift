//
//  LandingPageFourthView.swift
//  SOM AI
//
//  Created by Bagas Ilham on 09/11/2023.
//

import UIKit

final class LandingPageFourthView: UIView {
    // MARK: - Private Properties -
    
    private var isExpanded = false
    
    // MARK: - UI Properties -
    
    private lazy var mainContentView: UIView = {
        let view = UIView()
        view.addSubviews(purpleBlurredCircleView, blurView, mainStackView)
        
        purpleBlurredCircleView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.leading)
            make.centerY.equalTo(view.snp.bottom).offset(-32)
        }
        
        blurView.snp.makeConstraints({ $0.edges.equalToSuperview() })
        
        mainStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview().offset(32)
        }
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel, firstDescriptionView, secondDescriptionView, thirdDescriptionView, fourthDescriptionView, subDescriptionLabel, illustrationImageView
        ])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 24
        
        return stackView
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.effect = UIBlurEffect(style: .light)
        
        return view
    }()
    
    private lazy var purpleBlurredCircleView: UIView = {
        let view = UIView()
        view.alpha = 0.25
        view.backgroundColor = R.color.contentPurple()
        view.clipsToBounds = true
        view.layer.cornerRadius = 87.5
        view.snp.makeConstraints({ $0.height.width.equalTo(170) })
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        var attributedString = NSMutableAttributedString(
            string: "SOM AI ",
            attributes: [
                .font: R.font.interBlack(size: 36)!,
                .foregroundColor: R.color.contentOrange()!
            ]
        )
        let additionalString = NSMutableAttributedString(
            string: "pas banget buat bantuin kamu:",
            attributes: [
                .font: R.font.interBlack(size: 36)!,
                .foregroundColor: R.color.contentDark()!
            ]
        )
        attributedString.append(additionalString)
        
        let label = UILabel()
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var firstDescriptionView = createDetailView(
        image: R.image.brainstorm(),
        text: "Brainstorming judul penelitian",
        highlightedText: "Brainstorming",
        tapAction: #selector(self.didTapFirstDescription)
    )
    
    private lazy var secondDescriptionView = createDetailView(
        image: R.image.quote(),
        text: "Parafrase paragraf",
        highlightedText: "Parafrase",
        tapAction: #selector(self.didTapSecondDescription)
    )
    
    private lazy var thirdDescriptionView = createDetailView(
        image: R.image.puzzle(),
        text: "Menyederhanakan penjelasan yang rumit",
        highlightedText: "Menyederhanakan",
        tapAction: #selector(self.didTapThirdDescription)
    )
    
    private lazy var fourthDescriptionView = createDetailView(
        image: R.image.chat(),
        text: "Curhat tentang skripsi",
        highlightedText: "Curhat",
        tapAction: #selector(self.didTapFourthDescription)
    )
    
    private lazy var subDescriptionLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.font = R.font.interMedium(size: 16)
        label.isHidden = true
        label.numberOfLines = 0
        label.textColor = R.color.contentDisabledPrimary()
        label.addLineSpacing(8, alignment: .center)
        
        return label
    }()
    
    private lazy var illustrationImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.searchIllustration()!)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.height.equalTo(190)
            make.width.equalTo(242)
        }
        
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

// MARK: - Private Extension -

private extension LandingPageFourthView {
    func makeUI() {
        backgroundColor = R.color.backgroundWhite()!
        clipsToBounds = true
        addSubview(mainContentView)
        mainContentView.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }
    
    func createDetailView(
        image: UIImage?,
        text: String,
        highlightedText: String,
        tapAction: Selector
    ) -> UIView {
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.font = R.font.interBold(size: 16)
        label.text = text
        label.numberOfLines = 0
        label.textColor = R.color.contentDark()
        label.highlightText(highlightedText, fullText: text, color: R.color.highlightPink()!)
        
        let view = UIView()
        view.addSubviews(imageView, label)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: tapAction))
        view.isUserInteractionEnabled = true
        view.snp.makeConstraints({ $0.height.greaterThanOrEqualTo(36) })
        
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(36)
            make.top.leading.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        return view
    }
    
    func performExpandCollapse(
        for view: UIView,
        text: String
    ) {
        let descriptionViews = [firstDescriptionView, secondDescriptionView, thirdDescriptionView, fourthDescriptionView].filter({ $0 != view })
        if isExpanded {
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn) {
                self.subDescriptionLabel.fadeOutWithScale()
            } completion: { isComplete in
                if isComplete {
                    UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut) {
                        self.backgroundColor = R.color.backgroundWhite()
                        self.subDescriptionLabel.isHidden = true
                        descriptionViews.forEach({ $0.isHidden = false })
                        descriptionViews.forEach({ $0.fadeInWithScale() })
                        self.mainStackView.layoutSubviews()
                    }
                }
            }
        } else {
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn) {
                descriptionViews.forEach({ $0.fadeOutWithScale() })
            } completion: { isComplete in
                if isComplete {
                    UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut) {
                        self.backgroundColor = R.color.backgroundLight()
                        descriptionViews.forEach({ $0.isHidden = true })
                        self.subDescriptionLabel.text = text
                        self.subDescriptionLabel.addLineSpacing(8, alignment: .left)
                        self.subDescriptionLabel.isHidden = false
                        self.subDescriptionLabel.fadeInWithScale()
                        self.mainStackView.layoutSubviews()
                    }
                }
            }
        }
        isExpanded.toggle()
    }
    
    @objc private func didTapFirstDescription() {
        performExpandCollapse(
            for: firstDescriptionView,
            text: "Bikin judul penelitian jadi gampang pake SOM AI. Tinggal tulis aja bidang yang lo kuasai, nanti SOM AI kasih rekomendasi judul penelitian yang pas buat lo."
        )
    }
    
    @objc private func didTapSecondDescription() {
        performExpandCollapse(
            for: secondDescriptionView,
            text: "Jangan sampe tulisan lo ketauan plagiat karena copy-paste dari jurnal. Minta SOM AI aja buat parafrase tulisannya, dijamin ga keliatan plagiat!"
        )
    }
    
    @objc private func didTapThirdDescription() {
        performExpandCollapse(
            for: thirdDescriptionView,
            text: "Gak perlu mumet lagi baca artikel di internet yang bahasanya belibet. Sekarang lo bisa nanya ke SOM AI apa aja yang bikin lo bingung. Jawabannya asik & bikin lo jadi paham."
        )
    }
    
    @objc private func didTapFourthDescription() {
        performExpandCollapse(
            for: fourthDescriptionView,
            text: "Nah ini pas banget buat lo yang butuh support system selama ngerjain skripsi. Gak perlu repot repot cari pacar! Ajak SOM AI ngobrol aja, seru banget kok!"
        )
    }
}
