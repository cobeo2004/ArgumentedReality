import SwiftUI

struct ContentView: View {
    @State var willPressConfirmedButton : Bool = false;
    var body: some View {
        VStack {
            if willPressConfirmedButton == true {
                ARView_Content(willPressConfirmedButton: $willPressConfirmedButton)
            }
            else {
                WelcomeView(willPressConfirmedButton: $willPressConfirmedButton)
            }
        }
    }
}
