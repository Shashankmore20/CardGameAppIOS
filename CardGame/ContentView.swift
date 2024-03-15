//
//  ContentView.swift
//  CardGame
//
//  Created by Shashank More on 09/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var PlayerCard = "card13"
    @State var CpuCard  = "card14"

    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State private var showAlert = false
    
    var body: some View {
        
        ZStack {
            Image("background-wood-grain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(PlayerCard)
                    Spacer()
                    Image(CpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .font(.system(size: 25))
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .font(.system(size: 25))
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("!!")
                            .bold(),
                        message: Text("It was a draw."),
                        dismissButton: .default(Text("OK"))
                    )
                }
    }
    
    func deal(){
        // Randmoize the player cards
        let PlayerCardValue = Int.random(in: 2...14)
        PlayerCard = "card" + String(PlayerCardValue)
        
        // Randomize the cpu cards
        let CpuCardValue = Int.random(in: 2...14)
        CpuCard = "card" + String(CpuCardValue)
        
        // set the player and cpu score
        if PlayerCardValue > CpuCardValue {
            playerScore += 1
        }
        else if CpuCardValue > PlayerCardValue {
            cpuScore += 1
        }
        else {
            showAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
