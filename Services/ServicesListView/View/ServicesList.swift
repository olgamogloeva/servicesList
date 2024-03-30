//
//  ContentView.swift
//  Services
//
//  Created by Olga Mogloeva on 29.03.2024.
//

import SwiftUI
import Observation

private extension String {
    static let servicesScreenTitle = "Сервисы"
}

private extension CGFloat {
    static let minRowHeight: CGFloat = 50
}

struct ServicesList: View {
    @Bindable var viewModel: ServiceViewModel

    var body: some View {
        VStack {
            Text(String.servicesScreenTitle)
                .font(.headline)
            List(viewModel.lists) { element in
                row(for: element)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .unredacted(when: !viewModel.isLoading)
        }
        .onAppear {
            viewModel.onAppear()
        }
        .alert(item: $viewModel.alertModel) { model in
            alertView(from: model)
        }
    }
    
    private func alertView(from model: AlertModel) -> Alert {
        Alert(
            title: Text(model.title),
            message: Text(model.message),
            dismissButton: .default(Text(model.buttonTitle))
        )
    }
    
    @ViewBuilder
    private func row(for model: ServiceModel) -> some View {
        Button(
            action: {
                viewModel.didTapCell(with: model)
            },
            label: {
                ServiceCell(model: model)
                    .frame(minHeight: .minRowHeight)
            }
        )
    }
}

#Preview {
    ServiceScreenAssembly.assemly()
}
