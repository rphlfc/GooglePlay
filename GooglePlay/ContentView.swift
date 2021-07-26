//
//  ContentView.swift
//  GooglePlay
//
//  Created by Raphael Cerqueira on 16/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var search = ""
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image(systemName: "magnifyingglass")
                
                TextField("Pesquisar apps e jogos", text: $search)
                
                Button(action: {}, label: {
                    Image(systemName: "mic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                        .foregroundColor(.primary)
                })
                
                Button(action: {}, label: {
                    Image("profile")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                })
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 0.5))
            .padding()
            
            CustomTabView(selectedIndex: $selectedIndex)
            
            TabView(selection: $selectedIndex) {
                ForEach(0 ..< tabItems.count) { i in
                    Text(tabItems[i].title)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer()
        }
    }
}

struct CustomTabView: View {
    var tabWidth: CGFloat = 120
    @State var xOffset: CGFloat = 0
    @State var currrentXOffset: CGFloat = 0
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    @Binding var selectedIndex: Int
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(0 ..< tabItems.count) { i in
                        VStack {
                            Text(tabItems[i].title)
                                .foregroundColor(selectedIndex == i ? Color("green") : Color.gray)
                                .font(.system(size: 15))
                            
                            ZStack {
                                if selectedIndex == i {
                                    Capsule()
                                        .frame(width: 60, height: 4)
                                        .foregroundColor(Color("green"))
                                        .matchedGeometryEffect(id: "capsule", in: namespace)
                                        .animation(.easeIn)
                                } else {
                                    Capsule()
                                        .frame(width: 60, height: 4)
                                        .foregroundColor(.clear)
                                }
                            }
                        }
                        .frame(width: tabWidth)
                        .onTapGesture {
                            withAnimation {
                                selectedIndex = i
                            }
                            
                            // center on tap
                            let aux = tabWidth * CGFloat(selectedIndex)
                            if aux > screenWidth / 2 {
                                if aux > CGFloat(tabItems.count) * tabWidth - (screenWidth / 2) - (tabWidth / 2) {
                                    withAnimation {
                                        xOffset = -(CGFloat(tabItems.count) * tabWidth) + screenWidth - 30
                                    }
                                } else {
                                    withAnimation {
                                        xOffset = -aux + (screenWidth / 2) - (tabWidth / 2) - 15
                                    }
                                }
                            } else {
                                withAnimation {
                                    xOffset = 0
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .offset(x: xOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            onChanged(value: value)
                        })
                        .onEnded({ value in
                            onEnded(value: value)
                        })
                )
            }
            .frame(height: 34)
            
            Divider()
        }
    }
    
    func onChanged(value: DragGesture.Value) {
        let aux = currrentXOffset + value.translation.width
        if value.translation.width < 0 { // right to left
            if aux < -(CGFloat(tabItems.count) * tabWidth) + screenWidth {
                xOffset = -(CGFloat(tabItems.count) * tabWidth) + screenWidth - 30 // max value for xOffset
            } else {
                xOffset = aux
            }
        } else if value.translation.width > 0 { // left to right
            if aux > 0 {
                xOffset = 0
            } else {
                xOffset = aux
            }
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        currrentXOffset = xOffset
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
