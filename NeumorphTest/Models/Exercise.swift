//
//  ExerciseButtonModel.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import Combine

struct Exercise: Identifiable {
    
    let id: Int
    let title: String
    let image: String
    let muscleGroup: [String]
    let setCount = 3
    
}
