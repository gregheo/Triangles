//
//  ViewController.swift
//  RxTriangle
//
//  Copyright © 2017 Greg Heo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  var triangleView: TriangleView!
  var angleSlider: UISlider!
  var oppositeAngleSlider: UISlider!
  var label: UILabel!
  var triangle = RightTriangle(angle: 45)

  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()
    updateUI()

    angleSlider.addTarget(self, action: #selector(angleSliderChanged(sender:)), for: .valueChanged)
    oppositeAngleSlider.addTarget(self, action: #selector(oppositeAngleSliderChanged(sender:)), for: .valueChanged)
  }

  func angleSliderChanged(sender: UISlider) {
    triangle = RightTriangle(angle: Int(sender.value))
    oppositeAngleSlider.value = Float(triangle.oppositeAngle)
    updateUI()
  }

  func oppositeAngleSliderChanged(sender: UISlider) {
    triangle = RightTriangle(oppositeAngle: Int(sender.value))
    angleSlider.value = Float(triangle.angle)
    updateUI()
  }

  func updateUI() {
    triangleView.triangle = triangle
    label.text = "Angle: \(triangle.angle)°\nOpposite angle: \(triangle.oppositeAngle)°"
  }

}
