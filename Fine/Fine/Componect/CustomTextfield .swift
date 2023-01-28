//
//  CustomTextfield .swift
//  Fine
//
//  Created by 조병진 on 2023/01/28.
//

import UIKit

class CustomTextfield: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        textColor = .black
        font = UIFont(name: "S-CoreDream-5Medium", size: 12)
        backgroundColor = UIColor(named: "gray1")
        layer.cornerRadius = 10
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.height))
        leftView = paddingView
        rightView = paddingView
        leftViewMode = .always
        rightViewMode = .always
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
