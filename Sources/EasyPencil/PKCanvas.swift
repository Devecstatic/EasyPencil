import UIKit
import PencilKit

@available(iOS 13.0, *)
open class PKCanvas: UIView {
    
    public var canvasView: PKCanvasView!
    public weak var pencilKitDelegate: PencilKitDelegate?
	public var isVerbose = false
    
    //MARK: - iOS Life Cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPencilKitCanvas()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupPencilKitCanvas()
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
		if isVerbose { print("Drawing has changed") }
    }
}

@available(iOS 13.0, *)
extension PKCanvas: PKToolPickerObserver {
    
    public func toolPickerSelectedToolDidChange(_ toolPicker: PKToolPicker) {
		if isVerbose { print("Tool did change") }
	}
    
    public func toolPickerIsRulerActiveDidChange(_ toolPicker: PKToolPicker) {
		if isVerbose { print("Ruler is activity changed") }
	}
    
    public func toolPickerVisibilityDidChange(_ toolPicker: PKToolPicker) {
		if isVerbose { print("Picker visiblity did change") }
	}
    
    public func toolPickerFramesObscuredDidChange(_ toolPicker: PKToolPicker) {
		if isVerbose { print("Frames obscured status changed") }
	}
}

