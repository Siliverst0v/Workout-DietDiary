//
//  ExerciseButtonModel.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import Foundation
import RealmSwift

//class ChestExerciseGroup: Object {
//    @Persisted var title: String = "Грудь"
//    @Persisted var icon: String = "chest"
//    @Persisted var exercises: List<String>
//    
//    convenience override init() {
//        self.init()
//        
//    }
//
//}

struct ExerciseGroup: Identifiable, Equatable, Hashable {
    let id = UUID()
    var title: String
    var icon: String
    var exercisesToDisplay: [String]
}

extension ExerciseGroup {
    static func getMocExercises() -> [ExerciseGroup] {
        return [
            ExerciseGroup(
                title: "Грудь",
                icon: "chest",
                exercisesToDisplay: Exercises.shared.chest
            ),
            ExerciseGroup(
                title: "Спина",
                icon: "back",
                exercisesToDisplay: Exercises.shared.back
            )
        ]
    }
}
