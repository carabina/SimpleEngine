//
//  ObjectView.swift
//  SimpleEngine
//
//  Created by abedalkareem omreyh on 7/21/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

///
/// The parent class for the `NodeView` and `SpriteView`.
/// this has the common properties and methods like the update method and the type property
///
@IBDesignable
open class ObjectView: UIView {

  // MARK: - IBInspectables

  ///
  /// The type of the `ObjectView` is a unique number for the same kind of objects, like the trees or enemy.
  /// This will be used when to object collides together. and if should the object stop when colliding with another object.
  ///
  @IBInspectable open var type: Int = 0

  // MARK: - Properties

  ///
  /// A unique id for each object.
  ///
  open var id: String = { return UUID().uuidString }()

  // MARK: - Private properties

  private var timer: Timer?

  // MARK: - init

  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  private func setup() {
    timer = Timer.scheduledTimer(timeInterval: 0.016, target: self, selector: #selector(update), userInfo: nil, repeats: true)
  }

  // MARK: - View lifecycle

  open override func didMoveToSuperview() {
    super.didMoveToSuperview()
    if superview == nil {
      stopTimer()
    }
  }

  private func stopTimer() {
    timer?.invalidate()
    timer = nil
  }

  // MARK: -

  @objc
  open func update() { }

  ///
  /// A method will be called when any object collided with this object.
  ///
  /// - Parameter object: The object the collided.
  ///
  /// - Returns: Return true if the object should report the collide to the view controller.
  /// The defualt is `true`.
  ///
  @discardableResult
  open func onCollisionEnter(with object: ObjectView?) -> Bool {
    return true
  }
}
