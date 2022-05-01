//
//  ExerciseButtonModel.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import Foundation

struct ExerciseGroup: Identifiable, Equatable, Hashable {
    let id = UUID()
    var header: String
    var icon: String
    var exercises: [String]
}

extension ExerciseGroup {
    static func getExercises() -> [ExerciseGroup] {
        return [
            ExerciseGroup(
                header: "Грудь",
                icon: "chest",
                exercises: Exercise.shared.chest
            ),
            ExerciseGroup(
                header: "Спина",
                icon: "back",
                exercises: Exercise.shared.back
            )
        ]
    }
}
