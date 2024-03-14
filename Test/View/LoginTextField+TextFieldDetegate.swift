//
//  LoginTextField+TextFieldDetegate.swift
//  Test
//
//  Created by yupaozcj on 2024/3/11.
//

import Foundation
import UIKit

extension LoginTextItemView: UITextFieldDelegate {
    func textField(_ textField: UITextField,shouldChangeCharactersIn range:NSRange,replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        
        let lenght = string.lengthOfBytes(using: .utf8)

        for loopIndex in 0..<lenght {
            let char = (string as NSString).character(at: loopIndex)
            if char < 48 {
                return false
            }
            if char > 57 {
                return false
            }
        }
        
        if (textField.text?.lengthOfBytes(using: .utf8) ?? 0 >= textparams.maxLength ?? 11 ) {
            return false
        }
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        accImage.image = textparams.onfocusImage
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        accImage.image = textparams.unlockImage
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textparams.innerText = textField.text
        isLogin = accountTextField.text!.lengthOfBytes(using: .utf8) == textparams.maxLength
        var name: Notification.Name = Notification.Name("")
        if textparams.maxLength == 11 {
            name =  Notification.Name("phoneLogin")
        } else {
            name = Notification.Name("captchaLogin")
        }
        NotificationCenter.default.post(name: name, object: nil)
//        block?(self)
    }
}
