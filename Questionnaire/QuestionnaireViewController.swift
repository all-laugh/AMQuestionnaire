//
//  QuestionnaireViewController.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static let amq = UTType(exportedAs: "ninja.xquan.amq")
}


class QuestionnaireViewController: ReferenceFileDocument {
    static var readableContentTypes = [UTType.amq]
    static var writeableContentTypes = [UTType.amq]
    
    // MARK: - ReferenceFileDocument
    required init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            questionnaireModel = try Questionnaire(json: data)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }
    
    func snapshot(contentType: UTType) throws -> Data {
        try questionnaireModel.json()
    }
    
    func fileWrapper(snapshot: Data, configuration: WriteConfiguration) throws -> FileWrapper {
        FileWrapper(regularFileWithContents: snapshot)
    }
    
    
    @Published var questionnaireModel: Questionnaire
    
//    init(id: Int) {
//        self.questionnaireModel = Questionnaire(id: id)
//    }
    init() {
        self.questionnaireModel = Questionnaire()
    }
    
    func answerBQ1(with answer: BQ1Answer, undoManager: UndoManager?) {
        undoablyPerform(operation: "Answer BQ1", with: undoManager) {
            questionnaireModel.bq1Answer = answer
        }
    }
    
    func answerBQ2(with answer: BQ2Answer, undoManager: UndoManager?) {
        undoablyPerform(operation: "Answer BQ2", with: undoManager) {
            questionnaireModel.bq2Answer = answer
        }
    }
    
    func answerBQ3(with answer: BQ3Answer, undoManager: UndoManager?) {
        undoablyPerform(operation: "Answer BQ3", with: undoManager) {
            questionnaireModel.bq3Answer = answer
        }
    }
    
    func answerCQ1(with answer: ScaledResponse, undoManager: UndoManager?) {
        undoablyPerform(operation: "Answer CQ1",with: undoManager) {
            questionnaireModel.cq1Answer = answer
        }
    }
    
    func answerCQ2(with answer: CQ2Answer, undoManager: UndoManager?) {
        undoablyPerform(operation: "Answer CQ2", with: undoManager) {
            questionnaireModel.cq2Answer = answer
        }
    }
    
    func answerCQ3(with answer: String, undoManager: UndoManager?) {
        undoablyPerform(operation: "Answer CQ3", with: undoManager) {
            questionnaireModel.cq3Answer = answer
        }
    }
    
    func getMood(audioStimuli: AudioStimuli, index: Int) -> Bool {
        let questionRow = index / 6
        let questionResponse = index % 6
        let moods: PanasQuestionnaire!
        
        switch audioStimuli {
        case .noiseCancellation:
            moods = questionnaireModel.mood1
            
        case .ncPlusMusic:
            moods = questionnaireModel.mood2
            
        case .ncPlusAugmentation:
            moods = questionnaireModel.mood3
            
        case .ncPlusMusicPlusAugmentation:
            moods = questionnaireModel.mood4
            
        }
        
        switch questionRow {
        case 1:
            return moods.interested == ScaledResponse(rawValue: questionResponse)
        case 2:
            return moods.distressed == ScaledResponse(rawValue: questionResponse)
        case 3:
            return moods.excited == ScaledResponse(rawValue: questionResponse)
        case 4:
            return moods.upset == ScaledResponse(rawValue: questionResponse)
        case 5:
            return moods.strong == ScaledResponse(rawValue: questionResponse)
        case 6:
            return moods.guilty == ScaledResponse(rawValue: questionResponse)
        case 7:
            return moods.scared == ScaledResponse(rawValue: questionResponse)
        case 8:
            return moods.hostile == ScaledResponse(rawValue: questionResponse)
        case 9:
            return moods.enthusiastic == ScaledResponse(rawValue: questionResponse)
        case 10:
            return moods.proud == ScaledResponse(rawValue: questionResponse)
        case 11:
            return moods.irritable == ScaledResponse(rawValue: questionResponse)
        case 12:
            return moods.alert == ScaledResponse(rawValue: questionResponse)
        case 13:
            return moods.ashamed == ScaledResponse(rawValue: questionResponse)
        case 14:
            return moods.inspired == ScaledResponse(rawValue: questionResponse)
        case 15:
            return moods.nervous == ScaledResponse(rawValue: questionResponse)
        case 16:
            return moods.determined == ScaledResponse(rawValue: questionResponse)
        case 17:
            return moods.attentive == ScaledResponse(rawValue: questionResponse)
        case 18:
            return moods.jittery == ScaledResponse(rawValue: questionResponse)
        case 19:
            return moods.active == ScaledResponse(rawValue: questionResponse)
        case 20:
            return moods.afraid == ScaledResponse(rawValue: questionResponse)
        default:
            break
        }
        
        return false
    }
    
    func setMood(audioStimuli: AudioStimuli, index: Int, undoManager: UndoManager?) {
        let questionRow = index / 6
        let questionResponse = index % 6
        
        var moodToFill: PanasQuestionnaire!
        
        switch audioStimuli {
        case .noiseCancellation:
            moodToFill = questionnaireModel.mood1
            
        case .ncPlusMusic:
            moodToFill = questionnaireModel.mood2
            
        case .ncPlusAugmentation:
            moodToFill = questionnaireModel.mood3
            
        case .ncPlusMusicPlusAugmentation:
            moodToFill = questionnaireModel.mood4
            
        }
        
        switch questionRow {
        case 1:
            moodToFill.interested = ScaledResponse(rawValue: questionResponse)
        case 2:
            moodToFill.distressed = ScaledResponse(rawValue: questionResponse)
        case 3:
            moodToFill.excited = ScaledResponse(rawValue: questionResponse)
        case 4:
            moodToFill.upset = ScaledResponse(rawValue: questionResponse)
        case 5:
            moodToFill.strong = ScaledResponse(rawValue: questionResponse)
        case 6:
            moodToFill.guilty = ScaledResponse(rawValue: questionResponse)
        case 7:
            moodToFill.scared = ScaledResponse(rawValue: questionResponse)
        case 8:
            moodToFill.hostile = ScaledResponse(rawValue: questionResponse)
        case 9:
            moodToFill.enthusiastic = ScaledResponse(rawValue: questionResponse)
        case 10:
            moodToFill.proud = ScaledResponse(rawValue: questionResponse)
        case 11:
            moodToFill.irritable = ScaledResponse(rawValue: questionResponse)
        case 12:
            moodToFill.alert = ScaledResponse(rawValue: questionResponse)
        case 13:
            moodToFill.ashamed = ScaledResponse(rawValue: questionResponse)
        case 14:
            moodToFill.inspired = ScaledResponse(rawValue: questionResponse)
        case 15:
            moodToFill.nervous = ScaledResponse(rawValue: questionResponse)
        case 16:
            moodToFill.determined = ScaledResponse(rawValue: questionResponse)
        case 17:
            moodToFill.attentive = ScaledResponse(rawValue: questionResponse)
        case 18:
            moodToFill.jittery = ScaledResponse(rawValue: questionResponse)
        case 19:
            moodToFill.active = ScaledResponse(rawValue: questionResponse)
        case 20:
            moodToFill.afraid = ScaledResponse(rawValue: questionResponse)
        default:
            break
        }
        
        print("Question: \(questionRow)")
        print("Response: \(questionResponse)")
        
        undoablyPerform(operation: "Set Mood", with: undoManager) {
            switch audioStimuli {
            case .noiseCancellation:
                questionnaireModel.mood1 = moodToFill
                
            case .ncPlusMusic:
                questionnaireModel.mood2 = moodToFill
                
            case .ncPlusAugmentation:
                questionnaireModel.mood3 = moodToFill
                
            case .ncPlusMusicPlusAugmentation:
                questionnaireModel.mood4 = moodToFill
            }
        }
    }
    
    // MARK: - Undo
    private func undoablyPerform(operation: String, with undoManager: UndoManager? = nil, doit: () -> Void) {
        let prevState = questionnaireModel
        doit()
        print("Undoably Performed \(operation)")
        print("UndoManager == nil?:  \(undoManager == nil)")
        undoManager?.registerUndo(withTarget: self) { myself in
            myself.undoablyPerform(operation: operation, with: undoManager) {
                myself.questionnaireModel = prevState
            }
        }
        undoManager?.setActionName(operation)
    }
    
}
