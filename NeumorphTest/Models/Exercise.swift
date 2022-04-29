//
//  ExerciseButtonModel.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import Combine
import Foundation

struct Exercise: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let icon: String
    var exercises: [String]?
}

extension Exercise {
    static func getExercises() -> [Exercise] {
        return [
            Exercise(
                title: "Грудь",
                icon: "chest",
                exercises: Exercises.shared.chest
            ),
            Exercise(
                title: "Спина",
                icon: "back",
                exercises: Exercises.shared.back
            )
        ]
    }
}
