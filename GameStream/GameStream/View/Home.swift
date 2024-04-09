//
//  Home.swift
//  GameStream
//
//  Created by Ruben on 8/4/24.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State private var tabSeleccionado: Int = 2
    
    var body: some View {
        TabView(selection: $tabSeleccionado) {
            
            Text("Pantalla PERFIL")
                .font(.title)
                .bold()
                .fontDesign(.rounded)
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }
                .tag(0)
            
            Text("Pantalla JUEGOS")
                .font(.title)
                .bold()
                .fontDesign(.rounded)
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Perfil")
                }
                .tag(1)
            
            HomeTab()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(2)

            Text("Pantalla FAVORITOS")
                .font(.title)
                .bold()
                .fontDesign(.rounded)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }
                .tag(3)
            
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
            UITabBar.appearance().unselectedItemTintColor = .gray
            UITabBar.appearance().isTranslucent = true
        }
        .tint(.white)
        
    }
}

struct HomeTab: View {
    
    @State var textoBusqueda = ""
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                
                LogoView()
                
                HStack {
                    
                    Button(action: buscarVideo, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(textoBusqueda.isEmpty ? Color(.yellow) : Color(.darkCian))
                    })
                    
                    ZStack(alignment: .leading) {
                        
                        if textoBusqueda.isEmpty {
                            Text("Buscar un video")
                                .foregroundStyle(.textoBusqueda)
                        }
                        
                        TextField("", text: $textoBusqueda)
                            .foregroundStyle(.white)
                        
                    }
                    
                }
                .padding([.top, .leading, .bottom], 11)
                .background(.blueGray)
                .clipShape(Capsule())
                
                ScrollView {
                    SubModuloHome()
                }
                
            }
            .padding(.horizontal, 18)
            
        }
        .navigationBarBackButtonHidden()
        
    }
    
    func buscarVideo() {
        print("Se va a buscar \(textoBusqueda)")
    }
    
}

struct SubModuloHome: View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View {
        
        VStack {
            
            Text("Los más populares")
                .textCase(.uppercase)
                .font(.title3)
                .foregroundStyle(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack {
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                },
                       label: {
                    VStack(spacing: 0) {
                        Image("thewitcher3")
                            .resizable()
                            .scaledToFit()
                        
                        Text("The Witcher 3")
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.white)
                    }
                })
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 42, height: 42)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
            
            Text("Categorías sugeridas para ti")
                .textCase(.uppercase)
                .font(.title3)
                .foregroundStyle(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
            
                    Button(action: {print("fps category pressed")}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.blueGray)
                                .frame(width: 160, height: 90)
                            Image("fps")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    })
                    
                    Button(action: {print("open world category pressed")}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.blueGray)
                                .frame(width: 160, height: 90)
                            Image("open-world")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    })
                    
                    Button(action: {print("rpg category pressed")}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.blueGray)
                                .frame(width: 160, height: 90)
                            Image("rpg")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    })
                    
                }
            }
            
            Text("Recomendados para ti")
                .textCase(.uppercase)
                .font(.title3)
                .foregroundStyle(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {
                        url = urlVideos[1]
                        print("URL: \(url)")
                        isPlayerActive = true
                    },
                           label: {
                        Image("abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    Button(action: {
                        url = urlVideos[2]
                        print("URL: \(url)")
                        isPlayerActive = true
                    },
                           label: {
                        Image("crash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    Button(action: {
                        url = urlVideos[3]
                        print("URL: \(url)")
                        isPlayerActive = true
                    },
                           label: {
                        Image("ds")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                }
            }
            
            Text("Videos que podrían gustarte")
                .textCase(.uppercase)
                .font(.title3)
                .foregroundStyle(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {
                        url = urlVideos[4]
                        print("URL: \(url)")
                        isPlayerActive = true
                    },
                           label: {
                        Image("tlu2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    })
                    Button(action: {
                        url = urlVideos[5]
                        print("URL: \(url)")
                        isPlayerActive = true
                    },
                           label: {
                        Image("d2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    })
                }
            }
            
        }
        
        NavigationLink(
            destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                .frame(width: 400, height: 300),
            isActive: $isPlayerActive,
            label: {
                EmptyView()
            }
            
        )
        
    }
}

#Preview {
    Home()
}
