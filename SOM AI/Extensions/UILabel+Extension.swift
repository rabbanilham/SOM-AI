//
//  UILabel+Extension.swift
//  SOM AI
//
//  Created by Bagas Ilham on 08/11/2023.
//

import UIKit

extension UILabel {
    func addLineSpacing(
        _ spacing: CGFloat,
        alignment: NSTextAlignment = .left
    ) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        paragraphStyle.lineSpacing = spacing

        let spacedText = NSAttributedString(
            string: text ?? "",
            attributes: [
                .paragraphStyle: paragraphStyle,
            ]
        )

        attributedText = spacedText
    }
    
    func highlightText(
        _ text: String,
        fullText: String,
        color: UIColor
    ) {
        let attributedText = NSMutableAttributedString(string: fullText)
        let range = NSString(string: fullText).range(of: text, options: .caseInsensitive)
        attributedText.addAttributes([.backgroundColor: color], range: range)
        self.attributedText = attributedText
    }
}
