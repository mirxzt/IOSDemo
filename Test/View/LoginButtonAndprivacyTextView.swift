//
//  LoginButtonAndprivacyTextView.swift
//  Test
//
//  Created by yupaozcj on 2024/3/13.
//

import Foundation
import UIKit

class LoginButtonAndprivacyTextView: UIView {
    lazy var loginButton: UIButton = {
        let r = UIButton()
        r.setTitle("登录", for: .normal)
        r.setTitleColor(.white, for: .normal)
        r.backgroundColor = .lightGray
        r.layer.cornerRadius = 5
        r.isEnabled = false
        return r
    }()
     
    lazy var quickLoginLabel: UILabel = {
        let r = UILabel()
        r.text = "使用一键快捷登录"
        r.font = .systemFont(ofSize: 16)
        r.textColor = .systemBlue
        return r
    }()
        
    lazy var privacyButton: UIButton = {
        let r = UIButton()
        r.setImage(UIImage(named: "icon_sign_people_noSelect"), for: .normal)
        return r
    }()
    
    lazy var privacyLabel: UILabel = {
        let r = UILabel()
        let attributedString = NSMutableAttributedString("我已阅读并同意《隐私协议》《服务协议》")
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: NSRange(location: 7, length: 12))
        r.attributedText = attributedString
        r.font = .systemFont(ofSize: 14)
        return r
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setupUI()
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
      addSubview(loginButton)
      addSubview(quickLoginLabel)
      addSubview(privacyButton)
      addSubview(privacyLabel)
    }
    
    private func setupLayout() {
        loginButton.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        quickLoginLabel.snp.makeConstraints{ make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        privacyButton.snp.makeConstraints { make in
            make.top.equalTo(quickLoginLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(35)
        }

        
        privacyLabel.snp.makeConstraints{ make in
            make.left.equalTo(privacyButton.snp.right).offset(10)
            make.centerY.equalTo(privacyButton.snp.centerY)
            make.width.equalTo(300)
        }
    }
}
