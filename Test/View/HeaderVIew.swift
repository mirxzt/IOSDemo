//
//  HeaderVIew.swift
//  Test
//
//  Created by yupaozcj on 2024/3/13.
//

import Foundation
import UIKit

class HeaderVIew: UIView {
    lazy var xiaopi: UIImageView = {
        let r = UIImageView()
        r.image = UIImage(named: "小P")
        return r
    }()
    
    lazy var loginLabel: UILabel = {
        let r = UILabel()
        r.text = "登录/注册"
        r.font = .systemFont(ofSize: 24)
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
        addSubview(xiaopi)
        addSubview(loginLabel)
    }
    
    private func setupLayout() {
        xiaopi.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(xiaopi.snp.top)
            make.left.equalTo(xiaopi.snp.right).offset(5)
        }
    }
}
