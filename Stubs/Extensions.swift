import SwiftUI
import RealityKit

extension ARView {
    public func createModel(shape: Shape) -> ModelEntity {
        let mesh = shape == .Cube ? MeshResource.generateBox(size: 0.2) : MeshResource.generateSphere(radius: 0.15)
        let material = SimpleMaterial(color: .blue, isMetallic: true)
        return ModelEntity(mesh: mesh, materials: [material])
    }
    
    public func enablePlacement() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc public func handleTap(recognizer: UITapGestureRecognizer) {
        
        guard let coordinator = self.session.delegate as? ARViewCoordinator else {
            print("Can not obtaining coordinator")
            return
        }
        
        let location = recognizer.location(in: self)
        let res = self.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let firstRes = res.first {
            let selectedShape = Shape.allCases[coordinator.selectedShapeIdx]
            let Entity_Model = createModel(shape: selectedShape)
            let Anchor_Model = AnchorEntity(world: firstRes.worldTransform)
            Anchor_Model.addChild(Entity_Model)
            self.scene.addAnchor(Anchor_Model)
        }
        else {
            print("Cannot Detect Surface - move device around")
        }
    }
}
