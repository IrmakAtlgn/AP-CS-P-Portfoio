//
//  Q1Correct.swift
//  Chemino
//
//  Created by Irmak Atılgan on 16.03.2023.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.white)
            .foregroundColor(.black)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct Q1Correct: View {
    @State var Q2go = false

    var body: some View {
        ZStack {
        
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
                .padding(.bottom, 10.0)
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

             //CORRECT OPTION
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

  
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .padding(.horizontal, 15.0)
                    .foregroundColor(Color("optionsCL"))
                    .frame(width: 313.0, height: 89.0)
                Text(options[3])
                    .foregroundColor(Color.white)
                    .font(.custom("Verdana", fixedSize: 30))

            }
            .padding(.bottom, 10.0)
            
            //this is the bar at the bottom of the screen

            ZStack {
                Rectangle()
                    .fill(Color("bar color"))
                    .frame(maxWidth: .infinity, maxHeight: 90)
                HStack {
                    Text ("< back")
                        .foregroundColor(Color.white)
                        .font(.custom("Verdana", fixedSize: 30))
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 10.0)

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("optionsCL"))
                            .frame(width: 68, height: 33)
                        Text("hint")
                            .foregroundColor(Color.white)
                            .font(.custom("Verdana", fixedSize: 30))

                    }
                    .padding(.horizontal, 15.0)
                    Text("skip >")
                        .foregroundColor(Color.white)
                        .font(.custom("Verdana", fixedSize: 30))
                        .multilineTextAlignment(.trailing)
                        .padding(.leading, 10.0)
    /*
                        .onTapGesture {
                            Q2go.toggle()
                        }
                        NavigationLink("", destination: Q2View(), isActive: $Q2go)
    */
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                .padding(.top, 3.0)
                .ignoresSafeArea()
             
             }
             .navigationBarBackButtonHidden(true)
            .padding(.bottom, 75.0)
            
        }
            Rectangle()
                .fill(Color(hue: 1.0, saturation: 0.016, brightness: 0.281, opacity: 0.8))
                .frame(width: .infinity, height: .infinity)
                .ignoresSafeArea()
            //this iss the correct writing
            VStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("correct"))
                        .frame(width: 368, height: 144)
                    Text("butane")
                        .foregroundColor(.white)
                        .font(.custom("Verdana", fixedSize: 50))
                }
                NavigationLink("next question -->", destination: Q2View(), isActive: $Q2go)
                .buttonStyle(GrowingButton())
            }
}
 }
 }

struct Q1Correct_Previews: PreviewProvider {
    static var previews: some View {
        Q1Correct()
    }
}
