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
    let accTextFilter: Observable<String>
    let capTextFilter: Observable<String>
    let loginButtonAllowed: Observable<Bool>
    
    init(acc: Observable<String>, captcha: Observable<String>) {
        
        accTextFilter = acc.filter { $0 != "" }.filter{ Int($0) != nil }.filter{ $0.count <= 11 }.share(replay: 1)
        
        capTextFilter = captcha.filter { $0 != "" }.filter{ Int($0) != nil }.filter{ $0.count <= 4 }.share(replay: 1)
        
        loginButtonAllowed = Observable.combineLatest(accTextFilter, capTextFilter) { ($0.count == 11 && $1.count == 4) }.share(replay: 1)
    }
}
	
