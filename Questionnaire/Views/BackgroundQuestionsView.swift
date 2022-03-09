//
//  ContentView.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import SwiftUI

struct BackgroundQuestionsView: View {
    @EnvironmentObject var questionnaireVC: QuestionnaireViewController
    @Environment(\.undoManager) var undoManager
    
    var body: some View {
        ScrollView {
            // Title
            Text("Background Questions")
                .font(.largeTitle)
                .bold()
                .padding(100)
            
            // MARK: - BQ1
            VStack (alignment: .leading) {
                Text(BackgroundQuestions.q1.rawValue)
                    .font(.headline)
                    .padding()
                
                ForEach(BQ1Answer.allCases, id: \.self) { answer in
                    HStack {
                        Button(action: {
                            questionnaireVC.answerBQ1(with: answer, undoManager: undoManager)
                        }) {
                            HStack {
                                Text(answer.rawValue)
                                Spacer()
                            }
                        }
                        
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .opacity(answer == questionnaireVC.questionnaireModel.bq1Answer ? 1 : 0)
                    }
                    .padding(.vertical, 5)
                    Divider()
                    
                }
                .foregroundColor(.primary)
                .padding(.horizontal, 30)
            }
            
            // MARK: - BQ2
            VStack (alignment: .leading) {
                Text(BackgroundQuestions.q2.rawValue)
                    .font(.headline)
                    .padding()
                
                ForEach(BQ2Answer.allCases, id: \.self) { answer in
                    HStack {
                        Button(action: {
                            questionnaireVC.answerBQ2(with: answer, undoManager: undoManager)
                        }) {
                            HStack {
                                Text(answer.rawValue)
                                Spacer()
                            }
                        }
                        
                        Spacer()
                        
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .opacity(answer == questionnaireVC.questionnaireModel.bq2Answer ? 1 : 0)
                    }
                    .padding(.vertical, 5)
                    Divider()
                    
                }
                .foregroundColor(.primary)
                .padding(.horizontal, 30)
            }
            
            // MARK: - BQ3
            VStack (alignment: .leading) {
                Text(BackgroundQuestions.q3.rawValue)
                    .font(.headline)
                    .padding()
                
                ForEach(BQ3Answer.allCases, id: \.self) { answer in
                    HStack {
                        Button(action: {
                            questionnaireVC.answerBQ3(with: answer, undoManager: undoManager)
                        }) {
                            HStack {
                                Text(answer.rawValue)
                                Spacer()
                            }
                        }
                        
                        Spacer()
                        
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .opacity(answer == questionnaireVC.questionnaireModel.bq3Answer ? 1 : 0)
                    }
                    .padding(.vertical, 5)
                    Divider()
                    
                }
                .foregroundColor(.primary)
                .padding(.horizontal, 30)
            }
        }
        .padding(.horizontal, 50)
    }
}
