//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var muscleGroups: [[String]]
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach($muscleGroups, id: \.self) {group in
//                    let image = group[0]
                    ForEach(group, id: \.self) { exercise in
                        ExerciseButton(title: exercise, image: group.first!)
                    }
                }
                .padding(15)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(muscleGroups: [[]])
    }
}
