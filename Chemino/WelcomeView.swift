//
//  ContentView.swift
//  Chemino
//
//  Created by Irmak Atılgan on 26.02.2023.
//

import SwiftUI

struct WelcomeView: View {
    let exampleColor : Color = Color(red: 190/255, green: 172/255, blue: 240/255)
    @State var gotolevels = false
    @Binding var pointsCounter: Int
    
    var body: some View {
        NavigationView {

        VStack {
                Image("logo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 40.0)
                    .onTapGesture {
                        gotolevels = true
                                }
                Text("Chemino")
                    .font(.custom("Verdana-Bold", fixedSize: 40))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    
            NavigationLink("", destination: LevelsView(pointsCounter: pointsCounter), isActive: $gotolevels)

            } //end of VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(exampleColor)
        .edgesIgnoringSafeArea(.all)
        }//navigationView'un
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(pointsCounter: .constant(0))
            .previewInterfaceOrientation(.portrait)
    }
}
