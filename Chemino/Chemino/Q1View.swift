//
//  Q1View.swift
//  Chemino
//
//  Created by Irmak Atılgan on 26.02.2023.
//

import SwiftUI
    let options = ["propane", "butane", "tetrane", "quatrane"]

struct Q1View: View {
    //this is where I'm putting all the navigation variables to refer to later
    @State var correctGo = false
    @State var levelsGo = false
    @State var wrongGo = false
    @State var Q2go = false
    @State var hintViewGo = false
    
    var body: some View {
       VStack {
            ZStack { //bar at the top
                Rectangle()
                    .fill(Color("bar color"))
                    .frame(maxWidth: .infinity, maxHeight: 80)
                Text("Level 1 - Alkanes")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 30.0)
                    .font(.custom("Verdana", fixedSize: 30))
                    .frame(height: 80.0)
            }
            .ignoresSafeArea()
           
           Text("Name the molecule") //prompt
               .font(.custom("Verdana", fixedSize: 20))
               .padding(.vertical, 15.0)
               .multilineTextAlignment(.center)
           
           Image("Q1 photo")
               .resizable(resizingMode: .stretch)
               .aspectRatio(contentMode: .fit)
               .padding(.bottom, 30.0)
               .frame(width: 354.0, height: 200.0)
           
           //the following ZStacks are multiple choice options
           ZStack {
               RoundedRectangle(cornerRadius: 20)
                   .padding(.horizontal, 15.0)
                   .foregroundColor(Color("optionsCL"))
                   .frame(width: 313.0, height: 89.0)
               Text(options[0])
                   .foregroundColor(Color.white)
                   .font(.custom("Verdana", fixedSize: 30))
           }
           .padding(.bottom, 10.0)
/*
           .onTapGesture {
               wrongGo.toggle()
           }
           NavigationLink("", destination: Q1wrongView(), isActive: $wrongGo)
*/
            
           ZStack {
               RoundedRectangle(cornerRadius: 20)
                   .padding(.horizontal, 15.0)
                   .foregroundColor(Color("optionsCL"))
                   .frame(width: 313.0, height: 89.0)

               Text(options[1])
                   .foregroundColor(Color.white)
                   .font(.custom("Verdana", fixedSize: 30))
           }
           .padding(.bottom, 10.0)

            .onTapGesture {
               correctGo.toggle()
           }
           NavigationLink("", destination: Q1Correct(), isActive: $correctGo)

           
           ZStack {
               RoundedRectangle(cornerRadius: 20)
                   .padding(.horizontal, 15.0)
                   .foregroundColor(Color("optionsCL"))
                   .frame(width: 313.0, height: 89.0)
               Text(options[2])
                   .foregroundColor(Color.white)
                   .font(.custom("Verdana", fixedSize: 30))

           }
           .padding(.bottom, 10.0)
/*
           .onTapGesture {
               wrongGo.toggle()
           }
           NavigationLink("", destination: Q1wrongView(), isActive: $wrongGo)
*/
 
           ZStack {
               RoundedRectangle(cornerRadius: 20)
                   .padding(.horizontal, 15.0)
                   .foregroundColor(Color("optionsCL"))
                   .frame(width: 313.0, height: 89.0)
               Text(options[3])
                   .foregroundColor(Color.white)
                   .font(.custom("Verdana", fixedSize: 30))

           }
           .padding(.bottom, 25.0)
/*
           .onTapGesture {
               wrongGo.toggle()
           }
           NavigationLink("", destination: Q1wrongView(), isActive: $wrongGo)
*/
           
           //this is the bar at the bottom of the screen

           ZStack {
               Rectangle()
                   .fill(Color("bar color"))
                   .frame(maxWidth: .infinity, maxHeight: 60)
               HStack {
                   Text ("< back")
                       .foregroundColor(Color.white)
                       .font(.custom("Verdana", fixedSize: 30))
                       .multilineTextAlignment(.leading)
                       .padding(.trailing, 10.0)
                       .onTapGesture {
                           levelsGo.toggle()
                       }
                       NavigationLink("", destination: LevelsView(), isActive: $levelsGo)

                   ZStack {
                       RoundedRectangle(cornerRadius: 10)
                           .foregroundColor(Color("optionsCL"))
                           .frame(width: 68, height: 33)
                       Text("hint")
                           .foregroundColor(Color.white)
                           .font(.custom("Verdana", fixedSize: 30))
                          .onTapGesture {
                               hintViewGo.toggle()
                           }
                           NavigationLink("", destination: HintView(), isActive: $hintViewGo)

                   }
                   .padding(.horizontal, 15.0)
                   Text("skip >")
                       .foregroundColor(Color.white)
                       .font(.custom("Verdana", fixedSize: 30))
                       .multilineTextAlignment(.trailing)
                       .padding(.leading, 10.0)
   
                       .onTapGesture {
                           Q2go.toggle()
                       }
                       NavigationLink("", destination: Q2View(), isActive: $Q2go)

               }
               .frame(maxWidth: .infinity, maxHeight: 60)
               .ignoresSafeArea()
            
            }
           .navigationBarBackButtonHidden(true)

       }
       .frame(width: .infinity, height: .infinity)
       .ignoresSafeArea()
}
}


struct Q1View_Previews: PreviewProvider {
    static var previews: some View {
        Q1View()
            
    }
}

