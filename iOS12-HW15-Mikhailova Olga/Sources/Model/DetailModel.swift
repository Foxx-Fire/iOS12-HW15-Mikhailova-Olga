//
//  DetailModel.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import Foundation

struct General {
    var setting: String
}

extension General {
    static var arrayGeneral: [[General]] = [
        [General(setting: "About"),
         General(setting: "Software Apdate")],
        [General(setting: "AirDrop"),
         General(setting: "Handoff"),
         General(setting: "CarPlay")],
        [General(setting: "iPhoneStorage"),
         General(setting: "Background App Refresh")
        ]
    ]
}
