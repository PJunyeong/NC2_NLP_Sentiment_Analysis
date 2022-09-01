//
//  SentimentModel.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import Foundation

struct SentimentModel: Codable {
    let label: String?
    let document: Document?
    let sentences: [Sentence]?
    
    var labelString: String {
        guard let label = label else { return "" }
        switch label {
        case "0": return "기쁨"
        case "1": return "불안"
        case "2": return "당황"
        case "3": return "슬픔"
        case "4": return "분노"
        case "5": return "상처"
        default: return ""
        }
    }
    
    var labelImageString: String {
        guard let label = label else { return "" }
        switch label {
        case "0": return "funny"
        case "1": return "anxious"
        case "2": return "nervous"
        case "3": return "sad"
        case "4": return "anger"
        case "5": return "hurt"
        default: return ""
        }
    }
}

// MARK: - Document
struct Document: Codable {
    let sentiment: String
    let confidence: Confidence
}

// MARK: - Confidence
struct Confidence: Codable {
    let neutral, positive, negative: Double
}

// MARK: - Sentence
struct Sentence: Codable {
    let content: String
    let offset, length: Int
    let sentiment: String
    let confidence: Confidence
    let highlights: [Highlight]
}

// MARK: - Highlight
struct Highlight: Codable {
    let offset, length: Int
}
