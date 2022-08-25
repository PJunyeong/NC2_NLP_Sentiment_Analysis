//
//  TextInput.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import SwiftUI

struct TextInput: View {
    @StateObject private var viewModel: TextInputViewModel
    let mockText = "저는 오늘 새로운 맥북을 샀어요!"
    init(dataServiceEnum: DataServiceEnum) {
        _viewModel = StateObject(wrappedValue: TextInputViewModel(dataService: dataServiceEnum.dataService))
    }
    var body: some View {
        VStack {
            if let sentimentAnalysis = viewModel.sentimentAnalysis {
                Text(sentimentAnalysis.document.sentiment)
            }
            Button {
                viewModel.fetchSentimentAnalysis(mockText)
            } label: {
                Text("GET DATA!")
            }

        }
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput(dataServiceEnum: DataServiceEnum.ClovaSentimentDataService)
    }
}
