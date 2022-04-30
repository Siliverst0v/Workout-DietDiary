//
//  ExerciseButtonModel.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import Foundation

struct Exercise: Identifiable, Equatable, Hashable {
    let id = UUID()
    var header: String
    var icon: String
    var exercises: [String]
}

extension Exercise {
    static func getExercises() -> [Exercise] {
        return [
            Exercise(
                header: "Грудь",
                icon: "chest",
                exercises: Exercises.shared.chest
            ),
            Exercise(
                header: "Спина",
                icon: "back",
                exercises: Exercises.shared.back
            )
        ]
    }
}
