//
//  WorkoutRealm.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 16.05.2022.
//

import Foundation
import RealmSwift

class Workout: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var date: Date
    @Persisted var exerciseGroups: List<String>
    @Persisted var choosenExercises: List<ChoosenExercise>
    
    
    convenience init(date: Date) {
        self.init()
        self.date = date
    }
}

class ChoosenExercise: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var icon: String
    @Persisted var title: String
    @Persisted var note: String
    @Persisted var date: Date
    @Persisted var sets: List<RealmSet>
    @Persisted(originProperty: "choosenExercises") var realmWorkout: LinkingObjects<Workout>
    
    convenience init(icon: String, title: String, note: String, date: Date) {
        self.init()
        self.icon = icon
        self.title = title
        self.note = note
        self.date = date
    }
    

}

class RealmSet: Object {
    @Persisted var id: Int
    @Persisted var repeats: String
    @Persisted var weight: String
    @Persisted(originProperty: "sets") var realmChoosenExercises: LinkingObjects<ChoosenExercise>
    
    convenience init(id: Int, repeats: String, weight: String) {
        self.init()
        self.id = id
        self.repeats = repeats
        self.weight = weight
    }
}



class MocSets: ObservableObject {
    @Published var sets: [MocSet] = []
    
    init() {}
    
    init(sets: [MocSet]) {
        self.sets = sets
    }
}

struct MocSet: Equatable {
    var id: Int
    var repeats: String
    var weight: String
}
