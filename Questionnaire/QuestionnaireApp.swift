//
//  QuestionnaireApp.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import SwiftUI

@main
struct QuestionnaireApp: App {
    
    var body: some Scene {
        DocumentGroup (newDocument: { QuestionnaireViewController() }) { config in
            QuestionnaireHomeView(questionnaireVC: config.document)
        }
        
    }
        
}
