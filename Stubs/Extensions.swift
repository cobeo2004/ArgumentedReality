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
            let entityModel = createModel(shape: selectedShape)
            let anchorModel = AnchorEntity(world: firstRes.worldTransform)
            anchorModel.name = selectedShape.description
            anchorModel.addChild(entityModel)
            self.scene.addAnchor(anchorModel)
            entityModel.generateCollisionShapes(recursive: true)
            self.installGestures([.translation, .rotation, .scale], for: entityModel)
        }
        else {
            print("Cannot Detect Surface - move device around")
        }
    }
    
    func enableObjectRemoval() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(recognizer: )))
        self.addGestureRecognizer(longPressRecognizer)
    }
    
    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        let location = recognizer.location(in: self)
        if let entity = self.entity(at: location) {
            if let anchorEntity = entity.anchor, anchorEntity.name == "Sphere" || anchorEntity.name == "Cube"{
                anchorEntity.removeFromParent()
            }
        }
    }
}
