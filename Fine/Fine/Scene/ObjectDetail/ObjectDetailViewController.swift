//
//  ObjectDetailViewController.swift
//  Fine
//
//  Created by 조병진 on 2023/02/02.
//

import UIKit
import SnapKit
import Then

class ObjectDetailViewController: UIViewController {
    private let objectImageView = UIImageView().then {
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        $0.backgroundColor = .brown
    }
    
    private let backgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    private let emojiLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 80)
    }
    
    private let categoryView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 15
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-5Medium", size: 35)
    }
    
    private let locationMarkLabel = UILabel().then {
        $0.text = "📍위치"
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-3Light", size: 20)
    }
    
    let locationLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-3Light", size: 15)
        $0.textAlignment = .left
    }
    
    private let manualMarkLabel = UILabel().then {
        $0.text = "📝설명"
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-3Light", size: 20)
    }
    
    let manualLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-3Light", size: 15)
        $0.textAlignment = .left
        $0.numberOfLines = 3
    }
    
    // 나중에 mapkit을 이용한 지도로 바꾸기
    private let mapView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .gray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "gray1")
        //임시
        emojiLabel.text = "❄️"
        titleLabel.text = "얼음팩"
        locationLabel.text = "냉동고 2번째 칸"
        manualLabel.text = "굉장히 차가운 얼음팩 주로 감기에 걸렸을때 머리를 식히기 위해 사용합니다!"
        categoryView.backgroundColor = UIColor(named: "blue")
    }
    
    override func viewDidLayoutSubviews() {
        addSubviews()
        makeConstraints()
    }
}

// MARK: - addsubviews, makeConstraints

extension ObjectDetailViewController {
    private func addSubviews() {
        view.addSubview(backgroundView)
        
        [
            objectImageView,
            emojiLabel,
            categoryView,
            titleLabel,
            locationMarkLabel,
            locationLabel,
            manualMarkLabel,
            manualLabel,
            mapView
        ].forEach({ backgroundView.addSubview($0) })
    }
    
    private func makeConstraints() {
        backgroundView.snp.makeConstraints {
            $0.right.left.equalToSuperview().inset(20)
            $0.topMargin.equalTo(15)
            $0.bottom.equalToSuperview().inset(30)
        }
        
        objectImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(4)
        }
        
        emojiLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(13)
            $0.centerY.equalTo(objectImageView.snp.bottom)
        }
        
        categoryView.snp.makeConstraints {
            $0.right.equalToSuperview().inset(13)
            $0.top.equalTo(objectImageView.snp.bottom).offset(13)
            $0.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(13)
            $0.top.equalTo(objectImageView.snp.bottom).offset(50)
        }
        
        locationMarkLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(17)
            $0.top.equalTo(titleLabel.snp.bottom).offset(23)
        }
        
        locationLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(22)
            $0.top.equalTo(locationMarkLabel.snp.bottom).offset(4)
        }
        
        manualMarkLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(17)
            $0.top.equalTo(locationLabel.snp.bottom).offset(34)
        }
        
        manualLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(22)
            $0.top.equalTo(manualMarkLabel.snp.bottom).offset(4)
        }
        
        mapView.snp.makeConstraints {
            $0.top.equalTo(manualLabel.snp.bottom).offset(30)
            $0.left.right.bottom.equalToSuperview().inset(17)
        }
    }
}
