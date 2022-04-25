//
//  CustomButtonStyle.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ExerciseButtonStyle: ButtonStyle {
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .foregroundColor(blueColor)
            .frame(width: UIScreen.main.bounds.size.width - 40, height: 70, alignment: .center)
            .background(
                        RoundedRectangle(cornerRadius: 11)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                        .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 11)
                                .stroke(Color.gray, lineWidth: 0.1)
                        )
                )
    }
}

struct SimpleButtonStyle: ButtonStyle {
    @Binding var isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Group {
                    if isPressed {
                        RoundedRectangle(cornerRadius: 11)
                            .fill(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.gray, lineWidth: 3)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(
                                        RoundedRectangle(cornerRadius: 11)
                                        .fill(LinearGradient(Color.black, Color.gray)))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.white, lineWidth: 3)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(
                                        RoundedRectangle(cornerRadius: 11)
                                            .fill(LinearGradient(Color.black, Color.gray)))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.gray, lineWidth: 0.1)
                            )
                    } else {
                        RoundedRectangle(cornerRadius: 11)
                            .fill(.white)
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                            .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.gray, lineWidth: 0.1)
                        )
                    }
                }
            )
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
