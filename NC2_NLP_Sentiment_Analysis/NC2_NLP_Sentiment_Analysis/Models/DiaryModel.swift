//
//  DiaryModel.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/26.
//

import SwiftUI

struct DiaryModel: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let text: String
    let sentiment: Confidence
    let color: Color
}
