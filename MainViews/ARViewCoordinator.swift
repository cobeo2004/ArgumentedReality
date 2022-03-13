
import RealityKit
import Foundation
import ARKit

open class ARViewCoordinator : NSObject, ARSessionDelegate {
    var arViewWrapper: ARViewWrapper
    @Binding var selectedShapeIdx: Int
    
    public init(arViewWrapper wrapper: ARViewWrapper, selectedShapeIndex idx: Binding<Int>) {
        self.arViewWrapper = wrapper
        self._selectedShapeIdx = idx
    }
}

