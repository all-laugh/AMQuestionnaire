//
//  Questionnaire.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import Foundation
import UIKit

struct Questionnaire: Codable {
//    var bq1 = BackgroundQuestions.q1
//    var bq2 = BackgroundQuestions.q2
//    var bq3 = BackgroundQuestions.q3
//
    var mood1: PanasQuestionnaire = PanasQuestionnaire(audioStimuli: .noiseCancellation)
    var mood2: PanasQuestionnaire = PanasQuestionnaire(audioStimuli: .ncPlusMusic)
    var mood3: PanasQuestionnaire = PanasQuestionnaire(audioStimuli: .ncPlusAugmentation)
    var mood4: PanasQuestionnaire = PanasQuestionnaire(audioStimuli: .ncPlusMusicPlusAugmentation)
//
//    var cq1 = ConcludingQuestions.q1
//    var cq2 = ConcludingQuestions.q2
//    var cq3 = ConcludingQuestions.q3
    
    var bq1Answer: BQ1Answer?
    var bq2Answer: BQ2Answer?
    var bq3Answer: BQ3Answer?
    
    var cq1Answer: ScaledResponse?
    var cq2Answer: CQ2Answer?
    var cq3Answer: String = ""
}

enum BackgroundQuestions: String, CaseIterable, Codable {
    case q1 = "How often do you use noise-cancellation headphones?"
    case q2 = "What’s your primary purpose in using noise-cancellation headphones?"
    case q3 = "In what scenario are you most likely to use noise-cancellation headphones?"
}

enum BQ1Answer: String, CaseIterable, Codable {
    case zero = "0 times a week"
    case lessThanThree = "Less than 3 times a week"
    case threeToFive = "3-5 times a week"
    case everyday = "Almost everyday"
}

enum BQ2Answer: String, CaseIterable, Codable {
    case doNotOwn = "I do not use noise-cancellation headphones"
    case focus = "Reduce noise to focus"
    case enjoyContent = "Enjoy music or speech better"
    case aetheticApperance = "For Aesthetic Appearance"
}

enum BQ3Answer: String, CaseIterable, Codable {
    case outdoorCommuting = "Outdoors, commuting"
    case outdoorRelaxing = "Outdoors, relaxing"
    case outdoorFocus = "Outdoors, concentrating"
    case inddorFocus = "Indoors, concentrating"
    case inddorRelaxing = "Indoors, relaxing"
}

enum ConcludingQuestions: String, CaseIterable, Codable {
    case q1 = "In you most frequent usecase of noise-cancellation headphones, how likely are you willing to try the augmentation effects you’ve heard today?"
    case q2 = "Does the augmentation effects make you feel more immersed with the content?"
    case q3 = "Do you have any suggestions on how the augmentations you've head today could be better?"
}

enum CQ2Answer: String, CaseIterable, Codable {
    case yes = "Yes"
    case no = "No"
}
