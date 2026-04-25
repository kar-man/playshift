import SwiftUI

struct RootView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "music.note.list")
                .imageScale(.large)
                .font(.system(size: 64))
                .foregroundStyle(.tint)
            Text("Playshift")
                .font(.largeTitle.weight(.semibold))
            Text("Sync playlists between Spotify and Apple Music.")
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    RootView()
}
