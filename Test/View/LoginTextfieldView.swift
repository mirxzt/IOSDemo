//
//  loginTextfieldView.swift
//  Test
//
//  Created by yupaozcj on 2024/3/8.
//

import UIKit
import SnapKit
import RxSwift


class LoginTextfieldView: UIView {
    
    lazy var accountInput: LoginTextItemView = {
        let r = LoginTextItemView(textparams: .init(placehoder: "请输入手机号码",unlockImage: UIImage(named: "phone"), onfocusImage: .init(named: "icon_phone1"),maxLength: 11))
        return r
    }()
    
    lazy var captchaInput: LoginTextItemView = {
        let r = LoginTextItemView(textparams: .init(placehoder: "请输入验证码",unlockImage: UIImage(named: "phone"), onfocusImage: .init(named: "icon_phone1"),maxLength: 4))
        return r
    }()
    
    lazy var captchaButton: UIButton = {
        let r = UIButton()
        r.setTitle("获取验证码", for: .normal)
        r.setTitleColor(.systemBlue, for: .normal)
        return r
    }()

        
    init() {
        super.init(frame: CGRect.zero)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(accountInput)
        addSubview(captchaInput)
        addSubview(captchaButton)
    }
    
    func setupLayout() {
        accountInput.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        captchaInput.snp.makeConstraints { make in
            make.top.equalTo(accountInput.snp.bottom).offset(30)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        captchaButton.snp.makeConstraints { make in
            make.centerY.equalTo(captchaInput.snp.centerY)
            make.right.equalToSuperview().offset(-30)
        }
    }
}

