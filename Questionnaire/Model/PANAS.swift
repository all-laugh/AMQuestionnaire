//
//  PANAS.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import Foundation

struct PanasQuestionnaire: Codable {
    var audioStimuli: AudioStimuli
    
    var interested: ScaledResponse?
    var distressed: ScaledResponse?
    var excited: ScaledResponse?
    var upset: ScaledResponse?
    var strong: ScaledResponse?
    var guilty: ScaledResponse?
    var scared: ScaledResponse?
    var hostile: ScaledResponse?
    var enthusiastic: ScaledResponse?
    var proud: ScaledResponse?
    var irritable: ScaledResponse?
    var alert: ScaledResponse?
    var ashamed: ScaledResponse?
    var inspired: ScaledResponse?
    var nervous: ScaledResponse?
    var determined: ScaledResponse?
    var attentive: ScaledResponse?
    var jittery: ScaledResponse?
    var active: ScaledResponse?
    var afraid: ScaledResponse?
 
}

enum AudioStimuli: String, CaseIterable, Codable {
    case noiseCancellation = "Noise Cancellation Only"
    case ncPlusMusic = "Noise Cancellation + Music"
    case ncPlusAugmentation = "Noise Cancellation + Augmentation"
    case ncPlusMusicPlusAugmentation = "Noise Cancellation + Music + Augmentation"
}

enum ScaledResponse: Int, CaseIterable, Codable {
    case verySlightlyOrNotAtAll = 1
    case aLittle = 2
    case moderately = 3
    case quiteABit = 4
    case extremely = 5
    
    var string: String {
        switch self {
        case .verySlightlyOrNotAtAll:
            return "Very slightly or not at all"
        case .aLittle:
            return "A little"
        case .moderately:
            return "Moderately"
        case .quiteABit:
            return "Quite a bit"
        case .extremely:
            return "Extremely"
        }
    }
}
