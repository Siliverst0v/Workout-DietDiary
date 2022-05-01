//
//  SimpleButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct SimpleButton: View {
    @Binding var exercises: [ExerciseGroup]
    @Binding var isPressed: Bool

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
    .buttonStyle(ChooseExerciseButtonStyle(isPressed: $isPressed))
    }
}

extension SimpleButton {
    func addingGroup() {
        
        isPressed.toggle()
        if isPressed {
            exercises.append(exercise)
        } else {
            exercises.removeAll(where: {$0.exercises == exercise.exercises})
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButton(
            exercises: .constant([]),
            isPressed: .constant(false),
            exercise: ExerciseGroup(
                header: "",
                icon: "",
                exercises: []),
            title: "Exercise 1")
    }
}
