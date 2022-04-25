//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var exercises = Exercises.shared

    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach($exercises.chest, id: \.self) {exercise in
                    ExerciseButton(title: exercise)
                }
                .padding(15)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
