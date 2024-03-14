//
//  BindingDataViewModel.swift
//  Test
//
//  Created by yupaozcj on 2024/3/13.
//

import Foundation

protocol InputType {}

protocol OutType {}

protocol BindingDataViewModelType{
    associatedtype Input: InputType
    associatedtype Output: OutType
    
    func configure(input: Input) -> Output	
}
