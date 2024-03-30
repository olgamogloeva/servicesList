//
//  AsyncImageProviver.swift
//  Services
//
//  Created by Olga Mogloeva on 30.03.2024.
//

import SwiftUI

struct AsyncImageProviver: View {
    let urlString: String
    let placeholderImage: Image
    let errorImage: Image
    
    init(
        urlString: String,
        placeholderImage: Image = Image(systemName: "photo.fill.on.rectangle.fill"),
        errorImage: Image = Image(systemName: "questionmark.circle.fill")
    ) {
        self.urlString = urlString
        self.placeholderImage = placeholderImage
        self.errorImage = errorImage
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            image(for: phase)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

private extension AsyncImageProviver {
    func image(for phase: AsyncImagePhase) -> Image {
        switch phase {
        case .empty:
            return placeholderImage
        case .success(let image):
            return image
        case .failure:
            return errorImage
        @unknown default:
            return placeholderImage
        }
    }
}
