import Foundation

/// Each concrete service is an actor — token state, refresh coordination, and
/// rate-limit bookkeeping live behind the actor boundary.
public protocol MusicService: Actor {
    var serviceID: MusicServiceID { get }
    var isAuthorized: Bool { get async }

    func authorize() async throws

    // Reads
    func userPlaylists() async throws -> [Playlist]
    func tracks(in playlistID: String) async throws -> [Track]

    // Lookups (used by the matcher)
    func track(byISRC isrc: String) async throws -> Track?
    func track(matching query: TrackQuery) async throws -> Track?

    // Writes — destination side of a sync
    func createPlaylist(name: String, description: String?) async throws -> Playlist
    func replaceTracks(_ trackIDs: [String], in playlistID: String) async throws
    func appendTracks(_ trackIDs: [String], to playlistID: String) async throws
}
