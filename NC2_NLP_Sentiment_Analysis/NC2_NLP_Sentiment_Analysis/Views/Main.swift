//
//  Main.swift
//  NC2_NLP_Sentiment_Analysis
//
//  Created by Junyeong Park on 2022/08/25.
//

import SwiftUI

struct Main: View {
    @State private var showSheet: Bool = false
    @State private var tabSelection: Int = 1
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                calendarTabView
                writeButton
            }
            .navigationTitle("감정 일기")
            .padding()
        }
    }
}

extension Main {
    private var calendarTabView: some View {
        ZStack {
            TabView(selection: $tabSelection) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.yellow)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(5)
            }
            .frame(height: 400)
            .tabViewStyle(.page)
            Text("달력 형태의 일기 -> Grid 뷰입니다")
        }
    }
    
    private var writeButton: some View {
        Button {
            showSheet.toggle()
        } label: {
            Text("오늘 일기 작성 -> 텍스트 작성 모달")
                .font(.headline)
                .fontWeight(.semibold)
                .withDefaultViewModifier()
        }
        .sheet(isPresented: $showSheet) {
            TextInput(dataServiceEnum: .CustomSentimentDataService)
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
