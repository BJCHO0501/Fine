//
//  MakeObjectViewModel.swift
//  Fine
//
//  Created by 조병진 on 2023/01/30.
//

import Foundation
import RealmSwift
import RxSwift
import RxCocoa

class MakeObjectViewModel: ViewModelType {
    let realm = try! Realm()
    let disposebag = DisposeBag()
    struct Input {
        let nameTextValueDriver: Driver<String>
        let locationTextValueDriver: Driver<String>
        let manualTextValueDriver: Driver<String>
        let enterButtonSignal: Signal<Void>
        let redCategoryButtonSignal: Driver<Void>
        let orangeCategoryButtonSignal: Driver<Void>
        let yellowCategoryButtonSignal: Driver<Void>
        let greenCategoryButtonSignal: Driver<Void>
        let blueCategoryButtonSignal: Driver<Void>
        let purpleCategoryButtonSignal: Driver<Void>
        let emojiValueDriver: Driver<String>
    }
    
    struct Output {
        let buttonStatus: Driver<Bool>
        let categoryAction: Driver<CategoryColor>
    }
    
    func transform(input: Input) -> Output {
        let selectCategory = BehaviorRelay<CategoryColor>(value: .red)
        let info = Driver.combineLatest(
            input.nameTextValueDriver,
            input.locationTextValueDriver,
            input.manualTextValueDriver,
            input.emojiValueDriver,
            selectCategory.asDriver()
        )
        let isEnable = info.map { !$0.0.isEmpty && !$0.1.isEmpty && !$0.2.isEmpty }
        input.redCategoryButtonSignal
            .drive { _ in
                selectCategory.accept(.red)
            }
            .disposed(by: disposebag)
        
        input.orangeCategoryButtonSignal
            .drive { _ in
                selectCategory.accept(.orange)
            }
            .disposed(by: disposebag)
        
        input.yellowCategoryButtonSignal
            .drive { _ in
                selectCategory.accept(.yellow)
            }
            .disposed(by: disposebag)
        
        input.greenCategoryButtonSignal
            .drive { _ in
                selectCategory.accept(.green)
            }
            .disposed(by: disposebag)
        
        input.blueCategoryButtonSignal
            .drive { _ in
                selectCategory.accept(.blue)
            }
            .disposed(by: disposebag)
        
        input.purpleCategoryButtonSignal
            .drive { _ in
                selectCategory.accept(.purple)
            }
            .disposed(by: disposebag)
        
        input.enterButtonSignal.withLatestFrom(info)
            .emit { [unowned self] name, location, manual, emoji, category in
                let pack = ObjectData()
                pack.name = name
                pack.location = location
                pack.manual = manual
                pack.emoji = emoji
                pack.category = "\(category)"
                var printValue: String = "이름: \(name)\n"
                printValue.append("위치: \(location)\n")
                printValue.append("설명: \(manual)\n")
                printValue.append("이모지: \(emoji)\n")
                printValue.append("카테고리: \(category)\n")
                print(printValue)
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                do {
                    try realm.write {
                        realm.add(pack)
                    }
                } catch {
                    print("realm err \(error)")
                }
                var models = realm.objects(ObjectData.self)
                print("데이터: \(models)")
            }
            .disposed(by: disposebag)
        
        return Output(
            buttonStatus: isEnable.asDriver(),
            categoryAction: selectCategory.asDriver()
        )
    }
}
