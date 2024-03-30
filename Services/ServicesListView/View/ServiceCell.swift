//
//  ServiceCell.swift
//  Services
//
//  Created by Olga Mogloeva on 29.03.2024.
//

import SwiftUI

private extension CGFloat {
    static let imageCornerSize: CGFloat = 48
    static let imageCornerRadius: CGFloat = 12
}

private extension EdgeInsets {
    static let textVstackInsets = EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
}

private extension String {
    static let chevronImageName = "chevron.right"
}

struct ServiceCell: View {
    let model: ServiceModel
    var body: some View {
        HStack {
            AsyncImageProviver(urlString: model.iconURLString)
                .frame(width: .imageCornerSize, height: .imageCornerSize)
                .cornerRadius(.imageCornerRadius)
            
            VStack (alignment: .leading) {
                Text(model.name)
                    .font(.headline)
                Text(model.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }.padding(.textVstackInsets)
            Spacer()
            Image(systemName: .chevronImageName)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ServiceCell(model: .init(name: "ВКонтакте",
                             description: "Самая популярная соцсеть и первое суперприложение в России",
                             siteURLString: "link",
                             iconURLString: "icon"))
}
