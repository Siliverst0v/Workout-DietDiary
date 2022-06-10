//
//  CaloriesModel.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 10.06.2022.
//

import Foundation
import RealmSwift

class Food: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var calories: Double
    @Persisted var date: Date
    
    
    convenience init(name: String, calories: Double, date: Date) {
        self.init()
        self.name = name
        self.calories = calories
        self.date = date
    }
}
