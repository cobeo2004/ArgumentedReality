import SwiftUI

public struct WelcomeView: View {
    @Binding var willPressConfirmedButton : Bool;
    public var body: some View {
        VStack {
            Text("Argumented Reality App")
                .font(.title2)
                .foregroundColor(.red)
                .bold()
        
            Button(action: {
                self.willPressConfirmedButton = true;
            }, label: {
                Text("Get Started")
                    .bold()
                    .frame(width:280, height:50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            })
            
            Text("Made By Simon Nguyen @2022")
                .font(.callout)
                .bold()
                .italic()
                .padding()
        }
    }
}
