//
//  AnalyticsEventTracking.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 15.02.24.
//

import Foundation

public protocol AnalyticsEventTracking: Sendable {
    func trackEvent(_ event: AnalyticsEvent)
}
