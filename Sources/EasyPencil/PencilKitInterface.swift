import UIKit

@available(iOS 13.0, *)
public protocol PencilKitDelegate: class {
	func snapshot(from canvas: PKCanvas) -> UIImage
}

@available(iOS 13.0, *)
public extension PencilKitDelegate {
    
    func snapshot(from canvas: PKCanvas) -> UIImage {
        //Take PencilKit Drawings snapshot
        return UIImage()
    }
}

@available(iOS 13.0, *)
public protocol PencilKitInterface: NSObject {
	var pencilKitCanvas: PKCanvas { get set }
	func createPencilKitCanvas(frame: CGRect, delegate: PencilKitDelegate) -> PKCanvas
	func updateCanvasOrientation(with frame: CGRect)
}

@available(iOS 13.0, *)
public extension PencilKitInterface {
    
    func createPencilKitCanvas(frame: CGRect, delegate: PencilKitDelegate) -> PKCanvas {
        pencilKitCanvas = PKCanvas(frame: frame)
        pencilKitCanvas.pencilKitDelegate = delegate
        return pencilKitCanvas
    }
    
    func updateCanvasOrientation(with frame: CGRect) {
        pencilKitCanvas.updateCanvasOrientation(with: frame)
    }
}
