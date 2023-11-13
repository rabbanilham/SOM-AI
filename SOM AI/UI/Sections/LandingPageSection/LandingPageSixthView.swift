//
//  LandingPageSixthView.swift
//  SOM AI
//
//  Created by Bagas Ilham on 10/11/2023.
//

import UIKit

protocol LandingPageSixthViewDelegate: AnyObject {
    func didTapFooterLink(urlString: String)
}

final class LandingPageSixthView: UIView {
    // MARK: - Private Properties -
    
    private let faqs = FrequentlyAskedQuestion.defaultFaqs()
    
    // MARK: - Public Properties -
    
    weak var delegate: LandingPageSixthViewDelegate?
    
    // MARK: - UI Properties -
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.addSubviews(orangeBlurredCircleView, purpleBlurredCircleView, blurView, headerView, faqTableView)
        orangeBlurredCircleView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.leading)
            make.centerY.equalTo(view.snp.top)
        }
        purpleBlurredCircleView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.trailing)
            make.centerY.equalTo(view.snp.bottom)
        }
        blurView.snp.makeConstraints({ $0.edges.equalToSuperview() })
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide).offset(16)
            make.leading.trailing.equalToSuperview()
        }
        faqTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.effect = UIBlurEffect(style: .light)
        
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
    
    private lazy var headerView = createHeaderView()
    private lazy var footerView: UIView = {
        let view = createFooterView()
        view.alpha = 0
        
        return view
    }()
    
    private lazy var faqTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ShadowTableViewCell.self, forCellReuseIdentifier: "\(ShadowTableViewCell.self)")
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 64, right: 0)
        
        return tableView
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

// MARK: - UITableViewDelegate, UITableViewDataSource -

extension LandingPageSixthView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShadowTableViewCell.self)", for: indexPath) as? ShadowTableViewCell else { return UITableViewCell() }
        let row = indexPath.row
        cell.configureContent(faqs[row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ShadowTableViewCell else { return }
        tableView.beginUpdates()
        cell.toggleExpand()
        UIView.animate(withDuration: 0.5, delay: cell.isExpanded ? 0 : 0.5, options: .curveEaseOut) {
            tableView.endUpdates()
        }
        footerView.fadeOut()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        let isScrolledToBottom = scrollOffset - 64 >= (scrollContentSizeHeight - scrollViewHeight)
        if isScrolledToBottom {
            if footerView.alpha == 0 { footerView.fadeIn() }
        } else {
            if footerView.alpha != 0 { footerView.fadeOut() }
        }
    }
}

// MARK: - Private Extension -

private extension LandingPageSixthView {
    func makeUI() {
        backgroundColor = R.color.backgroundWhite()
        clipsToBounds = true
        
        addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }
    
    func createHeaderView() -> UIView {
        let label = UILabel()
        label.font = R.font.interBlack(size: 32)
        label.numberOfLines = 0
        label.text = "Pertanyaan yang banyak diajukan"
        label.textAlignment = .left
        label.textColor = R.color.contentDark()
        
        let view = UIView()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }
        
        return view
    }
    
    func createFooterView() -> UIView {
        let topLabel = UILabel()
        topLabel.font = R.font.interMedium(size: 14)
        topLabel.text = "Masih punya pertanyaan?"
        topLabel.textAlignment = .center
        topLabel.textColor = R.color.contentDark()
        
        let attributedString = NSAttributedString(
            string: "Hubungi WhatsApp Admin SOM AI",
            attributes: [
                .font: R.font.interBold(size: 14)!,
                .foregroundColor: R.color.contentOrange()!,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        let bottomLabel = UILabel()
        bottomLabel.attributedText = attributedString
        bottomLabel.isUserInteractionEnabled = true
        bottomLabel.textAlignment = .center
        
        
        let view = UIView()
        view.addSubviews(topLabel, bottomLabel)
        topLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.bottom.equalToSuperview().offset(-16)
        }
        
        return view
    }
    
    @objc func didTapFooterLink() {
        delegate?.didTapFooterLink(urlString: "")
    }
}
