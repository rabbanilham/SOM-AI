//
//  LandingPageFifthView.swift
//  SOM AI
//
//  Created by Bagas Ilham on 09/11/2023.
//

import UIKit

final class LandingPageFifthView: UIView {
    // MARK: - Private Properties -
    
    private let testimonies = [
        Testimony(authorName: "Ghea", testimonyMessage: "“Menggunakan SOM AI sangat membantu mempersingkat waktu penelitian karena tidak perlu terlalu banyak mencari referensi dan mensortirnya seperti menggunakan search engine lain.”"),
        Testimony(authorName: "Andini", testimonyMessage: "“Sangat terbantu, terkadang stuck dengan apa yang hendak ditulis. SOM AI sangat membantu memberikan wawasan dan inspirasi untuk menulis.”"),
        Testimony(authorName: "Anggi", testimonyMessage: "“Dengan SOM AI saya dapat memecahkan beberapa pertanyaan yang membutuhkan jawaban profesional tanpa harus menunggu balasan chat dosen.”"),
        Testimony(authorName: "Tiara", testimonyMessage: "“Beban tugas terasa ringan. Dapat ilmu tambahan walaupun gak bertatap muka langsung. Terima kasih SOM AI”"),
        Testimony(authorName: "Eka", testimonyMessage: "“Jadi dapat semacam “ilham” untuk mencari bagian dalam penelitian yang masih kurang. Jadi lebih ada teman ngobrol soal skripsi. Jadi ada teman yang bisa ditanya dan memastikan sebuah pengetahuan yang saya punya itu benar/tidak.”"),
        Testimony(authorName: "Jheniar", testimonyMessage: "“Mendapatkan gambaran maupun pandangan terkait dengan judul-judul skripsi, sehingga membuat saya mudah dalam memulai membaca dan mencari jurnal-jurnal terkait untuk dipelajari sebelum semester akhir”")
    ]
    
    // MARK: - UI Properties -
    
    private let feedbackGenerator = UINotificationFeedbackGenerator()
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.backgroundWhite()
        
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, testimonySection])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 24
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        testimonySection.snp.makeConstraints { make in
            make.height.equalTo(352)
            make.leading.trailing.equalToSuperview()
        }
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        var attributedString = NSMutableAttributedString(
            string: "Kesan Pesan dari Teman-Teman ",
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
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var testimonySection: TestimonyCollectionView = {
        let layout = ScaledCollectionViewLayout()
        let section = TestimonyCollectionView(frame: .zero, collectionViewLayout: layout)
        section.delegate = self
        section.dataSource = self
        
        return section
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

private extension LandingPageFifthView {
    func makeUI() {
        addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints({ $0.edges.equalToSuperview() })
        feedbackGenerator.prepare()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource -

extension LandingPageFifthView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = indexPath.item
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(TestimonyCollectionViewCell.self)",
            for: indexPath
        ) as? TestimonyCollectionViewCell else { return UICollectionViewCell() }
        cell.configureContent(
            testimony: testimonies[item],
            backgroundColor: item % 2 == 0 ? R.color.backgroundLight()! : R.color.backgroundPink()!
        )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TestimonyCollectionViewCell else { return }
        cell.frameView.bounceEffect()
        feedbackGenerator.notificationOccurred(.error)
    }
}
