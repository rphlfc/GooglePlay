//
//  TabItem.swift
//  GooglePlay
//
//  Created by Raphael Cerqueira on 25/07/21.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID().uuidString
    let title: String
}

let tabItems = [
    TabItem(title: "Para você"),
    TabItem(title: "Em alta"),
    TabItem(title: "Crianças"),
    TabItem(title: "Eventos"),
    TabItem(title: "Premium"),
    TabItem(title: "Categorias"),
    TabItem(title: "Escolha do editor")
]
