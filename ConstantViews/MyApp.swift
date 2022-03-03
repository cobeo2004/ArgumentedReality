import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.localizedModel == "iPhone" || UIDevice.current.localizedModel == "iPad" {
                ContentView()
            }
            else {
                AlternativeView()
            }
        }
    }
}
