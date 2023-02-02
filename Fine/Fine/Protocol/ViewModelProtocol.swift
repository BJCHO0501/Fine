//
//  ViewModelProtocol.swift
//  Fine
//
//  Created by 조병진 on 2023/01/30.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output 
}
