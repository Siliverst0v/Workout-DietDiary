//
//  WorkoutsView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 01.05.2022.
//

import SwiftUI

struct WorkoutButton: View {
    let date: Date
    let muscleGroups: [String]
    
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    let redColor = Color(red: 142/255, green: 51/255, blue: 46/255)
    var body: some View {
        Button(action: {}) {
            HStack {
                VStack{
                    Text(date, style: .date)
                        .environment(\.locale, Locale.init(identifier: "ru"))
                        .foregroundColor(redColor)
                        .font(.headline)
                        .padding(5)
                    ForEach(muscleGroups, id: \.self) { muscleGroups in
                    Text(muscleGroups)
                        .foregroundColor(blueColor)
                        .font(.headline)
                        .padding(5)
                    }
                }
                .padding()
                Image("Body")
                    .resizable()
                    .frame(height: 160)
                    .padding()
            }
        }
        .scaledToFit()
        .buttonStyle(WorkoutButtonStyle())
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutButton(date: Date(), muscleGroups: ["Спина", "Грудь"])
    }
}
