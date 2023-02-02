//
//  MakeObjectViewController.swift
//  Fine
//
//  Created by 조병진 on 2023/01/28.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import EmojiPicker

enum CategoryColor {
    case red, orange, yellow, green, blue, purple
}

class MakeObjectViewController: UIViewController {
    let disposeBag = DisposeBag()
    var category: CategoryColor = .red
    
    private let viewModel = MakeObjectViewModel()
    
    private let backgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    private let objectInfoLabel = UILabel().then {
        $0.text = "물건 정보"
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
    }
    
    private let categoryLabel = UILabel().then {
        $0.text = "카테고리"
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
    }
    
    private let emojiLabel = UILabel().then {
        $0.text = "이모티콘"
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
    }
    
    private let manualLabel = UILabel().then {
        $0.text = "추가 설명"
        $0.textColor = .black
        $0.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
    }
    
    private let objectNameTextField = CustomTextfield(placeholder: "물건을 어떻게 부르나요?")
    
    private let objectLocationTextField = CustomTextfield(placeholder: "물건의 자세한 위치를 입력해주세요!")
    
    private let manualTextField = CustomTextfield(placeholder: "자세한 설명을 입력해주요 :)")
    
    private let redCategoryButton = CategoryButton(color: UIColor(named: "red"), type: .red)
    
    private let orangeCategoryButton = CategoryButton(color: UIColor(named: "orange"), type: .orange)
    
    private let yellowCategoryButton = CategoryButton(color: UIColor(named: "yellow"), type: .yellow)
    
    private let greenCategoryButton = CategoryButton(color: UIColor(named: "green"), type: .green)
    
    private let blueCategoryButton = CategoryButton(color: UIColor(named: "blue"), type: .blue)
    
    private let purpleCategoryButton = CategoryButton(color: UIColor(named: "purple1"), type: .purple)
    
    private let emojiButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "gray1")
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        $0.setTitle("📦", for: .normal)
    }
    
    private let enterButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "purple1")
        $0.setTitle("등록", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "S-CoreDream-6Bold", size: 20)
        $0.layer.cornerRadius = 5
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "gray1")
        updateCategory()
        bind()
    }
    
    override func viewDidLayoutSubviews() {
        addSubviews()
        makeConstraints()
    }
}

// MARK: - functions

extension MakeObjectViewController {
    private func updateCategory() {
        [
            redCategoryButton,
            orangeCategoryButton,
            yellowCategoryButton,
            greenCategoryButton,
            blueCategoryButton,
            purpleCategoryButton
        ].forEach {
            if($0.categoryType == category) {
                $0.check()
            } else {
                $0.uncheck()
            }
        }
    }
}

// MARK: - addSubviews, makeConstraints, bind

extension MakeObjectViewController {
    private func addSubviews() {
        view.addSubview(backgroundView)
        
        [
            objectInfoLabel,
            emojiLabel,
            manualLabel,
            categoryLabel,
            objectNameTextField,
            objectLocationTextField,
            manualTextField,
            redCategoryButton,
            orangeCategoryButton,
            yellowCategoryButton,
            greenCategoryButton,
            blueCategoryButton,
            purpleCategoryButton,
            emojiButton,
            enterButton
        ].forEach({ backgroundView.addSubview($0) })
    }
    
    private func makeConstraints() {
        backgroundView.snp.makeConstraints {
            $0.right.left.equalToSuperview().inset(20)
            $0.topMargin.equalTo(15)
            $0.bottom.equalToSuperview().inset(30)
        }
        
        objectInfoLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(17)
            $0.topMargin.equalTo(60)
        }
        
        objectNameTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(17)
            $0.top.equalTo(objectInfoLabel.snp.bottom).offset(16)
            $0.height.equalTo(39)
        }
        
        objectLocationTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(17)
            $0.top.equalTo(objectNameTextField.snp.bottom).offset(7)
            $0.height.equalTo(39)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(17)
            $0.top.equalTo(objectLocationTextField.snp.bottom).offset(28)
        }
        
        redCategoryButton.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(8)
            $0.left.equalTo(categoryLabel)
            $0.width.height.equalTo(25)
        }
        
        orangeCategoryButton.snp.makeConstraints {
            $0.top.equalTo(redCategoryButton)
            $0.left.equalTo(redCategoryButton.snp.right).offset(10)
            $0.width.height.equalTo(25)
        }
        
        yellowCategoryButton.snp.makeConstraints {
            $0.top.equalTo(redCategoryButton)
            $0.left.equalTo(orangeCategoryButton.snp.right).offset(10)
            $0.width.height.equalTo(25)
        }
        
        greenCategoryButton.snp.makeConstraints {
            $0.top.equalTo(redCategoryButton)
            $0.left.equalTo(yellowCategoryButton.snp.right).offset(10)
            $0.width.height.equalTo(25)
        }
        
        blueCategoryButton.snp.makeConstraints {
            $0.top.equalTo(redCategoryButton)
            $0.left.equalTo(greenCategoryButton.snp.right).offset(10)
            $0.width.height.equalTo(25)
        }
        
        purpleCategoryButton.snp.makeConstraints {
            $0.top.equalTo(redCategoryButton)
            $0.left.equalTo(blueCategoryButton.snp.right).offset(10)
            $0.width.height.equalTo(25)
        }
        
        emojiLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(17)
            $0.top.equalTo(redCategoryButton.snp.bottom).offset(28)
        }
        
        emojiButton.snp.makeConstraints {
            $0.top.equalTo(emojiLabel.snp.bottom).offset(8)
            $0.left.equalTo(emojiLabel)
            $0.width.height.equalTo(60)
        }
        
        manualLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(17)
            $0.top.equalTo(emojiButton.snp.bottom).offset(28)
        }
        
        manualTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(17)
            $0.top.equalTo(manualLabel.snp.bottom).offset(8)
            $0.height.equalTo(39)
        }
        
        enterButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(25)
            $0.height.equalTo(55)
        }
    }
    
    private func bind() {
        let input = MakeObjectViewModel.Input(
            nameText: objectNameTextField.rx.text,
            locationText: objectLocationTextField.rx.text,
            menualText: manualTextField.rx.text
        )
        let output = viewModel.transform(input: input)
        
        output.buttonStatus
            .bind { value in
                self.enterButton.backgroundColor = value ? UIColor(named: "purple1") : .gray
                self.enterButton.isEnabled = value
            }
            .disposed(by: disposeBag)
        
        emojiButton.rx.tap
            .bind { [self] in
                let emojiViewController = EmojiPickerViewController()
                emojiViewController.delegate = self
                emojiViewController.sourceView = emojiButton
                present(emojiViewController, animated: true)
            }
            .disposed(by: disposeBag)
        
        enterButton.rx.tap
            .bind {
                print("next")
            }
            .disposed(by: disposeBag)
        
        redCategoryButton.rx.tap
            .bind { [self] in
                category = .red
                updateCategory()
            }
            .disposed(by: disposeBag)
        
        orangeCategoryButton.rx.tap
            .bind { [self] in
                category = .orange
                updateCategory()
            }
            .disposed(by: disposeBag)
        
        yellowCategoryButton.rx.tap
            .bind { [self] in
                category = .yellow
                updateCategory()
            }
            .disposed(by: disposeBag)
        
        greenCategoryButton.rx.tap
            .bind { [self] in
                category = .green
                updateCategory()
            }
            .disposed(by: disposeBag)
        
        blueCategoryButton.rx.tap
            .bind { [self] in
                category = .blue
                updateCategory()
            }
            .disposed(by: disposeBag)
        
        purpleCategoryButton.rx.tap
            .bind { [self] in
                category = .purple
                updateCategory()
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - EmojiPickerDelegate

extension MakeObjectViewController: EmojiPickerDelegate {
    func didGetEmoji(emoji: String) {
        emojiButton.setTitle(emoji, for: .normal)
    }
}
