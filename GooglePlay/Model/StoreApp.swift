//
//  App.swift
//  GooglePlay
//
//  Created by Raphael Cerqueira on 06/08/21.
//

import SwiftUI

struct StoreApp: Identifiable {
    let id = UUID().uuidString
    let icon: String
    let name: String
    let publisher: String
}

let apps = [
    StoreApp(icon: "item0", name: "TikTok", publisher: "TikTok Pte. Ltd."),
    StoreApp(icon: "item1", name: "iFood Delivery de Comida", publisher: "iFood Delivery de Comida"),
    StoreApp(icon: "item2", name: "Uber - Peça uma viagem", publisher: "Uber Technologies, Inc"),
    StoreApp(icon: "item3", name: "Nubank: Conta, Cartão de crédito e muito mais", publisher: "Nu"),
    StoreApp(icon: "item4", name: "PicPay: Pagamentos, Transferências, Pix e conta", publisher: "PicPay"),
    StoreApp(icon: "item5", name: "Kwai - Assista, Crie e Compartilhe Vídeos", publisher: "KWAI")
]
