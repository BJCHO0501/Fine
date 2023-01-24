//
//  ViewController.swift
//  Fine
//
//  Created by 조병진 on 2023/01/24.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    private let testLabel = UILabel().then {
        $0.text = "옳른 비밀번호를 입력해주세요 :)"
        $0.font = UIFont(name: "S-CoreDream-6Bold", size: 10)
        $0.textColor = UIColor.black
        $0.numberOfLines = 2
        $0.textAlignment = .left
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        addSubviews()
        makeConstratints()
    }
}

extension ViewController {
    private func addSubviews() {
        view.addSubview(testLabel)
    }
    
    private func makeConstratints() {
        testLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
