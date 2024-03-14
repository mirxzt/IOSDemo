//
//  loginTextFieldModel.swift
//  Test
//
//  Created by yupaozcj on 2024/3/13.
//

import Foundation
import UIKit

struct Textparams {
    var placehoder: String?
    var innerText:String?
    var unlockImage: UIImage?
    var onfocusImage: UIImage?
    var maxLength: Int? = 11
    
    init(placehoder: String,innerText: String = "", unlockImage: UIImage? = nil, onfocusImage: UIImage? = nil, maxLength: Int) {
        self.placehoder = placehoder
        self.innerText = innerText
        self.unlockImage = unlockImage
        self.onfocusImage = onfocusImage
        self.maxLength = maxLength
    }
}

