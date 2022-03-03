//
//  PANASView.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import SwiftUI

struct PANASView: View {
    @EnvironmentObject var questionnaireVC: QuestionnaireViewController
    var audioStimuli: AudioStimuli
    
    var body: some View {
        let columns: [GridItem] =
                Array(repeating: .init(.flexible()), count: 6)
        ScrollView {
            // Title
            Text(audioStimuli.rawValue)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            LazyVGrid(columns: columns) {
                ForEach((0...125), id: \.self) { count in
                    switch count {
                    case 0:
                        Text("")
                            .frame(width: 50)
                    case 1:
                        Text(ScaledResponse.verySlightlyOrNotAtAll.string)
                    case 2:
                        Text(ScaledResponse.aLittle.string)
                    case 3:
                        Text(ScaledResponse.moderately.string)
                    case 4:
                        Text(ScaledResponse.quiteABit.string)
                    case 5:
                        Text(ScaledResponse.extremely.string)
                    case 6:
                        Text("Interested")
                            .bottom()
                    case 12:
                        Text("Distressed")
                            .bottom()
                    case 18:
                        Text("Excited")
                            .bottom()
                    case 24:
                        Text("Upset")
                            .bottom()
                    case 30:
                        Text("Strong")
                            .bottom()
                    case 36:
                        Text("Guilty")
                            .bottom()
                    case 42:
                        Text("Scared")
                            .bottom()
                    case 48:
                        Text("Hostile")
                            .bottom()
                    case 54:
                        Text("Enthusiastic")
                            .bottom()
                    case 60:
                        Text("Proud")
                            .bottom()
                    case 66:
                        Text("Irritable")
                            .bottom()
                    case 72:
                        Text("Alert")
                            .bottom()
                    case 78:
                        Text("Ashamed")
                            .bottom()
                    case 84:
                        Text("Inspired")
                            .bottom()
                    case 90:
                        Text("Nervous")
                            .bottom()
                    case 96:
                        Text("Determined")
                            .bottom()
                    case 102:
                        Text("Attentive")
                            .bottom()
                    case 108:
                        Text("Jittery")
                            .bottom()
                    case 114:
                        Text("Active")
                            .bottom()
                    case 120:
                        Text("Afraid")
                            .bottom()
                        
                    default:
                        Button {
                            questionnaireVC.setMood(audioStimuli:audioStimuli, index: count)
                        } label: {
                            VStack {
                                Spacer()
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 38, height: 38)
                                    .opacity(questionnaireVC.getMood(audioStimuli: audioStimuli, index: count) ? 1 : 0)
                                Spacer()
                                Divider()
                            }
                            
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .multilineTextAlignment(.center)
        .font(.title2)
        .foregroundColor(.primary)
        .padding(.horizontal, 50)
    }
}

struct PANASView_Previews: PreviewProvider {
    static var previews: some View {
        PANASView(audioStimuli: .ncPlusMusicPlusAugmentation)
    }
}
