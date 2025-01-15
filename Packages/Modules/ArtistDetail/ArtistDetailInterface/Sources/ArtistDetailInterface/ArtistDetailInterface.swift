import UIKit

public protocol ArtistDetailInterface: Sendable {
    nonisolated func makeArtistDetailModule(
        navigationController: UINavigationController?,
        artistIdentifier: String
    ) async -> UIViewController
}
