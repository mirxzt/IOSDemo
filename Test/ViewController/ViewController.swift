//
//  ViewController.swift
//  Test
//
//  Created by yupaozcj on 2024/3/8.
//

import UIKit
import SnapKit
import Toast_Swift
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var style = ToastStyle()
    let vc = LoginTextFieldViewController()
    let disposeBag = DisposeBag()
    
    lazy var container: UIView = {
        let r = UIView()
        r.backgroundColor = .white
        return r
    }()
    
    lazy var header: UIView = {
        let r = HeaderVIew()
        return r
    }()
    
    lazy var loginSection: LoginTextfieldView = {
        let r = LoginTextfieldView()
        return r
    }()
    
    lazy var buttonAndprivacySection: LoginButtonAndprivacyTextView = {
        let r = LoginButtonAndprivacyTextView()
        r.isUserInteractionEnabled = true
        return r
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        innerInit()
        innerLayout()
        mountedFunc()
    }
    
    func innerInit() {
        view.backgroundColor = .white
        view.addSubview(container)
        container.addSubview(header)
        container.addSubview(loginSection)
        container.addSubview(buttonAndprivacySection)
    }
    
    func innerLayout() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        header.snp.makeConstraints{ make in
            make.top.equalTo(50)
            make.left.equalTo(20)
            make.width.equalToSuperview().inset(100)
            make.height.equalTo(50)
        }
        
        loginSection.snp.makeConstraints{ make in
            make.top.equalTo(header.snp.bottom).offset(30)
            make.left.equalTo(header.snp.left)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(130)
        }
        
        buttonAndprivacySection.snp.makeConstraints { make in
            make.top.equalTo(loginSection.snp.bottom).offset(30)
            make.left.equalTo(loginSection.snp.left)
            make.right.equalTo(loginSection.snp.right)
            make.bottom.equalToSuperview().inset(50)
        }
    }
    
    func mountedFunc() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(addMask))
        buttonAndprivacySection.privacyLabel.isUserInteractionEnabled = true
        buttonAndprivacySection.privacyLabel.addGestureRecognizer(tap)
        
        loginSection.captchaButton.rx.tap.subscribe(onNext: captchaEvent).disposed(by: disposeBag)
        buttonAndprivacySection.privacyButton.rx.tap.subscribe(onNext: changePrivacyButton).disposed(by: disposeBag)
        buttonAndprivacySection.loginButton.rx.tap.subscribe(onNext: loginButtonClick).disposed(by: disposeBag)
        
        vc.loginConstrains(loginSection: loginSection, loginButton: buttonAndprivacySection.loginButton)
    }
    
    @objc func changePrivacyButton() {
        if buttonAndprivacySection.privacyButton.currentImage == UIImage(named: "icon_sign_people_noSelect") {
            buttonAndprivacySection.privacyButton.setImage(UIImage(named: "icon_people_cer_select"), for: .normal)
        } else {
            buttonAndprivacySection.privacyButton.setImage(UIImage(named: "icon_sign_people_noSelect"), for: .normal)
        }
    }
    
    @objc func addMask() {
        let mask = maskView()
        mask.block = { [weak self] r in
            guard let weakSelf = self else { return }
            if !r {
                mask.removeFromSuperview()
            } else {
                weakSelf.buttonAndprivacySection.privacyButton.setImage(UIImage(named: "icon_people_cer_select"), for: .normal)
                mask.removeFromSuperview()
            }
        }
        view.addSubview(mask)
        
        mask.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
