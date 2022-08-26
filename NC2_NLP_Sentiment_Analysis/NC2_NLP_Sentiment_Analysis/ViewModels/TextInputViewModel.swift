//
//  TextInputViewModel.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import SwiftUI
import Combine

class TextInputViewModel: ObservableObject {
    @Published var sentimentAnalysis: SentimentModel? = nil
    @Published var inputText: String = ""
    let dataService: DataService
    var cancellables = Set<AnyCancellable>()
    
    init(dataService: DataService) {
        self.dataService = dataService
        addSubscribe()
    }
    
    private func addSubscribe() {
        dataService.sentimentAnalysisPublisher
            .sink { [weak self] returnedData in
            guard let self = self else { return }
                DispatchQueue.main.async {
                    self.sentimentAnalysis = returnedData
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchSentimentAnalysis() {
        guard inputText.count > 0 && inputText.count <= 1000 else { return }
        dataService.fetchSentimentAnalysis(inputText)
    }
}
