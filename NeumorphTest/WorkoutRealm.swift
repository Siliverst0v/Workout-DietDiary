//
//  WorkoutRealm.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 16.05.2022.
//

import Foundation
import RealmSwift

class RealmWorkout: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var date: Date
    @Persisted var exerciseGroups: List<String>
    @Persisted var choosenExercises: List<RealmChoosenExercise>
}

class RealmChoosenExercise: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var icon: String
    @Persisted var title: String
    @Persisted var sets: List<RealmSet>
    
    convenience init(icon: String, title: String) {
        self.init()
        self.icon = icon
        self.title = title
    }
}

class RealmSet: Object {
    @Persisted var id: Int
    @Persisted var repeats: String
    @Persisted var weight: String
    
    convenience init(id: Int, repeats: String, weight: String) {
        self.init()
        self.id = id
        self.repeats = repeats
        self.weight = weight
    }
}
