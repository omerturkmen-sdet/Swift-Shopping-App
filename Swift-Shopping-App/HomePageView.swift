//
//  ContentView.swift
//  Swift-Shopping-App
//
//  Created by ömer türkmen on 14.10.2023.
//

import SwiftUI

let skyBlue = Color(hex: "#d7e8f8")

struct HomePageView: View {

    @State private var searchedItem = ""
    
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 2){
                HStack {
                    Text("Izmir Turkey")
                        .font(.title3)
                    Spacer()
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding()
                
                TitleView()
                
                HStack {
                    TextFieldImageView(searchedItem: $searchedItem)

                    CameraImageView()
                }
                .padding()
                
                MainImageView(imageName: "coach1")
                    .padding()
                    
                HStack {
                    Text("New Rivals")
                        .font(.title)
                    Spacer()
                    Image(systemName: "circle.grid.2x2.fill")
                }
                .padding()
                
                ScrollView (.horizontal){
                    HStack {
                        ForEach(MockData.coachs) { coach in
                            NavigationLink (value: coach) {
                                ScrollImageView(imageName: coach.imageName, title: coach.name, cost: coach.price)
                            }
                        }
                    }
                    .padding()
                }
                
                
//                NavigationStack {
//                    ScrollView {
//                        LazyVGrid (columns: viewModel.columns){
//                            ForEach(MockData.frameworks) { framework in
//                                NavigationLink(value: framework) {
//                                    FrameworkTitleView(framework: framework)
//                                }
//                            }
//                        }
//                    }
//                    .navigationTitle("🍎 Framework")
//                    .navigationDestination(for: Framework.self) { framework in
//                        FrameworkDetailView(framework: framework)
//                    }
//                }
//                .tint(.primary)
            }
            .navigationDestination(for: Coach.self) { couch in
                DetailView(title: couch.name, cost: couch.price)
            }
            .tint(.primary)
        }
        
    }
}

#Preview {
    HomePageView()
}

struct TitleView: View {
    var body: some View {
        Text("Find The Most Luxuriious Furniture")
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}


struct MainImageView: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: .infinity, height: 150)
    }
}

struct ScrollImageView: View {
    
    var imageName: String
    var title: String
    var cost: Int
    

    
    var body: some View {
        ZStack {
            Color(skyBlue)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 150, height: .infinity)
                
                VStack {
                    HStack {
                        Text(title)
                        Spacer()
                    }
                    Spacer()
                    
                    HStack {
                        VStack (spacing: 5){
                            Text("Home Depo")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("$\(cost)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                        }
                        .padding(.trailing)
                        
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }
                   
                }

                
            }
            .padding()
        }
        

    }
}

struct CameraImageView: View {
    var body: some View {
        ZStack {
            Color(skyBlue)
            Image(systemName: "camera.fill")
        }
        .frame(width: 50, height: 40)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in:CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
        (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .displayP3,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


struct TextFieldImageView: View {
    
    @Binding var searchedItem: String
    
    var body: some View {
        TextField(
            "Search For Furniture",
            text: $searchedItem
        )
        .font(.title3)
        .padding()
        .frame(width: .infinity, height: 40)
        .background(skyBlue)
        .border(.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
