//
//  SettingModel.swift
//  iOS12-HW15-Mikhailova Olga
//
//  Created by mbpro2.0/16/512 on 12.02.2024.
//

import Foundation

enum AddsType {
    case standartType
    case switchType
    case wordType
    case numberType
}

enum Colors {
    case orange
    case blue
    case green
    case red
    case gray
    case purple
}

enum Image {
    case named
    case systemName
}

struct Settings {
    
    var icon: String
    var setting: String
    var adds: AddsType
    var color: Colors
    var image: Image
}

extension Settings {
    static var arrayOfSettings: [[Settings]] = [
        
        [Settings(icon: "airplane", setting: "Авиарежим", adds: .switchType, color: .orange, image: .systemName),
         Settings(icon: "wifi", setting: "Wi-Fi", adds: .wordType, color: .blue, image: .systemName),
         Settings(icon: "bluetooth", setting: "Bluetooth", adds: .wordType, color: .blue, image: .named),
         Settings(icon: "antenna.radiowaves.left.and.right", setting: "Сотовая связь", adds: .standartType, color: .green, image: .systemName),
         Settings(icon: "personalhotspot", setting: "Режим модема", adds: .standartType, color: .green, image: .systemName),
         Settings(icon: "vpn", setting: "VPN", adds: .switchType, color: .blue, image: .named)],
        
        [Settings(icon: "arrow.rectanglepath", setting: "Уведомления", adds: .standartType, color: .red, image: .systemName),
         Settings(icon: "speaker.wave.3.fill", setting: "Звуки, тактильные сигналы", adds: .standartType, color: .red, image: .systemName),
         Settings(icon: "moon.fill", setting: "Не беспокоить", adds: .standartType, color: .purple, image: .systemName),
         Settings(icon: "hourglass", setting: "Экранное время", adds: .standartType, color: .purple, image: .systemName)],
        
        [Settings(icon: "gearshape", setting: "Основные", adds: .numberType, color: .gray, image: .systemName),
         Settings(icon: "slider.horizontal.2.square.on.square", setting: "Пункт управления", adds: .standartType, color: .gray, image: .systemName),
         Settings(icon: "textformat.size", setting: "Экран и яркость", adds: .standartType, color: .blue, image: .systemName),
         Settings(icon: "square.grid.3x3.middle.filled", setting: "Экран домой", adds: .standartType, color: .blue, image: .systemName)]
    ]
}


