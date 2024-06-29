//
//  ControlTouchRecognizer.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit

typealias ControlCompletion = (_ sender: UIControl) -> Void
typealias ControlHighlightCompletion = (_ sender: UIControl, _ isHighlighted: Bool) -> Void

private var touchesRecognizerAssociationKey: UInt8 = 0
extension UIButton {
    
    /// Completion handler that will be performed when the control is highlighted/unhighlighted.
    var onHighlight: ControlHighlightCompletion? {
        get {
            return touchesRecognizer.onHighlight
        }
        set(newValue) {
            touchesRecognizer.onHighlight = newValue
        }
    }
    
    /// Completion handler that will be performed on touch up event inside target control view.
    var onTouchUpInside: ControlCompletion? {
        get {
            return touchesRecognizer.onTouchUpInside
        }
        set(newValue) {
            touchesRecognizer.onTouchUpInside = newValue
        }
    }
    
    /// Completion handler that will be performed on touch down event inside target control view.
    var onTouchDown: ControlCompletion? {
        get {
            return touchesRecognizer.onTouchDown
        }
        set(newValue) {
            touchesRecognizer.onTouchDown = newValue
        }
    }
    
    /// Recognizer for touches. By default is enabled, to disable recognizer use its `isDisabled`
    /// parameter.
    var touchesRecognizer: ControlTouchesRecognizer! {
        get {
            var object = objc_getAssociatedObject(
                self,
                &touchesRecognizerAssociationKey
            ) as? ControlTouchesRecognizer
            
            // Initialize object if needed
            if object == nil {
                object = ControlTouchesRecognizer(self)
                self.touchesRecognizer = object
            }
            
            return object
        }
        set(newValue) {
            objc_setAssociatedObject(
                self,
                &touchesRecognizerAssociationKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}

// MARK: - ControlTouchesRecognizer Class Impl

/**
 Object that will setup a handlers for control touch events.
 
 ## Next event are supported by object:
 - **onTouchDownInside** – when user did touch down inside control frame
 - **onTouchUpInside** – when user did touch up inside control frame
 - **onHighlight** – will performed each time when user initiate or update touch inside control frame.
 
 ## Example:
    let someRect: CGRect = ...
    ...
    let button = UIButton(frame: someRect)
    button.onHighlight = { [unowned self] (sender, isHighlighted) in
        sender.alpha = (isHighlighted ? 0.5 : 1.0)
    }
    button.onTouchUpInside = { [unowned self] sender
        // do your stuff here
    }
 */
class ControlTouchesRecognizer: NSObject {
    
    // MARK: - Constants
    
    private enum Constants {
        static let animationDuration = 0.2
    }

    // MARK: - Class Properties
    
    var isDisabled = false {
        didSet {
            setupControlHandlers(enabled: !isDisabled)
        }
    }
    /// Determine if the hightlight completion handler will be executed with animation.
    var hightlightWithAnimation = true
    // Public
    /// Completion handler that will be performed on touch down event inside target control view.
    var onTouchDown: ControlCompletion?
    /// Completion handler that will be performed on touch up event inside target control view.
    var onTouchUpInside: ControlCompletion?
    /// Completion handler that will be performed when the control is highlighted/unhighlighted.
    var onHighlight: ControlHighlightCompletion?
    // Private
    private weak var targetControl: UIControl?
    
    // MARK: - Class Initializers
    
    init(_ control: UIControl) {
        targetControl = control
        super.init()
        // By default the recognizer is enabled.
        setupControlHandlers(enabled: true)
    }
}

// MARK: - Private Methods

private extension ControlTouchesRecognizer {
    
    /// Setup control event to handle control highlight behavior.
    /// Also will handle a touchUp/ touchDown touches.
    private func setupControlHandlers(enabled: Bool) {
        if enabled {
            targetControl?.addTarget(self, action: #selector(handleTouchDown(_:)), for: .touchDown)
            targetControl?.addTarget(self, action: #selector(handleTouchDragExit(_:)), for: .touchDragExit)
            targetControl?.addTarget(self, action: #selector(handleTouchDragEnter(_:)), for: .touchDragEnter)
            targetControl?.addTarget(self, action: #selector(handleTouchUpInside(_:)), for: .touchUpInside)
            targetControl?.addTarget(self, action: #selector(handleTouchCancel(_:)), for: .touchCancel)
        } else {
            targetControl?.removeTarget(self, action: #selector(handleTouchDown(_:)), for: .touchDown)
            targetControl?.removeTarget(self, action: #selector(handleTouchDragExit(_:)), for: .touchDragExit)
            targetControl?.removeTarget(self, action: #selector(handleTouchDragEnter(_:)), for: .touchDragEnter)
            targetControl?.removeTarget(self, action: #selector(handleTouchUpInside(_:)), for: .touchUpInside)
            targetControl?.removeTarget(self, action: #selector(handleTouchCancel(_:)), for: .touchCancel)
        }
    }
    
    /// Handle `touch down control` event
    /// The control will be unhighlighted.  Also, the method will
    /// execute `onTouchDown` completion handler.
    @objc
    private func handleTouchDown(_ sender: UIControl) {
        guard let target = targetControl else {
            return
        }
        executeWithAnimation {
            self.onHighlight?(target, true)
        }
        self.onTouchDown?(target)
    }
    
    /// Handle `touch drag exit` control event.
    /// The control will be unhighlighted.
    @objc
    private func handleTouchDragExit(_ sender: UIControl) {
        guard let target = targetControl else { return }
        
        executeWithAnimation {
            self.onHighlight?(target, false)
        }
    }
    
    /// Handle `touch drag enter` control event.
    /// The control will be highlighted.
    @objc
    private func handleTouchDragEnter(_ sender: UIControl) {
        guard let target = targetControl else { return }
        
        executeWithAnimation {
            self.onHighlight?(target, true)
        }
    }
    
    /// Handle `touch up inside` control event.
    /// The control will be unhighlighted. Also, the method will
    /// execute `onTouchUpInside` completion handler.
    @objc
    private func handleTouchUpInside(_ sender: UIControl) {
        guard let target = targetControl else { return }
        
        executeWithAnimation {
            self.onHighlight?(target, false)
        }
        self.onTouchUpInside?(target)
    }
    
    /// Handle `touch up cancel` control event.
    /// The control will be unhighlighted.
    @objc
    private func handleTouchCancel(_ sender: UIControl) {
        guard let target = targetControl else { return }
        
        executeWithAnimation {
            self.onHighlight?(target, false)
        }
    }
    
    /// The method will execute a block with animation.
    /// Disable animation behavior via `hightlightWithAnimation` property.
    private func executeWithAnimation(_ animations: (() -> Void)?) {
        UIView.animate(
            withDuration: hightlightWithAnimation ? Constants.animationDuration : .zero,
            delay: .zero,
            options: [.beginFromCurrentState],
            animations: {
                animations?()
            },
            completion: nil
        )
    }
}
