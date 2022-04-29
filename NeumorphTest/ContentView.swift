//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var exercises: [[String]]
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach($exercises, id: \.self) {group in
                    ForEach(group, id: \.self) { exercise in
                        ExerciseButton(title: exercise, image: "chest")
                    }
                }
                .padding(15)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(exercises: [[]])
    }
}
