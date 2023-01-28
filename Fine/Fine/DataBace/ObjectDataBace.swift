//
//  ObjectDataBace.swift
//  Fine
//
//  Created by 조병진 on 2023/01/28.
//

import Foundation
import RealmSwift

class ObjectData: Object {
    @objc dynamic var emoji = ""
    @objc dynamic var name = ""
    @objc dynamic var location = ""
    @objc dynamic var manual = ""
    @objc dynamic var image = ""
    @objc dynamic var saveDate = ""
    @objc dynamic var category = ""
//    @objc dynamic var GPSLocation = ""
}
