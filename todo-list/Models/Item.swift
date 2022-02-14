//
//  Item.swift
//  todo-list
//
//  Created by Yap Feng Yuan on 2022/02/13.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
