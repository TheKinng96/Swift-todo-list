//
//  Data.swift
//  todo-list
//
//  Created by Yap Feng Yuan on 2022/02/13.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
