import UIKit
import PencilKit

@available(iOS 13.0, *)
open class PKCanvas: UIView {
    
    public var canvasView: PKCanvasView!
    public weak var pencilKitDelegate: PencilKitDelegate?
    
    //MARK: - iOS Life Cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupPencilKitCanvas()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateCanvasOrientation(with frame: CGRect) {
        self.canvasView.frame = frame
        self.frame = frame
    }
    
    private func setupPencilKitCanvas() {
         canvasView = PKCanvasView(frame:self.bounds)
         canvasView.delegate = self
         canvasView.alwaysBounceVertical = false
         canvasView.allowsFingerDrawing = true
         canvasView.becomeFirstResponder()
         addSubview(canvasView)
           
         if let window = UIApplication.shared.windows.last, let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            toolPicker.addObserver(self)
            canvasView.becomeFirstResponder()
         }
    }
    
}


// MARK: Canvas View Delegate
@available(iOS 13.0, *)
extension PKCanvas: PKCanvasViewDelegate {
    
    /// Delegate method: Note that the drawing has changed.
    public func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
    }
}

@available(iOS 13.0, *)
extension PKCanvas: PKToolPickerObserver {
    
    public func toolPickerSelectedToolDidChange(_ toolPicker: PKToolPicker) { }
    
    public func toolPickerIsRulerActiveDidChange(_ toolPicker: PKToolPicker) { }
    
    public func toolPickerVisibilityDidChange(_ toolPicker: PKToolPicker) { }
    
    public func toolPickerFramesObscuredDidChange(_ toolPicker: PKToolPicker) { }
}

