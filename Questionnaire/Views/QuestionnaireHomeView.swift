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
        List {
            Text("Questionnaire")
            .font(.largeTitle)
            .bold()
            .padding()
            .horizontalCentered()
            
            Section {
                NavigationLink(destination: BackgroundQuestionsView()
                                .environmentObject(questionnaireVC)) {
                    Text("Background")
                        .horizontalCentered()
                }
                .padding()
                
                NavigationLink(destination: PANASView(audioStimuli: .noiseCancellation)
                                .environmentObject(questionnaireVC)) {
                    Text("Mood Assessment 1")
                        .horizontalCentered()
                }
                .padding()
                
                NavigationLink(destination: PANASView(audioStimuli: .ncPlusMusic)
                                .environmentObject(questionnaireVC)) {
                    Text("Mood Assessment 2")
                        .horizontalCentered()
                }
                .padding()
                
                NavigationLink(destination: PANASView(audioStimuli: .ncPlusAugmentation)
                                .environmentObject(questionnaireVC)) {
                    Text("Mood Assessment 3")
                        .horizontalCentered()
                }
                .padding()
                
                NavigationLink(destination: PANASView(audioStimuli: .ncPlusMusicPlusAugmentation)
                                .environmentObject(questionnaireVC)) {
                    Text("Mood Assessment 4")
                        .horizontalCentered()
                }
                .padding()
                
                NavigationLink(destination: ConcludingQuestionsView()
                                .environmentObject(questionnaireVC)) {
                    Text("Concluding Questions")
                        .horizontalCentered()
                }
                .padding()
            }

            
            Spacer()
        }
        .listStyle(.sidebar)
        .foregroundColor(.primary)
        .font(.largeTitle)
        .navigationViewStyle(.stack)
    }
}
