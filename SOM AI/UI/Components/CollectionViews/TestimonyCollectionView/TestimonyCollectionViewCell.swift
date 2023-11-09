//
//  TestimonyCollectionViewCell.swift
//  SOM AI
//
//  Created by Bagas Ilham on 09/11/2023.
//

import UIKit

final class TestimonyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Properties -
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.addSubview(frameView)
        frameView.snp.makeConstraints({ $0.leading.trailing.centerY.equalToSuperview() })
        
        return view
    }()
    
    lazy var frameView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.borderColor = R.color.backgroundDark()!.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 24
        
        view.addSubviews(testimonyLabel, separatorView, authorView)
        
        testimonyLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(separatorView.snp.top).offset(-16)
        }
        
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(testimonyLabel.snp.bottom).offset(16)
        }
        
        authorView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }
        
        return view
    }()
    
    private lazy var testimonyLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.interMedium(size: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = R.color.contentDark()
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.backgroundDark()
        view.snp.makeConstraints({ $0.height.equalTo(3) })
        
        return view
    }()
    
    private lazy var authorView: UIView = {
        let view = UIView()
        view.addSubviews(authorImageView, authorNameLabel)
        
        authorImageView.snp.makeConstraints({ $0.top.leading.bottom.equalToSuperview() })
        
        authorNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(authorImageView.snp.trailing).offset(16)
            make.centerY.trailing.equalToSuperview()
        }
        
        return view
    }()
    
    private lazy var authorImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.avatar())
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints({ $0.height.width.equalTo(32) })
        
        return imageView
    }()
    
    private lazy var authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.interBold(size: 16)
        label.textColor = R.color.contentDark()!
        
        return label
    }()
    
    // MARK: - Initializer -
    
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

private extension TestimonyCollectionViewCell {
    func makeUI() {
        addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }
}

// MARK: - Public Extensions -

extension TestimonyCollectionViewCell {
    func configureContent(
        testimony: Testimony,
        backgroundColor: UIColor = R.color.backgroundWhite()!
    ) {
        frameView.backgroundColor = backgroundColor
        testimonyLabel.text = testimony.testimonyMessage
        testimonyLabel.addLineSpacing(6)
        authorNameLabel.text = testimony.authorName
        layoutSubviews()
    }
}
