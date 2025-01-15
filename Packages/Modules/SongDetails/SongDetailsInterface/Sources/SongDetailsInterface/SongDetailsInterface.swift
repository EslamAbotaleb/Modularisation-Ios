// The Swift Programming Language
// https://docs.swift.org/swift-book

import CommonModels
import UIKit

public protocol SongDetailsInterface: Sendable {
    func makeSongDetailsModule(navigationController: UINavigationController?, song: Song) async -> UIViewController
}
