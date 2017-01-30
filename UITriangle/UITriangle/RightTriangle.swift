//
//  RightTriangle.swift
//  Triangle
//
//  Copyright © 2017 Greg Heo. All rights reserved.
//

import Foundation
import CoreGraphics

struct RightTriangle {
  let angle: Int

  init(angle: Int) {
    precondition(angle >= 0 && angle <= 90)
    self.angle = angle
  }

  init(oppositeAngle: Int) {
    precondition(oppositeAngle >= 0 && oppositeAngle <= 90)
    angle = 90 - oppositeAngle
  }
}

extension RightTriangle {
  var radians: CGFloat {
    return CGFloat(angle) * .pi / 180.0
  }

  var oppositeAngle: Int {
    return 90 - angle
  }
}
