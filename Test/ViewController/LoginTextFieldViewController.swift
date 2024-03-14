//
//  LoginTextFieldViewController.swift
//  Test
//
//  Created by yupaozcj on 2024/3/13.
//

import Foundation
import RxSwift
import RxCocoa
import SnapKit
import Toast_Swift

class LoginTextFieldViewController: UIViewController {
    private var viewModel: LoginTextFieldViewModel?
    let disposeBag = DisposeBag()
    
    
    func loginConstrains(loginSection: LoginTextfieldView, loginButton: UIButton) {
        
        viewModel = LoginTextFieldViewModel(
            acc: loginSection.accountInput.accountTextField.rx.text.orEmpty.asObservable() ,captcha:loginSection.captchaInput.accountTextField.rx.text.orEmpty.asObservable())
        

        viewModel?.accTextFilter.bind(to: loginSection.accountInput.accountTextField.rx.text).disposed(by: disposeBag)
        viewModel?.capTextFilter.bind(to: loginSection.captchaInput.accountTextField.rx.text).disposed(by: disposeBag)
    
        viewModel?.loginButtonAllowed.subscribe(onNext: { valid in
            if valid {
                loginButton.backgroundColor = .systemBlue
                loginButton.setTitleColor(.white, for: .normal)
                loginButton.isEnabled = true
            }
        }).disposed(by: disposeBag)
    }
}
