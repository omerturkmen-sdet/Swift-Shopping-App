//
//  DetailView.swift
//  Swift-Shopping-App
//
//  Created by ömer türkmen on 14.10.2023.
//

import SwiftUI

struct DetailView: View {
    
    var description = "adsadsadasdsaaaasdasfsdgfdhdsklfefklwergfeşfkqwerjerlkwnewfkjwkqldwekflwefnwelfelknfwefnlkewfnklwefnwefnwflnkwepflknwefnkwepfnkewfnlkewnlfkewnklfwenlkfwenlfkewnlfewnlkfelwnflkewfnlkewfnewnfwenfwenlfknlkwfnkweflnkwnkl"
    
    var title: String
    var cost: Int
    @State private var count = 1
    
    var body: some View {
        VStack (spacing: 5){
            Image("coach1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            
            DetailTitleView(title: title, cost: cost)
            
            HStack {
                DetailElaborationView()
                
                Spacer()
                
                OrderCountView(count: $count)
            }
            
            Text("Description")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Text(description)
                .padding()
            
            ProductDetailView()
            
            ProceedPaymentButton()
        }

        

        
    }
}

#Preview {
    DetailView(title: "Green Couch", cost: 350)
}

struct CostView: View {
    
    var cost: Int
    
    var body: some View {
        VStack {
            ZStack {
                skyBlue
                    .opacity(0.5)
                Text("$\(cost)")
            }
            .frame(width: 80, height: 30)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct DetailTitleView: View {
    
    var title: String
    var cost: Int

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            CostView(cost: cost)
                
        }
        .padding()
    }
}

struct DetailElaborationView: View {
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct OrderCountView: View {
    @Binding var count: Int
    
    var body: some View {
        HStack {
            Button {
                count = count + 1
            } label: {
                Image(systemName: "plus.rectangle")
                    
            }
            
            Text("\(count)")
            
            Button {
                if count != 0 {
                    count = count - 1
                }
            } label: {
                Image(systemName: "minus.square")
            }
            
        }
        .padding()
    }
}

struct ProductDetailView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Size")
                    .font(.title2)
                
                Spacer()
                
                Text("Color")
                    .font(.title2)
            }
            
            HStack {
                Text("Height: 135 cm")
                    .opacity(0.8)
                
                Spacer()
                
                Image(systemName: "circle.fill")
                    .foregroundStyle(.blue)
                Image(systemName: "circle.fill")
                    .foregroundStyle(.black)
                Image(systemName: "circle.fill")
                    .foregroundStyle(.green)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Width: 200 cm")
                .opacity(0.8)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Diameter: 105 cm")
                .opacity(0.8)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
    }
}

struct ProceedPaymentButton: View {
    var body: some View {
        Button {
            
        }label: {
            Text("Continue with Pay")
                .foregroundStyle(.white)
                .frame(width: 350, height: 50, alignment: .center)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
        }


    }
}
