//
//  RightTriangle.swift
//  Triangles
//
//  Copyright © 2017 Greg Heo. All rights reserved.
//

import Foundation
import CoreGraphics

public struct RightTriangle {
  public let angle: Int

  public init(angle: Int) {
    precondition(angle >= 0 && angle <= 90)
    self.angle = angle
  }

  public init(oppositeAngle: Int) {
    precondition(oppositeAngle >= 0 && oppositeAngle <= 90)
    angle = 90 - oppositeAngle
  }
}

extension RightTriangle {
  public var radians: CGFloat {
    return CGFloat(angle) * .pi / 180.0
  }

  public var oppositeAngle: Int {
    return 90 - angle
  }
}
