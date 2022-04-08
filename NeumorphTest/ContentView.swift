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
            TappedNeuromorphicRectangleCell()
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


struct TappedNeuromorphicRectangleCell: View {
    
    @State var didTapped = false
    
    var body: some View {
        ZStack{
            Button( action: { self.didTapped.toggle() })
            {
                HStack {
                Image("CellChest")
                        .resizable()
                        .frame(width: 70, height: 36)
                Text("Exercise for example to add to Workout Diary App")
                    .fontWeight(.bold)
                }
            }
        }
        .buttonStyle(TappedButtonStyle())
    }
    

}


struct UnTappedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 17))
            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
            .multilineTextAlignment(.trailing)
            .frame(width: 390, height: 50)
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

//Circle()
//    .fill(Color.offWhite)
//    .overlay(
//        Circle()
//            .stroke(Color.gray, lineWidth: 4)
//            .blur(radius: 4)
//            .offset(x: 2, y: 2)
//            .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
//    )
//    .overlay(
//        Circle()
//            .stroke(Color.white, lineWidth: 8)
//            .blur(radius: 4)
//            .offset(x: -2, y: -2)
//            .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
//    )

struct TappedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 17))
            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
            .multilineTextAlignment(.trailing)
            .frame(width: 390, height: 222)
                .background(
                    RoundedRectangle(cornerRadius: 11)
                        .fill(.white)
                        .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 8)
                                    .offset(x: 2, y: 2)
                                    .mask(RoundedRectangle(cornerRadius: 11).fill(LinearGradient(Color.black, Color.clear)))
                            )
                        .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 8)
                                    .offset(x: -2, y: -2)
                                    .mask(RoundedRectangle(cornerRadius: 11).fill(LinearGradient(Color.clear, Color.black)))
                            )
                        .overlay(
                            RoundedRectangle(cornerRadius: 11)
                                .stroke(Color.gray, lineWidth: 0.1)
                        )
                        
                )
                .padding(.vertical, 5)
    }
}


extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
