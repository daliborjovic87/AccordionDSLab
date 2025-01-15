//
//  RightSide.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 1. 2025..
//

import SwiftUI

struct TapRightSide: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BackgroundOverlay(geo: geo)
                
                VStack(spacing: 20) {
                    
                    Image("RightHandSide")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width, height: geo.size.height / 2)
                        .padding(.top, 60)
                    
                  
                    ScrollView {
                        Text("Desna strana harmonike je nepokretna stana instrumenta, vezana kaisima za ramena i telo izvodjaca, kako bi imala stabilan polozaj na grudima tokom sviranja, kada izvodjac levom rukom otvara i zatvara meh. Desna strana je namenjena sviraju desnom rukom izvodjaca i na toj strani harmonike je integrisano vise funkcionalnih celina, i to: \n\n• Desna klavijatura za sviranje desnom rukom, koja se nalazi na posebnom nosacu i obuhvata bele i crne dirke... \n• Desni polukorpus ili kuciste desne stane harmonike \n• Ploca klapni desne strane sa otvorima za strujanje vazduha \n• Faseni u desnom polukorpusu - rezonantne komore na koje su smesteni setovi plocica slobodnih jezicaka zaliveni specijalnim voskom \n•Mehanicki sistem desne strane koji sadrzi poluge dirki sa oprugama i klapnama \n• Registri desne strane za promenu tembra \n• Maska - poklopac klapni i zastita mehanickog sistema desne strane harmonike \n• Oprema desne strane koja podrazumeva kaiseve za drzanje intrumenta pri izvodjenju i kopce za fiksiranje u zatvorenom polozaju. \n\n Najveca razlika kod razlicitihv vrsta i modela koncertnih harmonika se nalazi upravo na desnoj strani, zbog razlicitih klavijatura, razlicitog broja i rasporeda glasova, ralicitog nacina stimovanja i razlicitog broja registara ")
                    }
                    .padding(.bottom, 10)
                }
            }
        }
        .ignoresSafeArea()
        
    
    }
}

#Preview {
    TapRightSide()
}

