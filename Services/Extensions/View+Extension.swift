//
//  View+Extension.swift
//  Services
//
//  Created by Olga Mogloeva on 30.03.2024.
//

import SwiftUI

extension View {
    @ViewBuilder func unredacted(when condition: Bool) -> some View {
        if condition {
            unredacted()
        } else {
            redacted(reason: .placeholder)
        }
    }
}
