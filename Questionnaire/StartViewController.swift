////
////  StartViewController.swift
////  Questionnaire
////
////  Created by Xiao Quan on 3/6/22.
////
//
//import Foundation
//
//class StartViewController: ObservableObject {
//    
//    @Published var savedQuestionnaires: [Questionnaire]? = []
//    
//    var questionnaireVC: QuestionnaireViewController {
//        QuestionnaireViewController(id: generateId())
//    }
//    
//    func generateId() -> Int {
//        let id = UserDefaults.standard.integer(forKey: "id") + 1
//        UserDefaults.standard.set(id, forKey: "id")
//        print("Generated ID: \(id)")
//        return id
//    }
//    
//}
