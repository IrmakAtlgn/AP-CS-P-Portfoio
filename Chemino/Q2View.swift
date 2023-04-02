//
//  Q2View.swift
//  Chemino
//
//  Created by Irmak Atılgan on 25.03.2023.
//

import SwiftUI
    let options2 = ["pentane","methane","ethane","hexane", "decane", "propane"]

struct Q2View: View {
    //this is where I'm putting all the navigation variables to refer to later
    @State var correctGo = false
    @State var levelsGo = false
    @State var wrongGo = false
    @State var Q2go = false
    @State var hintViewGo = false
    
    @Binding var pointsCounter: Int

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
           
           HStack {
               VStack(alignment: .leading){
                   Text(options2[0])
                       .font(.custom("Verdana", fixedSize: 25))
                       .padding(.vertical)

                   Text(options2[1])
                       .font(.custom("Verdana", fixedSize: 25))
                       .padding(.vertical)

                   Text(options2[2])
                       .font(.custom("Verdana", fixedSize: 25))
                       .padding(.vertical)


                   Text(options2[3])
                       .font(.custom("Verdana", fixedSize: 25))
                       .padding(.vertical)

                   Text(options2[4])
                       .font(.custom("Verdana", fixedSize: 25))
                       .padding(.vertical)

                   Text(options2[5])
                       .font(.custom("Verdana", fixedSize: 25))
                       .padding(.vertical)

               }
               Image("Q2 photo")
                   .resizable()
                   .frame(width: 213, height: 155)
           }
           
           Spacer()
           
           
           
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
                       NavigationLink("", destination: HintView(pointsCounter: $pointsCounter), isActive: $hintViewGo)

                   }
                   .padding(.horizontal, 15.0)
                   Text("skip >")
                       .foregroundColor(Color.white)
                       .font(.custom("Verdana", fixedSize: 30))
                       .multilineTextAlignment(.trailing)
                       .padding(.leading, 10.0)
   
/*                       .onTapGesture {
                           Q2go.toggle()
                       }
                       NavigationLink("", destination: Q2View(), isActive: $Q2go)
 */

               }
               .frame(maxWidth: .infinity, maxHeight: 60)
               //.padding(.top, 3.0)
               .ignoresSafeArea()
            
            }
            .navigationBarBackButtonHidden(true)
           
       }
       .ignoresSafeArea()
       .frame(width: .infinity, height: .infinity)
}
}

struct Q2View_Previews: PreviewProvider {
    @State static var pointsCounter = 0
    
    static var previews: some View {
        return Q2View(pointsCounter: $pointsCounter)
    }
}
