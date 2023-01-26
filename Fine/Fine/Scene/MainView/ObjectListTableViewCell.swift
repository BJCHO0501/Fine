//
//  ObjectListTableViewCell.swift
//  Fine
//
//  Created by 조병진 on 2023/01/25.
//

import UIKit
import SnapKit
import Then

class ObjectListTableViewCell: UITableViewCell {
    
    let emojiLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 45)
    }
    
    let locationLabel = UILabel().then {
        $0.textColor = UIColor(named: "gray2")
        $0.font = UIFont(name: "S-CoreDream-5Medium", size: 10)
        $0.textAlignment = .left
    }
    
    let objectNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
        $0.textAlignment = .left
    }
    
    override func layoutSubviews() {
        addSubviews()
        makeConstraints()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ObjectListTableViewCell {
    private func addSubviews() {
        [
            emojiLabel,
            locationLabel,
            objectNameLabel
        ].forEach({ contentView.addSubview($0) })
    }
    
    private func makeConstraints() {
        emojiLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().inset(11)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(emojiLabel.snp.top).inset(10)
            $0.left.equalTo(emojiLabel.snp.right).offset(11)
            $0.width.equalToSuperview().inset(40)
        }
        
        objectNameLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(4)
            $0.left.equalTo(emojiLabel.snp.right).offset(11)
            $0.width.equalToSuperview().inset(40)
        }
    }
}
