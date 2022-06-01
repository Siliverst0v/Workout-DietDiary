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
    
    
    convenience init(date: Date) {
        self.init()
        self.date = date
    }
}

class RealmChoosenExercise: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var icon: String
    @Persisted var title: String
    @Persisted var note: String
    @Persisted var sets: List<RealmSet>
    @Persisted(originProperty: "choosenExercises") var realmWorkout: LinkingObjects<RealmWorkout>
    
    convenience init(icon: String, title: String, note: String) {
        self.init()
        self.icon = icon
        self.title = title
        self.note = note
    }
}

class RealmSet: Object {
    @Persisted var id: Int
    @Persisted var repeats: String
    @Persisted var weight: String
    @Persisted(originProperty: "sets") var realmChoosenExercises: LinkingObjects<RealmChoosenExercise>
    
    convenience init(id: Int, repeats: String, weight: String) {
        self.init()
        self.id = id
        self.repeats = repeats
        self.weight = weight
    }
}

class TestSets: ObservableObject {
    @Published var sets: [TestSet] = []
    
    init() {}
    
    init(sets: [TestSet]) {
        self.sets = sets
    }
}

struct TestSet: Equatable {
    var id: Int
    var repeats: String
    var weight: String
}
