//
//  NotPressedChoosenExerciseButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 17.06.2022.
//

import SwiftUI

struct NotPressedChoosenExerciseButtonView: View {
    @Binding var buttonIsNotPressed: Bool
    @Binding var deleteMode: Bool
    var icon: String
    var title: String
    
    var action: () -> Void
    
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
            .disabled(deleteMode)
            .buttonStyle(ExerciseButtonStyle())
            Button(action: { self.action() }) {
                Image(systemName: "trash")
                    .font(.system(size: 20))
                    .foregroundColor(.customRed)
                    .frame(width: 40,
                           height: 40,
                           alignment: .center)
            }
            .opacity(deleteMode ? 1 : 0)
            .disabled(!deleteMode)
            .offset(x: 155,
                    y: 0)
        }
    }
}

//struct NotPressedChoosenExerciseButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NotPressedChoosenExerciseButton(buttonIsNotPressed: .constant(false), deleteMode: .constant(false), icon: "chest", title: "Some title", action: )
//    }
//}
