//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack{
            VStack{
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            }
        }
        .ignoresSafeArea()
        
    }
}



struct NeuromorphicRectangleCell: View {
    
    var body: some View {
        ZStack{
            Button( action: {
            })
            {
                HStack {
                    Image("CellChest")
                        .resizable()
                        .frame(width: 70, height: 36)
                Text("Exercise for example to add to Workout Diary App")
                    .fontWeight(.bold)
                }
            }
            .buttonStyle(UnTappedButtonStyle())
        }
    }
}


struct UnTappedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 17))
            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
            .multilineTextAlignment(.trailing)
            .frame(width: 370, height: 50)
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
                .padding(.vertical, 5)
    }
}

struct TappedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
