//
//  Tab.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 25.02.2023.
//

import Foundation

enum Tab: String, CaseIterable, Identifiable {
    case home = "Home"
    case category = "Category"
    case ticket = "Ticket"
    case location = "Location"
    case profile = "Profile"
    var id: String { rawValue }
}

extension Tab {
    var index: Int {
        switch self {
        case .home: return 0
        case .category: return 1
        case .ticket: return 2
        case .location: return 3
        case .profile: return 4
        }
    }
}
