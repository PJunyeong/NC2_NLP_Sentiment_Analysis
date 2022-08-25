//
//  ClovaEnum.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import Foundation

enum ClovaAPI {
    case sentiment
    
    var clientHeaderKeyID: String {
        switch self {
        case .sentiment: return "X-NCP-APIGW-API-KEY-ID"
        }
    }
    
    var clientHeaderSecretID: String {
        switch self {
        case .sentiment: return "X-NCP-APIGW-API-KEY"
        }
    }
    
    var clientHeaderContentType: String {
        switch self {
        case .sentiment: return "Content-Type"
        }
    }
    
    var clientID: String {
        switch self {
        case .sentiment: return "oxvzuu4p6a"
        }
    }
    
    var clientSecret: String {
        switch self {
        case .sentiment: return "9WGg1rbJ0HnS9Pjkiv6Vwm6HHhaM6bC3gpU6r42c"
        }
    }
    
    var clientContent: String {
        switch self {
        case .sentiment: return "application/json"
        }
    }
    
    var urlString: String {
        switch self {
        case .sentiment: return "https://naveropenapi.apigw.ntruss.com/sentiment-analysis/v1/analyze"
        }
    }
}
