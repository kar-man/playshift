import Foundation

public enum AppleMusicError: Error, Sendable {
    case notAuthorized
    case subscriptionRequired           // library writes require active Apple Music sub
    case notFound(id: String)
    case quotaExceeded
    case network(underlying: any Error)
    case decoding(underlying: any Error)
    case unexpected(message: String)
}

public enum SpotifyError: Error, Sendable {
    case notAuthorized
    case tokenRefreshFailed
    case rateLimited(retryAfter: TimeInterval)
    case forbidden                       // e.g. modifying a playlist you don't own
    case notFound(id: String)
    case invalidResponse
    case http(status: Int, body: String?)
    case network(underlying: any Error)
    case decoding(underlying: any Error)
}

public enum SyncError: Error, Sendable {
    case sourceUnavailable(MusicServiceID)
    case destinationUnavailable(MusicServiceID)
    case sourceNotOwned                  // can read; just informational
    case destinationNotOwned             // can't write — must surface to user
    case noTracksToSync
    case partialFailure(written: Int, total: Int, errors: [any Error])
    case cancelled
}
