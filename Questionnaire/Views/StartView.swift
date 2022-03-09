////
////  StartView.swift
////  Questionnaire
////
////  Created by Xiao Quan on 3/6/22.
////
//
//import SwiftUI
//
//struct StartView: View {
//    var startVC = StartViewController()
//    
//    var body: some View {
//        NavigationView {
//            NavigationLink {
//                QuestionnaireHomeView()
//                    
//            } label: {
//                Text("Start New Questionnaire")
//                    .font(.largeTitle)
//                    .bold()
//            }
//
//        }
//        .navigationViewStyle(.stack)
//        .environmentObject(startVC.questionnaireVC)
//    }
//    
//
//    
//}
//
//struct StartView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartView()
//    }
//}
