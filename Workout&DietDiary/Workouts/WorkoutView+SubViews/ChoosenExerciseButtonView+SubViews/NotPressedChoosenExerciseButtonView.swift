//
//  NotPressedChoosenExerciseButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 17.06.2022.
//

import SwiftUI

struct NotPressedChoosenExerciseButtonView: View {
    @Binding var buttonIsNotPressed: Bool
    var icon: String
    var title: String
    
    var action: () -> Void
    @Binding var showConfirm: Bool
    
    var body: some View {
        ZStack {
            Button( action: { buttonIsNotPressed.toggle() } ) {
                GeometryReader { geometry in
                    let width = geometry.size.width
                    HStack {
                        Image(icon)
                            .resizable()
                            .frame(width: 70,
                                   height: 40)
                        Text(title)
                            .fontWeight(.semibold)
                            .lineLimit(3)
                            .frame(width: width - 160,
                                   height: 60,
                                   alignment: .leading)
                            .padding(.leading)
                    }
                    .padding(.init(top: 5,
                                   leading: 16,
                                   bottom: 0,
                                   trailing: 0))
                    
                }
                .frame(width: UIScreen.main.bounds.size.width - 40,
                       height: 70, alignment: .center)
            }
            .buttonStyle(ExerciseButtonStyle())
            Button(action: { showConfirm = true }) {
                    Image(systemName: "x.square")
                        .font(.system(size: 20))
                        .foregroundColor(.customRed)
                        .frame(width: 40,
                               height: 40,
                               alignment: .center)
            }
                .confirmationDialog("", isPresented: $showConfirm, actions: {
                    Button("Удалить", role: .destructive) {
                        self.action()
                    }
                })
            .offset(x: 155,
                    y: 0)
        }
    }
}

struct NotPressedChoosenExerciseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NotPressedChoosenExerciseButtonView(buttonIsNotPressed: .constant(false), icon: "chest", title: "Exercise for example", action: {}, showConfirm: .constant(false))
    }
}
