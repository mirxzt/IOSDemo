//
//  maskView.swift
//  Test
//
//  Created by yupaozcj on 2024/3/11.
//

import UIKit
import SnapKit

class maskView: UIView {
    
    var block: ((Bool) -> Void)?
    
    lazy var bgMask: UIView = {
        let r = UIView()
        r.backgroundColor = UIColor.init(white: 0.3, alpha: 0.3)
        return r
    }()
    
    lazy var container: UIView = {
        let r = UIView()
        r.layer.cornerRadius = 5
        r.backgroundColor = .white
        return r
    }()
    
    lazy var info: UILabel = {
        let r = UILabel()
        r.text = "温馨提示"
        r.font = .systemFont(ofSize: 24)
        return r
    }()
    
    lazy var quitLogo: UIButton = {
        let r = UIButton()
        r.setImage(UIImage(named: "close"), for: .normal)
        r.addTarget(self, action: #selector(closeMask(sender:)), for: .touchUpInside)
        return r
    }()
    
    lazy var agreeText: UITextView = {
        let r = UITextView()
        r.text = "为了更好保障你的合法权益，请你阅读并同意《隐私协议》《服务协议》内容。"
        r.font = .systemFont(ofSize: 16)
        return r
    }()
    
    lazy var agreeButton: UIButton = {
        let r = UIButton()
        r.setTitle("同意并登录", for: .normal)
        r.backgroundColor = .systemBlue
        r.layer.cornerRadius = 5
        r.addTarget(self, action: #selector(closeMask(sender: )), for: .touchUpInside)
        return r
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        innerInit()
        innerLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func innerInit() {
        self.addSubview(bgMask)
        self.addSubview(container)
        container.addSubview(info)
        container.addSubview(quitLogo)
        container.addSubview(agreeText)
        container.addSubview(agreeButton)
    }
    
    func innerLayout() {
        bgMask.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        container.snp.makeConstraints{ make in
            make.top.equalTo(bgMask.snp.bottom).offset(-300)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        info.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(20)
        }
        
        quitLogo.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalTo(info.snp.centerY)
        }
        
        agreeText.snp.makeConstraints { make in
            make.top.equalTo(info.snp.bottom).offset(20)
            make.left.equalTo(info.snp.left)
            make.right.equalTo(quitLogo.snp.right)
            make.height.equalTo(50)
        }
        
        agreeButton.snp.makeConstraints { make in
            make.top.equalTo(agreeText.snp.bottom).offset(30)
            make.left.equalTo(info.snp.left)
            make.right.equalTo(quitLogo.snp.right)
            make.height.equalTo(50)
        }
    }
    
    @objc func closeMask(sender: UIButton) {
        if sender == quitLogo {
            block?(false)
        } else {
            block?(true)
        }

    }
    
}
