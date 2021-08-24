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
    var screenWidth = UIScreen.main.bounds.width
    @State var startingOffset: CGFloat = 0
    @State var yOffset: CGFloat = 0
    @State var topViewHeight: CGFloat = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack(spacing: 35) {
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
                }
                .offset(y: yOffset > 0 ? yOffset <= 120 ? -yOffset : -120 : 0)
                .zIndex(1)
                .padding(.bottom, yOffset > 0 ? yOffset <= 120 ? -yOffset : -120 : 0)
                .overlay(
                    GeometryReader { reader -> Color in
                        let height = reader.frame(in: .global).height
                        if topViewHeight == 0 {
                            DispatchQueue.main.async {
                                topViewHeight = height
                            }
                        }
                        return Color.clear
                    }
                    , alignment: .top
                )
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                .background(Color.white)
                .ignoresSafeArea(.all, edges: .top)
                
                GeometryReader { reader in
                    HStack {
                        // first tab
                        ScrollView(.vertical, showsIndicators: false, content: {
                            VStack(spacing: 20) {
                                ForEach(0 ..< 5) { item in
                                    AppsView(title: "Para você")
                                        .frame(width: screenWidth)
                                }
                            }
                            .padding(.vertical)
                            .overlay(
                                GeometryReader { reader -> Color in
                                    let minY = reader.frame(in: .global).minY
                                    if startingOffset == 0 {
                                        DispatchQueue.main.async {
                                            startingOffset = minY
                                        }
                                    }
                                    
                                    DispatchQueue.main.async {
                                        yOffset = startingOffset + topViewHeight - minY
                                    }
                                    
                                    return Color.clear
                                }
                                , alignment: .top
                            )
                            .padding(.top, topViewHeight)
                        })
                        
                        ForEach(1 ..< tabItems.count) { i in
                            Text(tabItems[i].title)
                                .frame(width: screenWidth)
                        }
                    }
                    .offset(x: -CGFloat(selectedIndex) * screenWidth)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct AppsView: View {
    var title: String
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(title)
                    .font(.title2)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 21))
                        .foregroundColor(.primary)
                })
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(apps) { app in
                        NavigationLink(
                            destination: AppDetailsView(app: app),
                            label: {
                                VStack(alignment: .leading) {
                                    Image(app.icon)
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(8)
                                    
                                    Text(app.name)
                                        .font(.title3)
                                        .lineLimit(1)
                                    
                                    Text(app.publisher)
                                        .lineLimit(1)
                                }
                                .foregroundColor(.primary)
                                .frame(width: 120)
                            })
                    }
                }
                .padding(.horizontal)
            }
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
