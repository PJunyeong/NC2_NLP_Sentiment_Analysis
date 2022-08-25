//
//  SentimentModel.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import Foundation

struct SentimentModel: Codable {
    let document: Document
    let sentence: Sentence
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
