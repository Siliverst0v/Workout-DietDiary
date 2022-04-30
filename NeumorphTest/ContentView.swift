//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ContentView: View {
    @Binding var exercises: [Exercise]
    
    let redColor = Color(red: 142/255, green: 51/255, blue: 46/255)

    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach($exercises, id: \.id) {exerciseGroup in
                    TextField("", text: exerciseGroup.header)
                        .font(.title)
                        .foregroundColor(redColor)
                        .disabled(true)
                        .padding()
                    ForEach(exerciseGroup.exercises, id: \.self) {exercise in
                        ExerciseButton(title: exercise, image: exerciseGroup.icon)
                    }
                }
//                .padding(15)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(exercises: .constant(Exercise.getExercises()))
    }
}
