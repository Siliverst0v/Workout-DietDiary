//
//  test.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 29.04.2022.
//

import SwiftUI

struct Test: View {
    var exercises: [Exercises]
    
    var body: some View {
        ForEach(exercises, id: \.id) {exercise in
            ForEach(exercise.chest, id: \.self) {title in
                Text("\(title)")
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test(exercises: [Exercises]())
    }
}
