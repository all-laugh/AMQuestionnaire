//
//  QuestionnaireViewController.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import Foundation

class QuestionnaireViewController: ObservableObject {
    var questionnaireModel = Questionnaire()
    
    @Published var bq1Answer: BQ1Answer? 
    @Published var bq2Answer: BQ2Answer?
    @Published var bq3Answer: BQ3Answer?
    @Published var cq1Answer: ScaledResponse?
    @Published var cq2Answer: CQ2Answer?
    @Published var cq3Answer: String = ""
    
    @Published var mood1: PanasQuestionnaire = PanasQuestionnaire(audioStimuli: .noiseCancellation)
    @Published var mood2: PanasQuestionnaire = PanasQuestionnaire(audioStimuli: .ncPlusMusic)
    @Published var mood3: PanasQuestionnaire = PanasQuestionnaire(audioStimuli: .ncPlusAugmentation)
    @Published var mood4: PanasQuestionnaire = PanasQuestionnaire(audioStimuli: .ncPlusMusicPlusAugmentation)
    
    func answerBQ1(with answer: BQ1Answer) {
        bq1Answer = answer
        questionnaireModel.bq1Answer = answer
    }
    
    func answerBQ2(with answer: BQ2Answer) {
        bq2Answer = answer
        questionnaireModel.bq2Answer = answer
    }
    
    func answerBQ3(with answer: BQ3Answer) {
        bq3Answer = answer
        questionnaireModel.bq3Answer = answer
    }
    
    func answerCQ1(with answer: ScaledResponse) {
        cq1Answer = answer
        questionnaireModel.cq1Answer = answer
    }
    
    func answerCQ2(with answer: CQ2Answer) {
        cq2Answer = answer
        questionnaireModel.cq2Answer = answer
    }
    
    func answerCQ3(with answer: String) {
        questionnaireModel.cq3Answer = answer
    }
    
    func getMood(audioStimuli: AudioStimuli, index: Int) -> Bool {
        let questionRow = index / 6
        let questionResponse = index % 6
        let moods: PanasQuestionnaire!
        
        switch audioStimuli {
        case .noiseCancellation:
            moods = mood1
        case .ncPlusMusic:
            moods = mood2
        case .ncPlusAugmentation:
            moods = mood3
        case .ncPlusMusicPlusAugmentation:
            moods = mood4
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
    
    func setMood(audioStimuli: AudioStimuli, index: Int) {
        let questionRow = index / 6
        let questionResponse = index % 6
        
        var moodToFill: PanasQuestionnaire!
        
        switch audioStimuli {
        case .noiseCancellation:
            moodToFill = mood1
        case .ncPlusMusic:
            moodToFill = mood2
        case .ncPlusAugmentation:
            moodToFill = mood3
        case .ncPlusMusicPlusAugmentation:
            moodToFill = mood4
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
        
        switch audioStimuli {
        case .noiseCancellation:
            self.mood1 = moodToFill
            questionnaireModel.mood1 = self.mood1
            
        case .ncPlusMusic:
            self.mood2 = moodToFill
            questionnaireModel.mood2 = self.mood2
            
        case .ncPlusAugmentation:
            self.mood3 = moodToFill
            questionnaireModel.mood3 = self.mood3
            
        case .ncPlusMusicPlusAugmentation:
            self.mood4 = moodToFill
            questionnaireModel.mood4 = self.mood4
        }
    }
    
    
    
}
