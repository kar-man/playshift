import Foundation

public enum MusicServiceID: String, Sendable, Codable, CaseIterable {
    case appleMusic
    case spotify
}

public struct Track: Sendable, Hashable, Identifiable, Codable {
    public let id: String                 // service-native ID (Spotify URI tail / MusicKit ID)
    public let service: MusicServiceID
    public let title: String
    public let artistName: String         // primary artist; full credits live in `artists`
    public let artists: [String]
    public let albumName: String?
    public let durationMs: Int
    public let isrc: String?              // may be nil for live / regional / older tracks
    public let artworkURL: URL?

    public init(
        id: String,
        service: MusicServiceID,
        title: String,
        artistName: String,
        artists: [String],
        albumName: String?,
        durationMs: Int,
        isrc: String?,
        artworkURL: URL?
    ) {
        self.id = id
        self.service = service
        self.title = title
        self.artistName = artistName
        self.artists = artists
        self.albumName = albumName
        self.durationMs = durationMs
        self.isrc = isrc
        self.artworkURL = artworkURL
    }
}

public struct Playlist: Sendable, Hashable, Identifiable, Codable {
    public let id: String
    public let service: MusicServiceID
    public let name: String
    public let description: String?
    public let isOwnedByUser: Bool        // can't write to playlists you don't own
    public let trackCount: Int
    public let snapshotID: String?        // Spotify versioning; nil for Apple Music

    public init(
        id: String,
        service: MusicServiceID,
        name: String,
        description: String?,
        isOwnedByUser: Bool,
        trackCount: Int,
        snapshotID: String?
    ) {
        self.id = id
        self.service = service
        self.name = name
        self.description = description
        self.isOwnedByUser = isOwnedByUser
        self.trackCount = trackCount
        self.snapshotID = snapshotID
    }
}

public struct TrackQuery: Sendable, Hashable {
    public let title: String
    public let primaryArtist: String
    public let durationMs: Int
    public let durationToleranceMs: Int

    public init(
        title: String,
        primaryArtist: String,
        durationMs: Int,
        durationToleranceMs: Int = 2_000
    ) {
        self.title = title
        self.primaryArtist = primaryArtist
        self.durationMs = durationMs
        self.durationToleranceMs = durationToleranceMs
    }
}

public struct TrackMatch: Sendable, Hashable, Codable {
    public enum Method: String, Sendable, Codable {
        case isrc
        case metadata
    }

    public let source: Track
    public let destination: Track
    public let method: Method
    public let confidence: Double         // 0.0 ... 1.0
    public let matchedAt: Date

    public init(
        source: Track,
        destination: Track,
        method: Method,
        confidence: Double,
        matchedAt: Date
    ) {
        self.source = source
        self.destination = destination
        self.method = method
        self.confidence = confidence
        self.matchedAt = matchedAt
    }
}

public struct UnmatchedTrack: Sendable, Hashable, Codable {
    public enum Reason: String, Sendable, Codable {
        case noISRCAndNoMetadataMatch
        case ambiguousMetadataMatch
        case searchFailed
    }

    public let source: Track
    public let reason: Reason

    public init(source: Track, reason: Reason) {
        self.source = source
        self.reason = reason
    }
}
