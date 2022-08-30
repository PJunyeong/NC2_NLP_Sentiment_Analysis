//
//  TextInput.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import SwiftUI

struct TextInput: View {
    @StateObject private var viewModel: TextInputViewModel
    init(dataServiceEnum: DataServiceEnum) {
        _viewModel = StateObject(wrappedValue: TextInputViewModel(dataService: dataServiceEnum.dataService))
    }
    var body: some View {
        VStack {
            TextEditor(text: $viewModel.inputText)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            
            if let sentimentAnalysis = viewModel.sentimentAnalysis {
                if let document = sentimentAnalysis.document {
                    Text(document.sentiment)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .withDefaultViewModifier()
                }
                Text(sentimentAnalysis.labelString)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .withDefaultViewModifier()
            }
            Button {
                viewModel.fetchSentimentAnalysis()
            } label: {
                Text("GET DATA!")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .withDefaultViewModifier()
            }
        }
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput(dataServiceEnum: DataServiceEnum.ClovaSentimentDataService)
    }
}
