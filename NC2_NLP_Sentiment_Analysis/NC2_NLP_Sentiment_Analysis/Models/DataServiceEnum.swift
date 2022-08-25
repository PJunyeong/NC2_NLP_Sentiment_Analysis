//
//  DataServiceEnum.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import Foundation

enum DataServiceEnum {
    case ClovaSentimentDataService
    case CustomSentimentDataService
    
    var dataService: DataService {
        switch self {
        case .ClovaSentimentDataService: return ClovaDataService()
        case .CustomSentimentDataService: return CustomDataService()
        }
    }
}
