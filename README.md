# Playshift

iOS app for syncing playlists between Spotify and Apple Music.

**Status:** Early development.

## Stack

- Swift 6 with strict concurrency enabled
- SwiftUI, MVVM with `@Observable`
- Minimum iOS 18.0
- MusicKit for Apple Music
- Spotify Web API (OAuth 2.0 with PKCE)
- SwiftData for persistence

## Building

Open `Playshift.xcodeproj` in Xcode 16 or later, then `Cmd+R` to run on simulator.

A free Apple ID is sufficient for simulator testing. Apple Music features
require an active Apple Music subscription on the test device.
