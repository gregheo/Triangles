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

    // Observable for angle slider: Float -> RightTriangle
    let angleObservable =
      angleSlider.rx.value
        .map({ (angle: Float) in
          return RightTriangle(angle: Int(angle))
        })
    // Observable for opposite angle slider: Float -> RightTriangle
    let oppositeAngleObservable =
      oppositeAngleSlider.rx.value.map {
        RightTriangle(oppositeAngle: Int($0))
      }
    // Merged observable of triangles
    let triangleProvidingObservable =
      Observable.of(angleObservable, oppositeAngleObservable)
      .merge()

    // Binding for text label
    triangleProvidingObservable
      .map({ triangle in
        return "Angle: \(triangle.angle)°\nOpposite angle: \(triangle.oppositeAngle)°"
      })
      .bindTo(label.rx.text)
      .addDisposableTo(disposeBag)
    // binding for opposite angle slider (when angle slider changes)
    angleObservable
      .map({ Float($0.oppositeAngle) })
      .bindTo(oppositeAngleSlider.rx.value)
      .addDisposableTo(disposeBag)
    // binding for angle slider (when opposite angle slider changes)
    oppositeAngleObservable
      .map({ Float($0.angle) })
      .bindTo(angleSlider.rx.value)
      .addDisposableTo(disposeBag)
    // subscription for re-drawing triangle view
    triangleProvidingObservable
      .subscribe(onNext: { (triangle: RightTriangle) in
        self.triangleView.triangle = triangle
      })
      .addDisposableTo(disposeBag)
  }

}
