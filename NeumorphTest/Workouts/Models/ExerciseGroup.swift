//
//  ExerciseButtonModel.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import Foundation

struct ExerciseGroup: Identifiable, Equatable, Hashable {
    let id = UUID()
    var date: Date
    var exerciseGroupName: String
    var icon: String
    var exercisesToDisplay: [String]
}

extension ExerciseGroup {
    static func getMocExercises() -> [ExerciseGroup] {
        return [
            ExerciseGroup(
                date: Date(),
                exerciseGroupName: "Грудь",
                icon: "chest",
                exercisesToDisplay: Exercises.shared.chest
            ),
            ExerciseGroup(
                date: Date(),
                exerciseGroupName: "Спина",
                icon: "back",
                exercisesToDisplay: Exercises.shared.back
            )
        ]
    }
}
