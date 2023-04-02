//
//  LevelsView.swift
//  Chemino
//
//  Created by Irmak Atılgan on 26.02.2023.
//

import SwiftUI

struct LevelsView: View {
    @State var pointsCounter = 0
    @State var level1go = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("bar color"))
                .frame(maxWidth: .infinity, maxHeight: 80)
            Text("Points: \(pointsCounter)")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.top, 30.0)
                .font(.custom("Verdana", fixedSize: 30))
                .frame(height: 80.0)
        }
        .ignoresSafeArea()
        ScrollView {
            VStack {
                Image("Level4")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 200.0)
                
                Image("Level3")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 140.0)
                
                Image("Level2")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 160.0)
                
                Image("Level1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 110.0)
                    .onTapGesture {
                        level1go.toggle()
                    }
                NavigationLink("", destination: Q1View(pointsCounter: $pointsCounter), isActive: $level1go)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LevelsView()
        }
    }
}
