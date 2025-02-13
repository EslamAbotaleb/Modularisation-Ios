//
//  AnalyticsEventTrackerMock.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 15.02.24.
//

import Foundation

public actor AnalyticsEventTrackerMock: @preconcurrency AnalyticsEventTracking {

   public var trackedEvents = [AnalyticsEvent]()

    public init() {}

     public func trackEvent(_ event: AnalyticsEvent) {
            trackedEvents.append(event)
    }
}
