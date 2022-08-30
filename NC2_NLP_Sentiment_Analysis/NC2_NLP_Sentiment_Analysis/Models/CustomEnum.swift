//
//  CustomEnum.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/30.
//

import Foundation

enum CustomAPI {
    case sentiment
    
    var clientHeaderContentType: String {
        switch self {
        case .sentiment: return "Content-Type"
        }
    }
    
    var clientContent: String {
        switch self {
        case .sentiment: return "application/json"
        }
    }
    
    var urlString: String {
        switch self {
        case .sentiment: return "http://da84-34-74-205-70.ngrok.io/analysis"
        }
    }
}
