//
//  MakeObjectViewModel.swift
//  Fine
//
//  Created by 조병진 on 2023/01/30.
//

import Foundation
import RxSwift
import RxCocoa

class MakeObjectViewModel: ViewModel {
    let disposebag = DisposeBag()
    
    struct Input {
        let nameText: ControlProperty<String?>
        let locationText: ControlProperty<String?>
        let menualText: ControlProperty<String?>
//        let emoji: Observable<String>
    }
    
    struct Output {
        let buttonStatus: Observable<Bool>
    }
    
    func transform(input: Input) -> Output {
//        let nameTextStatus = input.nameText
//            .orEmpty
//            .map{ $0.count > 0 }
//            .share()
//
//        let locationTextStatus = input.locationText
//            .orEmpty
//            .map{ $0.count > 0 }
//            .share()
//
//        let menualTextStatus = input.menualText
//            .orEmpty
//            .map{ $0.count > 0}
//            .share()
        
        let valid = input.nameText
            .orEmpty
            .map{ $0.count > 0 }
            .share()
        
        return Output(buttonStatus: valid)
    }
}
