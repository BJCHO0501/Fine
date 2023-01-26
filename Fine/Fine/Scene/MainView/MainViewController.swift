//
//  MainViewController.swift
//  Fine
//
//  Created by 조병진 on 2023/01/25.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    var data: [[String: String]] = [
        ["emoji": "✨", "location": "책상위", "objectName": "반짝이"],
        ["emoji": "💡", "location": "책상 오른쪽 위", "objectName": "작은 전구"],
        ["emoji": "🐻‍❄️", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "🚀", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "🎆", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "👑", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "❄️", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "⚙️", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "🧦", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "🪜", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "🗝️", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "🥽", "location": "선반 3번째", "objectName": "하얀 곰돌이"],
        ["emoji": "📝", "location": "선반 3번째", "objectName": "하얀 곰돌이"]
    ]
    private let searchBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    private let listBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    private let listTableView = UITableView(frame: .null, style: .plain).then {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 20
    }
    
    private let searchListImageView = UIImageView(image: UIImage(named: "search_list"))
    
    private let searchTextField = UITextField().then {
        $0.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
        $0.textAlignment = .left
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.showsVerticalScrollIndicator = false
        listTableView.separatorStyle = .none
        listTableView.register(ObjectListTableViewCell.self, forCellReuseIdentifier: "ObjectCell")
        view.backgroundColor = UIColor(named: "gray1")
    }
    
    override func viewDidLayoutSubviews() {
        addSubviews()
        makeConstraints()
    }
}

// MARK: - makeConstraints, addSubviews
extension MainViewController {
    private func addSubviews() {
        [
            searchBackgroundView,
            listBackgroundView
        ].forEach({ view.addSubview($0) })
        
        [
            searchListImageView,
            searchTextField
        ].forEach({ searchBackgroundView.addSubview($0) })
        
        listBackgroundView.addSubview(listTableView)
    }
    
    private func makeConstraints() {
        searchBackgroundView.snp.makeConstraints {
            $0.topMargin.equalTo(15)
            $0.right.left.equalToSuperview().inset(20)
            $0.height.equalTo(64)
        }
        
        listBackgroundView.snp.makeConstraints {
            $0.right.left.equalToSuperview().inset(20)
            $0.top.equalTo(searchBackgroundView.snp.bottom).offset(30)
            $0.bottom.equalToSuperview().inset(30)
        }
        
        listTableView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        }
        
        searchListImageView.snp.makeConstraints {
            $0.width.equalTo(32)
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(15)
        }
        
        searchTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(searchListImageView.snp.right).offset(6)
            $0.right.lessThanOrEqualToSuperview().inset(15)
            $0.right.greaterThanOrEqualToSuperview().inset(15)
        }
    }
}
// MARK: - tableview

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "ObjectCell", for: indexPath) as? ObjectListTableViewCell else { return UITableViewCell() }
        
        cell.emojiLabel.text = data[indexPath.row]["emoji"]
        cell.locationLabel.text = data[indexPath.row]["location"]
        cell.objectNameLabel.text = data[indexPath.row]["objectName"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
