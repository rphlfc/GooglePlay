//
//  AppDetailsView.swift
//  GooglePlay
//
//  Created by Raphael Cerqueira on 23/08/21.
//

import SwiftUI
import HideableTopView

struct AppDetailsView: View {
    var app: StoreApp
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        HideableTopView {
            // hideable top view content goes here
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                    })
                    
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                    })
                }
                .font(.system(size: 21))
                .padding()
                
                Divider()
            }
        } content: {
            // main content goes here
            VStack(spacing: 25) {
                VStack {
                    HStack(spacing: 15) {
                        Image(app.icon)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            Text(app.name)
                                .font(.title)
                            
                            Text(app.publisher)
                        })
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal)
                }
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 15) {
                        VStack {
                            HStack {
                                Text("4.8")
                                
                                Image(systemName: "star.fill")
                            }
                            
                            Spacer(minLength: 0)
                            
                            Text("6 mi avaliaçoes")
                        }
                        
                        Divider()
                            .padding(.vertical)
                        
                        VStack {
                            Image(systemName: "arrow.down.square")
                            
                            Spacer(minLength: 0)
                            
                            Text("30 MB")
                        }
                        
                        Divider()
                            .padding(.vertical)
                        
                        VStack {
                            Text("L")
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                                .background(Color("green"))
                            
                            Spacer(minLength: 0)
                            
                            Text("Classificaçao livre")
                                .font(.system(size: 14))
                                .truncationMode(.middle)
                        }
                        
                        Divider()
                            .padding(.vertical)
                        
                        VStack {
                            Text("Mais de 50 mi")
                                .fontWeight(.bold)
                            
                            Spacer(minLength: 0)
                            
                            Text("downloads")
                        }
                    }
                    .padding(.horizontal)
                })
                .frame(height: 40)
                
                Button(action: {}, label: {
                    Text("Instalar")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color("green"))
                        .cornerRadius(8)
                        .padding(.horizontal)
                })
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 15) {
                        ForEach(1 ..< 6) { item in
                            Image("tiktok\(item)")
                        }
                    }
                    .padding(.horizontal)
                })
                
                VStack(spacing: 20) {
                    HStack {
                        Text("Sobre este app")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "arrow.right")
                        })
                    }
                    .foregroundColor(.primary)
                    
                    Text(app.description)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarHidden(true)
    }
}

struct AppDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppDetailsView(app: apps[0])
        }
    }
}
