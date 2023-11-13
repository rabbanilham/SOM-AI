//
//  LandingPageSceneViewController.swift
//  SOM AI
//
//  Created by Bagas Ilham on 07/11/2023.
//

import CenteredCollectionView
import UIKit

final class LandingPageSceneViewController: UIViewController {
    
    // MARK: - UI Properties -
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.addSubviews(landingPageSection, pageControl, registerButtonWrapperView, logoImageView)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide.snp.top)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
            make.width.equalTo(95)
        }
        
        landingPageSection.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(registerButtonWrapperView.snp.top)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(registerButtonWrapperView.snp.top).offset(-16)
        }
        
        registerButtonWrapperView.snp.makeConstraints({ $0.leading.trailing.bottom.equalToSuperview() })
        
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.logoWithText())
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var landingPageSection: DefaultCollectionView = {
        let layout = CenteredCollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.layoutMarginsGuide.layoutFrame.height - 104)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = DefaultCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentSize = CGSize(width: self.view.frame.width, height: self.view.layoutMarginsGuide.layoutFrame.height)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "landingPageCell")
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    private lazy var landingViews = [firstView, secondView, thirdView, fourthView, fifthView, sixthView, seventhView]
    private lazy var firstView = LandingPageFirstView()
    private lazy var secondView = LandingPageSecondView()
    private lazy var thirdView = LandingPageThirdView()
    private lazy var fourthView = LandingPageFourthView()
    private lazy var fifthView = LandingPageFifthView()
    private lazy var sixthView: LandingPageSixthView = {
        let view = LandingPageSixthView()
        view.delegate = self
        
        return view
    }()
    private lazy var seventhView = LandingPageSeventhView()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.currentPageIndicatorTintColor = R.color.contentOrange()
        control.isUserInteractionEnabled = false
        control.numberOfPages = 7
        control.tintColor = .clear
        control.pageIndicatorTintColor = R.color.contentOrange()?.withAlphaComponent(0.25)
        
        return control
    }()
    
    private lazy var registerButtonWrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.backgroundWhite()
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.layoutMarginsGuide.snp.bottom)
        }
        
        return view
    }()
    
    private lazy var registerButton: FloatingButtonView = {
        let button = FloatingButtonView()
        button.setTitle("Daftar Sekarang")
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource -

extension LandingPageSceneViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landingViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "landingPageCell", for: indexPath)
        cell.contentView.subviews.forEach({ $0.removeFromSuperview() })
        if cell.contentView.subviews.isEmpty {
            cell.contentView.addSubview(landingViews[row])
            landingViews[row].snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.decelerationRate = .fast
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

// MARK: - LandingPageSixthViewDelegate -

extension LandingPageSceneViewController: LandingPageSixthViewDelegate {
    func didTapFooterLink(urlString: String) {
        //
    }
}

// MARK: - Private Extensions -

private extension LandingPageSceneViewController {
    func makeUI() {
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }
}
