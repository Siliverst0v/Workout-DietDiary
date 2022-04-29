//
//  Test.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 29.04.2022.
//

import SwiftUI

struct Test: View {
    var exercises = Exercise.getExercises()
    
    var body: some View {
        Text("")
    }
}

struct Sfjdsk: View {
    @Binding var exercises: [Exercise]
    let muscleGroup: [String]
    @Binding var isPressed: Bool

    let title: String
    let imageName: String
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)

    var body: some View {
        Button(action: { addingGroup() }) {
        Text("\(title)")
            .foregroundColor(blueColor)
            .fontWeight(.medium)
            .padding()
    }
    .scaledToFit()
    .buttonStyle(SimpleButtonStyle(isPressed: $isPressed))
    }

    func addingGroup() {
        
        isPressed.toggle()
        if isPressed {
            let exercise = Exercise(
                title: title,
                icon: imageName,
                exercises: muscleGroup)
            exercises.append(exercise)
        } else {
//            exercises.removeAll{$0 == exercise}
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
