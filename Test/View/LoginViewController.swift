//
//  LoginViewController.swift
//  Test
//
//  Created by yupaozcj on 2024/3/9.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(success)
        view.backgroundColor = .white
        success.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    lazy var success: UILabel = {
        let r = UILabel()
        r.text = "登录成功"
        r.font = .systemFont(ofSize: 24)
        r.textColor = .black
        return r
    }()
}
