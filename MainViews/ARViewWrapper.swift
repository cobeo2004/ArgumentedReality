import RealityKit
import SwiftUI

public struct ARViewWrapper: UIViewRepresentable {
    @Binding var selectedShapeIdx : Int;
    public typealias UIViewType = ARView
    
    public func makeCoordinator() -> ARViewCoordinator {
        return ARViewCoordinator(arViewWrapper: self, selectedShapeIndex: $selectedShapeIdx)
    }
    
    public func makeUIView(context: UIViewRepresentableContext<ARViewWrapper>) -> ARView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        arView.enablePlacement()
        arView.enableObjectRemoval()
        arView.session.delegate = context.coordinator
        return arView
    }
    
    public func updateUIView(_ uiView: ARView, context: UIViewRepresentableContext<ARViewWrapper>) {
    }
}
