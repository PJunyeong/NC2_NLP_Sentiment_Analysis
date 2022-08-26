//
//  View+Extension.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/26.
//

import SwiftUI

extension View {
    func withDefaultViewModifier(_ backgroundColor: Color = Color.blue.opacity(0.7)) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}
