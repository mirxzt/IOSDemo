//
//  VIewController+LoginFunc.swift
//  Test
//
//  Created by yupaozcj on 2024/3/11.
//

import Foundation
import UIKit

extension ViewController {
    
    @objc func loginButtonClick() {
        
        guard buttonAndprivacySection.privacyButton.currentImage == UIImage(named: "icon_people_cer_select") else {
            addMask()
            return
        }
        
        guard loginSection.accountInput.textparams.innerText != "18300000000" else {
            self.view.makeToast(
                "账号已被拉黑",
                duration: 2.0 ,
                position: .top,
                style: style
            )
            return
        }
        
        guard loginSection.accountInput.textparams.innerText != "18311111111" else {
            self.view.makeToast(
                "账号不存在",
                duration: 2.0 ,
                position: .top,
                style: style
            )
            return
        }
        
        guard loginSection.accountInput.textparams.innerText != "18322222222" else {
            self.view.makeToast(
                "网络在开小差，请稍后重试~",
                duration: 2.0 ,
                position: .top,
                style: style
            )
            return
        }
        
        guard loginSection.accountInput.textparams.innerText != "0000" else {
            self.view.makeToast(
                "验证码无效",
                duration: 2.0 ,
                position: .top,
                style: style
            )
            return
        }
        
        guard loginSection.accountInput.textparams.innerText != "1111" else {
            self.view.makeToast(
                "验证码过期",
                duration: 2.0 ,
                position: .top,
                style: style
            )
            return
        }
        
        
        guard loginSection.accountInput.textparams.innerText != "2222" else {
            self.view.makeToast(
                "网络在开小差，请稍后重试~",
                duration: 2.0 ,
                position: .top,
                style: style
            )
            return
        }
        
        guard loginSection.accountInput.textparams.innerText == "18344444444" && loginSection.accountInput.textparams.innerText == "1234" else {
            self.view.makeToast(
                "账号或者验证码错误",
                duration: 2.0 ,
                position: .top,
                style: style
            )
            return
        }
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
