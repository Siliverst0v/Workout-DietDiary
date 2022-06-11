//
//  BodyView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI

struct BodyView: View {
    @Binding var backIsVisible: Bool
    @Binding var chestIsVisible: Bool
    @Binding var bicepsIsVisible: Bool
    @Binding var tricepsIsVisible: Bool
    @Binding var absIsVisible: Bool
    @Binding var forearmsIsVisible: Bool
    @Binding var legsIsVisible: Bool
    @Binding var shouldersIsVisible: Bool
    @Binding var cardioIsVisible: Bool
    
    var body: some View {
        ZStack {
            Image("Body")
                .resizable()
            Image("BackBody")
                .resizable()
                .opacity(backIsVisible ? 1 : 0)
            Image("ChestBody")
                .resizable()
                .opacity(chestIsVisible ? 1 : 0)
            Image("BicepsBody")
                .resizable()
                .opacity(bicepsIsVisible ? 1 : 0)
            Image("TricepsBody")
                .resizable()
                .opacity(tricepsIsVisible ? 1 : 0)
            Image("AbsBody")
                .resizable()
                .opacity(absIsVisible ? 1 : 0)
            Image("ForeArmsBody")
                .resizable()
                .opacity(forearmsIsVisible ? 1 : 0)
            Image("LegsBody")
                .resizable()
                .opacity(legsIsVisible ? 1 : 0)
            Image("ShouldersBody")
                .resizable()
                .opacity(shouldersIsVisible ? 1 : 0)
            Image("CardioBody")
                .resizable()
                .opacity(cardioIsVisible ? 1 : 0)
        }
        .frame(width: UIScreen.main.bounds.size.width - 40, height: 314, alignment: .center)
        .padding(30)
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView(backIsVisible: .constant(false),
                 chestIsVisible: .constant(false),
                 bicepsIsVisible: .constant(false),
                 tricepsIsVisible: .constant(false),
                 absIsVisible: .constant(false),
                 forearmsIsVisible: .constant(false),
                 legsIsVisible: .constant(false),
                 shouldersIsVisible: .constant(false),
                 cardioIsVisible: .constant(false))
    }
}
