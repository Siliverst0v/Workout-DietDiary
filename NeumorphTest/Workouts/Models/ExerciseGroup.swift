//
//  ExerciseButtonModel.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import Foundation
import RealmSwift

class ChestExerciseGroup: Object {
    @Persisted var title: String
    @Persisted var icon: String
    @Persisted var date: Date
    @Persisted var exercises: List<String>
}

struct ExerciseGroup: Identifiable, Equatable, Hashable {
    let id = UUID()
    var date: Date
    var title: String
    var icon: String
    var exercisesToDisplay: [String]
}

extension ExerciseGroup {
    static func getMocExercises() -> [ExerciseGroup] {
        return [
            ExerciseGroup(
                date: Date(),
                title: "Грудь",
                icon: "chest",
                exercisesToDisplay: Exercises.shared.chest
            ),
            ExerciseGroup(
                date: Date(),
                title: "Спина",
                icon: "back",
                exercisesToDisplay: Exercises.shared.back
            )
        ]
    }
}
