//
//  ConcludingQuestions.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import SwiftUI

struct ConcludingQuestionsView: View {
    
    @EnvironmentObject var questionnaireVC: QuestionnaireViewController
    
    var body: some View {
        ScrollView {
            // Title
            Text("Concluding Questions")
                .font(.largeTitle)
                .bold()
                .padding(100)
            
            // MARK: - CQ1
            VStack (alignment: .leading) {
                Text(ConcludingQuestions.q1.rawValue)
                    .font(.headline)
                    .padding()
                
                // 1 - 5 Scale
                HStack {
                    ForEach(ScaledResponse.allCases, id: \.self) { response in
                        HStack {
                            VStack {
                                Text(response.string)
                                Button {
                                    questionnaireVC.answerCQ1(with: response)
                                } label: {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .opacity(response == questionnaireVC.cq1Answer ? 1 : 0)
                                        .padding(.vertical, 20)
                                        .horizontalCentered()
                                }
                            }
                            Divider()
                                .offset(y: 20)
                        }
                        .padding(.bottom, 30)
                    }
                }
            }
            
            // MARK: - CQ2
            VStack (alignment: .leading) {
                Text(ConcludingQuestions.q2.rawValue)
                    .font(.headline)
                    .padding()
                
                ForEach(CQ2Answer.allCases, id: \.self) { answer in
                    
                    HStack {
                        Button(action: {
                            questionnaireVC.answerCQ2(with: answer)
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
                            .padding(.horizontal, 20)
                            .opacity(answer == questionnaireVC.cq2Answer ? 1 : 0)
                        
                        
                    }
                    .padding(.vertical, 5)
                    
                    Divider()
                }
                .foregroundColor(.primary)
                .padding(.horizontal, 30)
            }
            
            // MARK: - CQ3
            VStack (alignment: .leading) {
                Text(ConcludingQuestions.q3.rawValue)
                    .font(.headline)
                    .padding()
            
                TextEditor(text: $questionnaireVC.cq3Answer)
                    .frame(minHeight: 200)
                    .shadow(radius: 1)
                    .padding()
            }
        }
        .foregroundColor(.primary)
        .padding()
        .padding(.horizontal, 40)
    }
}
