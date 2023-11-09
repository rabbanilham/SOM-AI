//
//  LandingPageThirdView.swift
//  SOM AI
//
//  Created by Bagas Ilham on 09/11/2023.
//

import UIKit

final class LandingPageThirdView: UIView {
    // MARK: - UI Properties -

    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.addSubviews(orangeBlurredCircleView, purpleBlurredCircleView, blurView, actionImageView)
        orangeBlurredCircleView.snp.makeConstraints { make in
            make.height.width.equalTo(170)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(128)
        }
        
        purpleBlurredCircleView.snp.makeConstraints { make in
            make.height.width.equalTo(170)
            make.leading.equalToSuperview()
            make.top.equalTo(view.snp.centerY).offset(128)
        }
        
        blurView.snp.makeConstraints({ $0.edges.equalToSuperview() })
        
        actionImageView.snp.makeConstraints { make in
            make.height.equalTo(538)
            make.width.equalTo(328)
            make.leading.trailing.lessThanOrEqualToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(view.layoutMarginsGuide.snp.top).offset(64)
        }
        
        return view
    }()
    
    private lazy var orangeBlurredCircleView: UIView = {
        let view = UIView()
        view.alpha = 0.25
        view.backgroundColor = R.color.contentOrange()
        view.clipsToBounds = true
        view.layer.cornerRadius = 87.5
        view.snp.makeConstraints({ $0.height.width.equalTo(170) })
        
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
    
    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.effect = UIBlurEffect(style: .light)
        
        return view
    }()
    
    private lazy var actionImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.landingInAction())
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
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

private extension LandingPageThirdView {
    func makeUI() {
        backgroundColor = R.color.backgroundWhite()
        addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }
}
