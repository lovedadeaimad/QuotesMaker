//
//  GradientOptionsView.swift
//  QuotesMaker
//
//  Created by Shadrach Mensah on 02/03/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

//Height = 200

class GradientOptionsView: MaterialView {
    
    lazy var titleLable:BasicLabel = {
        let lable = BasicLabel(frame: .zero)
        lable.text = "Customize Gradients"
        return lable
    }()
    
    private let insets:CGFloat = 12
    private let horizontalmargin:CGFloat = 8
    private let verticalMargin:CGFloat = 16
    
    lazy var stepperTitle:BasicLabel = {
        let lable = BasicLabel(frame: .zero)
        lable.text = "Add / Remove Colors"
        lable.font = .systemFont(ofSize: 16, weight: .regular)
        return lable
    }()
    
    lazy var gradientSegments:UISegmentedControl = {
        let segment = UISegmentedControl(frame: .zero)
        segment.insertSegment(withTitle: "1", at: 0, animated: true)
        segment.insertSegment(withTitle: "2", at: 1, animated: true)
        segment.tintColor = .gray
        return segment
    }()
    
    lazy var stepper:UIStepper = {
        let stepper = UIStepper(frame: .zero)
        stepper.maximumValue = 4
        stepper.minimumValue = 2
        stepper.stepValue = 1
        stepper.tintColor = .primary
        return stepper
    }()
    
    lazy var colorSlider:ColorSlider = {
        let slider = ColorSlider(orientation: .horizontal, previewSide: .top)
        return slider
    }()
    
    lazy var locationSlider:UISlider = {
       let slider  = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.isContinuous = true
        return slider
    }()
    
    lazy var locationTitle:BasicLabel = {
        let lable = BasicLabel(frame: .zero,font: .systemFont(ofSize: 16, weight: .regular))
        lable.text = "Set Gradient Location"
        return lable
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit(){
        backgroundColor = .white
        addSubview(titleLable)
        addSubview(gradientSegments)
        addSubview(stepperTitle)
        addSubview(stepper)
        addSubview(colorSlider)
        addSubview(locationTitle)
        addSubview(locationSlider)
        gradientSegments.addTarget(self, action: #selector(gradSegmentChanged(_:)), for: .valueChanged)
        colorSlider.addTarget(self, action: #selector(colorSliderChanged(_:)), for: .valueChanged)
        stepper.addTarget(self, action: #selector(stepperChanged(_:)), for: .valueChanged)
        locationSlider.addTarget(self, action: #selector(locationSliderChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func gradSegmentChanged(_ sender:UISegmentedControl){
        
    }
    
    @objc func colorSliderChanged(_ slider:ColorSlider){
        
    }
    
    @objc func stepperChanged(_ sender:UIStepper){
        
        let newIndex = Int(sender.value)
        guard newIndex < 5 else{return}
        if newIndex < gradientSegments.numberOfSegments{
            gradientSegments.removeSegment(at: newIndex, animated: true)
        }else{
            gradientSegments.insertSegment(withTitle: "\(newIndex)", at: newIndex - 1, animated: true)
        }
        
        
    }
    
    @objc func locationSliderChanged(_ slider:UISlider){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        subviews.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor, constant: insets),
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            gradientSegments.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: verticalMargin),
            gradientSegments.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets),
            gradientSegments.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets),
            gradientSegments.heightAnchor.constraint(equalToConstant: 28),
            stepperTitle.topAnchor.constraint(equalTo: gradientSegments.bottomAnchor, constant: verticalMargin),
            stepperTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets),
            stepper.topAnchor.constraint(equalTo: gradientSegments.bottomAnchor, constant: verticalMargin),
            stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets),
            stepper.heightAnchor.constraint(equalToConstant: 20),
            //stepper.widthAnchor.constraint(equalToConstant: 40),
            colorSlider.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: verticalMargin),
            colorSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets),
            colorSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets),
            colorSlider.heightAnchor.constraint(equalToConstant: 20),
            locationTitle.topAnchor.constraint(equalTo: colorSlider.bottomAnchor, constant: verticalMargin),
            locationTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets),
            locationSlider.topAnchor.constraint(equalTo: locationTitle.bottomAnchor, constant: verticalMargin),
            locationSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets),
            locationSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets),
            locationSlider.heightAnchor.constraint(equalToConstant: 20),
        ])
    }

}
