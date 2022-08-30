//
//  CustomProtocols.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import Foundation

protocol DataService {
    var sentimentAnalysisPublisher: Published<SentimentModel?>.Publisher { get }
    func fetchSentimentAnalysis(_ text: String)
}

