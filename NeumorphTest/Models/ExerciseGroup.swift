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
    var exercises: [String]
}

extension ExerciseGroup {
    static func getExercises() -> [ExerciseGroup] {
        return [
            ExerciseGroup(
                date: Date(),
                exerciseGroupName: "Грудь",
                icon: "chest",
                exercises: Exercises.shared.chest
            ),
            ExerciseGroup(
                date: Date(),
                exerciseGroupName: "Спина",
                icon: "back",
                exercises: Exercises.shared.back
            )
        ]
    }
}
