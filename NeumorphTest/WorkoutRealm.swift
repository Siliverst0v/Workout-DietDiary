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

class RealmChoosenExercise: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var icon: String
    @Persisted var title: String
    @Persisted var sets: List<RealmSet>
}

class RealmSet: Object {
    @Persisted var id: Int
    @Persisted var repeats: String
    @Persisted var weight: String
}
