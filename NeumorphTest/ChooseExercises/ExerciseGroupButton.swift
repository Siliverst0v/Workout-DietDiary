//
//  SimpleButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ExerciseGroupButton: View {
    @Binding var exercises: [ExerciseGroup]
    @Binding var isPressed: Bool
    @Binding var exerciseGroups: [String]
    @Binding var date: Date

    let exercise: ExerciseGroup
    let title: String
    
    var body: some View {
        Button(action: { addingGroup() }) {
        Text("\(title)")
                .foregroundColor(isPressed ? Color.customRed : Color.customBlue)
                .fontWeight(.medium)
                .padding()
    }
    .scaledToFit()
    .buttonStyle(ExerciseGroupButtonStyle(isPressed: $isPressed))
    }
}

extension ExerciseGroupButton {
    func addingGroup() {
        
        isPressed.toggle()
        if isPressed {
            exercises.append(exercise)
            exerciseGroups.append(title)
        } else {
            exercises.removeAll(where: {$0.exercises == exercise.exercises})
            exerciseGroups.removeAll(where: {$0 == title})
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseGroupButton(
            exercises: .constant([]),
            isPressed: .constant(false),
            exerciseGroups: .constant([]),
            date: .constant(Date()),
            exercise: ExerciseGroup(
                date: Date(),
                exerciseGroupName: "",
                icon: "",
                exercises: []),
            title: "Exercise Group")
    }
}
