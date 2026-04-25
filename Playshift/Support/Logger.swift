import Foundation
import os

extension Logger {
    private static let subsystem = "com.karman.playshift"

    enum Playshift {
        static let auth = Logger(subsystem: subsystem, category: "auth")
        static let network = Logger(subsystem: subsystem, category: "network")
        static let sync = Logger(subsystem: subsystem, category: "sync")
        static let ui = Logger(subsystem: subsystem, category: "ui")
    }

    static let playshift = Playshift.self
}
