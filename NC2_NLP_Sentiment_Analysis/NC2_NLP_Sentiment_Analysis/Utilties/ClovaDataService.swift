//
//  ClovaDataService.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import SwiftUI
import Combine

class ClovaDataService: DataService {
    var sentimentAnalysisPublisher: Published<SentimentModel?>.Publisher {
        $sentimentAnalysis
    }
    @Published var sentimentAnalysis: SentimentModel? = nil
    var cancellabes = Set<AnyCancellable>()
    
    func fetchSentimentAnalysis(_ text: String) {
        guard let urlRequest = getURLRequest(text) else { return }
        URLSession.shared.dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: SentimentModel.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("SUCCESS")
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] returnedData in
                guard let self = self else { return }
                self.sentimentAnalysis = returnedData
            }
            .store(in: &cancellabes)
    }
    
    private func getURL() -> URL? {
        let urlString = ClovaAPI.sentiment.urlString
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
    
    private func getURLRequest(_ body: String) -> URLRequest? {
        guard let url = getURL(), let body = try? JSONSerialization.data(withJSONObject: ["content" : body]) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue(ClovaAPI.sentiment.clientID, forHTTPHeaderField: ClovaAPI.sentiment.clientHeaderKeyID)
        urlRequest.setValue(ClovaAPI.sentiment.clientSecret, forHTTPHeaderField: ClovaAPI.sentiment.clientHeaderSecretID)
        urlRequest.setValue(ClovaAPI.sentiment.clientContent, forHTTPHeaderField: ClovaAPI.sentiment.clientHeaderContentType)
        urlRequest.httpBody = body
        return urlRequest
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode == 200 else { throw URLError(.badServerResponse) }
        return output.data
    }
    
}
