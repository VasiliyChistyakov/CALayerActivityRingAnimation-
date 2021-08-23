//
//  ViewController.swift
//  newProject
//
//  Created by Чистяков Василий Александрович on 23.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let shape = CAShapeLayer()
    
    private let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Calorie Goal"
        label.font = .systemFont(ofSize: 36, weight: .light)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        
        let cirlcePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = cirlcePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
      
        shape.path = cirlcePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        
        view.layer.addSublayer(shape)
        
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height - 70, width: view.frame.size.width - 40, height: 50))
        view.addSubview(button)
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        // Анимация
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
}


