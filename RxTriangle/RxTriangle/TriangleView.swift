//
//  TriangleView.swift
//  Triangles
//
//  Copyright © 2017 Greg Heo. All rights reserved.
//

import UIKit
import CoreGraphics

private let kStrokeWidth: CGFloat = 4.0

public class TriangleView: UIView {
  public var triangle: RightTriangle? {
    didSet {
      setNeedsDisplay(bounds)
    }
  }

  public init() {
    super.init(frame: CGRect.zero)

    backgroundColor = .white
    layer.setAffineTransform(CGAffineTransform(scaleX: 1.0, y: -1.0))
  }

  required public init?(coder aDecoder: NSCoder) {
    return nil
  }

  override public func draw(_ rect: CGRect) {
    super.draw(rect)

    guard let triangle = triangle else { return }

    UIColor.black.setStroke()

    let path = UIBezierPath()
    path.lineWidth = kStrokeWidth

    let origin = CGPoint(x: kStrokeWidth, y: kStrokeWidth)
    let topPoint = CGPoint(x: CGFloat(cos(triangle.radians)) * (bounds.size.width - kStrokeWidth * 2) + kStrokeWidth,
                           y: CGFloat(sin(triangle.radians)) * (bounds.size.height - kStrokeWidth * 2) + kStrokeWidth)

    path.move(to: origin)
    path.addLine(to: topPoint)
    path.addLine(to: topPoint)
    path.addLine(to: CGPoint(x: topPoint.x, y: kStrokeWidth))
    path.addLine(to: origin)
    path.addLine(to: topPoint)

    path.stroke()
  }
  
}
