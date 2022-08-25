//
//  MainViewModel.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import SwiftUI
import Combine

class TextInputViewModel: ObservableObject {
    @Published var sentimentAnalysis: SentimentModel? = nil
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
            self.sentimentAnalysis = returnedData
            }
            .store(in: &cancellables)
    }
    
    func fetchSentimentAnalysis(_ text: String) {
        guard text.count > 0 && text.count <= 1000 else { return }
        dataService.fetchSentimentAnalysis(text)
    }
}
