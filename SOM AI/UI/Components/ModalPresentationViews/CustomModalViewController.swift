//
//  CustomModalViewController.swift
//  SOM AI
//
//  Created by Bagas Ilham on 16/11/2023.
//

import UIKit

final class CustomModalViewController: UIViewController {
    // MARK: - UI Properties -
    
    private lazy var contentView = UIView()
    
    // MARK: - Init -
    
    init(contentView: UIView) {
        super.init(nibName: nil, bundle: nil)
        self.contentView = contentView
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        view.addSubview(contentView)
        contentView.snp.makeConstraints({ $0.edges.equalToSuperview() })
    }
}

// MARK: - Private Extension -
private extension CustomModalViewController {
    func makeUI() {
        
    }
}
