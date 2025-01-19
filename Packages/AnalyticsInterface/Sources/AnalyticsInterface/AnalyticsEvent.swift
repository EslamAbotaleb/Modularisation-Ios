//
//  AnalyticsEvent.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 15.02.24.
//

import Foundation

public struct AnalyticsEvent: Sendable {
    public let name: String
    public let parameters: [String: String]?
    // Any
    public init(name: String, parameters: [String: String]? = nil) {
        self.name = name
        self.parameters = parameters
    }
}
