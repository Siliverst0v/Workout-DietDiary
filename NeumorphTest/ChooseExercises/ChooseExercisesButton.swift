//
//  SimpleButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct SimpleButton: View {
    @Binding var exercises: [Exercise]
    @Binding var isPressed: Bool

    let exercise: Exercise
    let title: String
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    let redColor = Color(red: 142/255, green: 51/255, blue: 46/255)
    
    var body: some View {
        Button(action: { addingGroup() }) {
        Text("\(title)")
                .foregroundColor(isPressed ? redColor : blueColor)
                .fontWeight(.medium)
                .padding()
    }
    .scaledToFit()
    .buttonStyle(ChooseExerciseButtonStyle(isPressed: $isPressed))
    }

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
            exercise: Exercise(
                header: "",
                icon: "",
                exercises: []),
            title: "Exercise 1")
    }
}
