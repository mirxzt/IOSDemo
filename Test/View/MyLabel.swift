//
//  MyLabel.swift
//  Test
//
//  Created by yupaozcj on 2024/3/9.
//

import UIKit

class MyLabel: UILabel {
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    init(text: String, font:CGFloat) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.font = .systemFont(ofSize: font)
    }    
        
    init(text: String, font:CGFloat, color: UIColor) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.font = .systemFont(ofSize: font)
        self.textColor = color
    }
    
    init(text: String, font:CGFloat, attributedText: NSAttributedString) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.font = .systemFont(ofSize: font)
        self.attributedText = attributedText
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
