//
//  NeumorphTestApp.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

@main
struct NeumorphTestApp: App {
    var body: some Scene {
        WindowGroup {
            WorkoutsView()
                .environmentObject(Workouts.init(workouts: []))
                .environmentObject(RealmManager())
        }
    }
}
