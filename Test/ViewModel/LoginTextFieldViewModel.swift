//
//  LoginTextFieldViewModel.swift
//  Test
//
//  Created by yupaozcj on 2024/3/13.
//

import Foundation
import RxSwift
import RxCocoa

class LoginTextFieldViewModel {
    let accTextLengthLimit: Observable<Bool>
    let capTextLengthLimit: Observable<Bool>
    let loginButtonAllowed: Observable<Bool>
    
    init(acc: Observable<String>, captcha: Observable<String>) {
        
        accTextLengthLimit = acc.map{ $0.count == 11 }.share(replay: 1)
        
        capTextLengthLimit = captcha.map{ $0.count == 4 }.share(replay: 1)
        
        loginButtonAllowed = Observable.combineLatest(accTextLengthLimit, capTextLengthLimit) { ($0 && $1) }.share(replay: 1)
    }
}
	
