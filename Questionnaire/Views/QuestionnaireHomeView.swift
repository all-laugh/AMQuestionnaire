//
//  HomeView.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import SwiftUI

struct QuestionnaireHomeView: View {
    @ObservedObject var questionnaireVC: QuestionnaireViewController
    
    var body: some View {
        NavigationView {
            List {
                Text("Questionnaire")
                .font(.largeTitle)
                .bold()
                .padding()
                .horizontalCentered()
                
//                Section {
                    NavigationLink(destination: BackgroundQuestionsView()) {
                        Text("Background")
                            .horizontalCentered()
                    }
                    .padding()
                    
                    NavigationLink(destination: PANASView(audioStimuli: .noiseCancellation)) {
                        Text("Mood Assessment 1")
                            .horizontalCentered()
                    }
                    .padding()
                    
                    NavigationLink(destination: PANASView(audioStimuli: .ncPlusMusic)) {
                        Text("Mood Assessment 2")
                            .horizontalCentered()
                    }
                    .padding()
                    
                    NavigationLink(destination: PANASView(audioStimuli: .ncPlusAugmentation)) {
                        Text("Mood Assessment 3")
                            .horizontalCentered()
                    }
                    .padding()
                    
                    NavigationLink(destination: PANASView(audioStimuli: .ncPlusMusicPlusAugmentation)) {
                        Text("Mood Assessment 4")
                            .horizontalCentered()
                    }
                    .padding()
                    
                    NavigationLink(destination: ConcludingQuestionsView()) {
                        Text("Concluding Questions")
                            .horizontalCentered()
                    }
                    .padding()
//                }
                
                Spacer()
            }
            .listStyle(.sidebar)
            .foregroundColor(.primary)
            .font(.largeTitle)
         
        }
        .environmentObject(questionnaireVC)
        .navigationViewStyle(.stack)
        
    }
}
