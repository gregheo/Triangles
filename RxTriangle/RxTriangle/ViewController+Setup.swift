//
//  ViewController+Setup.swift
//  RxTriangle
//
//  Copyright © 2017 Greg Heo. All rights reserved.
//

import UIKit

extension ViewController {
  func setupViews() {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 20
    view.addSubview(stackView)

    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|-[stackView]-|", options: [], metrics: nil, views: ["stackView": stackView]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[stackView]", options: [], metrics: nil, views: ["stackView": stackView]))

    triangleView = TriangleView()
    triangleView.translatesAutoresizingMaskIntoConstraints = false

    angleSlider = UISlider()
    angleSlider.translatesAutoresizingMaskIntoConstraints = false
    angleSlider.isContinuous = true
    angleSlider.minimumValue = 0
    angleSlider.maximumValue = 90
    angleSlider.value = 45

    oppositeAngleSlider = UISlider()
    oppositeAngleSlider.translatesAutoresizingMaskIntoConstraints = false
    oppositeAngleSlider.isContinuous = true
    oppositeAngleSlider.minimumValue = 0
    oppositeAngleSlider.maximumValue = 90
    oppositeAngleSlider.value = 45

    label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 2

    stackView.addArrangedSubview(triangleView)
    stackView.addArrangedSubview(angleSlider)
    stackView.addArrangedSubview(oppositeAngleSlider)
    stackView.addArrangedSubview(label)

    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|[triangleView]|", options: [], metrics: nil, views: ["triangleView": triangleView]))
    NSLayoutConstraint.activate([NSLayoutConstraint(item: triangleView, attribute: .width, relatedBy: .equal, toItem: triangleView, attribute: .height, multiplier: 1.0, constant: 0)])

    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|[view]|", options: [], metrics: nil, views: ["view": angleSlider]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|[view]|", options: [], metrics: nil, views: ["view": oppositeAngleSlider]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|[view]|", options: [], metrics: nil, views: ["view": label]))
  }
  
}
