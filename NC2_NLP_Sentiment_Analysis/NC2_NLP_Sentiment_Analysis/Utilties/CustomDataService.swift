//
//  CustomDataService.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import Foundation

class CustomDataService: DataService {
    var sentimentAnalysisPublisher: Published<SentimentModel?>.Publisher {
        $sentimentAnalysis
    }
    @Published var sentimentAnalysis: SentimentModel? = nil
    
    func fetchSentimentAnalysis(_ text: String) {
        
    }
    
    
}
