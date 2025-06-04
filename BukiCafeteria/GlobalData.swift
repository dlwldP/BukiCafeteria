//
//  GlobalData.swift
//  BukiCafeteria
//
//  Created by 이지예 on 5/24/25.
//

// GlobalData.swift

import Foundation

class Cart {
    static let shared = Cart()
    var items: [Menu] = []
    private init() {}
}

class Review {
    static let shared = Review()
    var reviews: [String] = []
}

