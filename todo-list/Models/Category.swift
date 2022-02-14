//
//  Category.swift
//  todo-list
//
//  Created by Yap Feng Yuan on 2022/02/13.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
