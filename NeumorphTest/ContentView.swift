//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 11.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WorkoutsView()
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("Дневник тренировок")
                }
            CaloriesView()
                .tabItem {
                    Image(systemName: "fork.knife.circle.fill")
                    Text("Дневник калорий")

                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
