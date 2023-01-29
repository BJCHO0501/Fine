//
//  CategoryButton.swift
//  Fine
//
//  Created by 조병진 on 2023/01/29.
//

import UIKit
import SnapKit

class CategoryButton: UIButton {
    private let checkMark = UIImageView(image: UIImage(named: "white_check"))
    
    var categoryType: CategoryColor = .red
    
    init(color: UIColor?, type: CategoryColor) {
        super.init(frame: .zero)
        backgroundColor = color
        layer.cornerRadius = 12.5
        categoryType = type
        checkMark.layer.opacity = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubviews()
        makeConstraints()
    }
}

extension CategoryButton {
    func check() {
        checkMark.layer.opacity = 1
    }
    
    func uncheck() {
        checkMark.layer.opacity = 0
    }
}

extension CategoryButton {
    private func addSubviews() {
        addSubview(checkMark)
    }
    
    private func makeConstraints() {
        checkMark.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
