import SwiftUI
import Foundation 

public struct ARView_Content: View {
    let objectShape = Shape.allCases
    @Binding var willPressConfirmedButton : Bool;
    @State private var selectedShapeIdx:Int = 0;
    public var body: some View {
        ZStack(alignment: .bottomTrailing) { 
            ARViewWrapper(selectedShapeIdx: $selectedShapeIdx)
            Picker("Shape Picker", selection: $selectedShapeIdx) {
                ForEach(0..<objectShape.count) {idx in 
                    Text(self.objectShape[idx].rawValue).tag(idx)
                } 
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(7)
            .background(Color.black.opacity(0.3))
            
        }
        Button(action: {
            self.willPressConfirmedButton = false;
        }, label: {
            Image(systemName: "return")
        })

    }
}


