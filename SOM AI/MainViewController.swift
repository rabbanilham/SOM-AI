//
//  ViewController.swift
//  SOM AI
//
//  Created by Bagas Ilham on 06/11/2023.
//

import SnapKit
import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.backgroundLight()
        let label = UILabel()
        label.text = "Hello"
        label.font = R.font.interBold(size: 28)
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.trailing.centerY.equalToSuperview()
        }
        // Do any additional setup after loading the view.
    }


}

