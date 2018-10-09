//
//  Extensions.swift
//  Dad Joke Generator
//
// Credit to: https://mikeash.com/pyblog/friday-qa-2018-04-27-generating-text-with-markov-chains-in-swift.html
//

import Foundation

extension Optional: Hashable where Wrapped: Hashable {
    public var hashValue: Int {
        switch self {
        case let wrapped?: return wrapped.hashValue
        case .none: return 42
        }
    }
}
