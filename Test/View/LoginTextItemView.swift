//
//  LoginTextItemView.swift
//  Test
//
//  Created by yupaozcj on 2024/3/13.
//

import Foundation
import UIKit

class LoginTextItemView: UIView {
    
    var textparams: Textparams
    var isLogin: Bool = false
    
    lazy var accImage: UIImageView = {
        let r = UIImageView()
        r.image = textparams.unlockImage
        return r
    }()
    
    lazy var accountTextField: UITextField = {
        let r = UITextField()
        r.placeholder = textparams.placehoder
        r.borderStyle = .none
        r.keyboardType = .decimalPad
        r.clearButtonMode = UITextField.ViewMode.never
        return r
    }()
    
    lazy var accountUnderline: UIView = {
        let r = UIView()
        r.backgroundColor = .lightGray
        return r
    }()
    
    init(textparams: Textparams) {
        self.textparams = textparams
        super.init(frame: CGRect.zero)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(accImage)
        addSubview(accountTextField)
        addSubview(accountUnderline)
    }
    
    func setupLayout() {
        accImage.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(15)
            make.left.equalTo(10)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        accountTextField.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.equalTo(accImage.snp.right).offset(10)
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }
        accountTextField.delegate = self
        
        accountUnderline.snp.makeConstraints{ make in
            make.bottom.equalTo(accountTextField.snp.bottom)
            make.left.equalTo(accImage.snp.left)
            make.width.equalToSuperview().inset(10)
            make.height.equalTo(0.5)
        }
    }
}
