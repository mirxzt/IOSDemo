//
//  ViewControl+CaptchaFunc.swift
//  Test
//
//  Created by yupaozcj on 2024/3/11.
//

import Foundation

extension ViewController {

    @objc func captchaEvent() {
        guard loginSection.accountInput.accountTextField.text?.lengthOfBytes(using: .utf8) != 0 else {
            self.view.makeToast("请输入电话号码",duration: 2.0 ,position: .top, style: style)
            return
        }
        
        guard (loginSection.accountInput.accountTextField.text?.lengthOfBytes(using: .utf8) == 11) else {
            self.view.makeToast(
                "输入电话号码格式不对",
                duration: 2.0 ,
                position: .top,
                style: style
            )
            return
        }
        
        loginSection.captchaButton.isEnabled = false
        loginSection.captchaButton.setTitleColor(.systemGray, for: .normal)
        let countDownTimer = Timer()
        countDownTimer.startTiming(maxTime: 60) { [weak self] value in
            self?.loginSection.captchaButton.setTitle("\(value)s后再次获取", for: .normal)
        } complete: { [weak self] in
            self?.loginSection.captchaButton.isEnabled = true
            self?.loginSection.captchaButton.setTitleColor(.systemBlue, for: .normal)
            self?.loginSection.captchaButton.setTitle("获取验证码", for: .normal)
            countDownTimer.cancelTiming()
        }
    }
}
