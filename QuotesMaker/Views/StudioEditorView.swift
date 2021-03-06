
//
//  StudioEditorView.swift
//  QuotesMaker
//
//  Created by Shadrach Mensah on 22/03/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit




class StudioEditorView:UIView{
    
    
    enum ZoomScale:CGFloat {
        //case minimum = 1
        case `default` = 1
        case max = 4
    }
    
    var scrollValue = false{
        didSet{
            print("I was set to: ",scrollValue)
        }
    }
    
    private var _baseView:BaseView?
    
    private lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.bounces = true
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = true
        scroll.isScrollEnabled = true
        scroll.delegate = self
        scroll.minimumZoomScale = ZoomScale.default.rawValue
        scroll.zoomScale = ZoomScale.default.rawValue
        scroll.maximumZoomScale = ZoomScale.max.rawValue
        return scroll
        
    }()
    
    private lazy var containerView:UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var contentView:BaseContentView = {
        let view = BaseContentView(frame: .zero)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    private func initialize(){
        backgroundColor = .red
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        borderlize(.primary, 1)
    }
    
    func addCanvas(_ base:BaseView){
        setNeedsLayout()
        layoutIfNeeded()
        self._baseView =  base
        contentView.addSubview(base)
        let size = base.frame.size
        base.translatesAutoresizingMaskIntoConstraints = false
        print(bounds)
        //base.center = [contentView.bounds.midX,contentView.bounds.midY]
        NSLayoutConstraint.activate([
            base.centerXAnchor.constraint(equalTo: centerXAnchor),
            base.centerYAnchor.constraint(equalTo: centerYAnchor),
            base.widthAnchor.constraint(equalToConstant: size.width),
            base.heightAnchor.constraint(equalToConstant: size.height)
        ])
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size:CGSize
        if __IS_IPAD{
            size = Dimensions.editorSize
        }else{size = .zero}
        scrollView.subviews.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        subviews.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        //let scrollCons = scrollView.pinAllSides()
        if bounds.height == 0 {return}
        print("The height is: \(bounds.height)")
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant:bounds.height),
        ])
        
        
    }
    
    
    
    
}


extension StudioEditorView:UIScrollViewDelegate{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollValue{
            print("I will scrolll")
        }else{
            print("Sorry cant scroll")
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollValue = false
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return contentView
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        guard let base = _baseView else {return}
        //contentView.addSubview(base)
        //print("Scrolling with: \(view)")
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
//        guard _baseView != nil, view != nil else {return}
//        _baseView?.center = view!.center
//        _baseView?.transform.scaledBy(x: scale, y: scale)
//        guard let baseView = contentView.subviews.first(where: { v -> Bool in
//            return type(of: v) == BaseView.self
//        }) else {return}
//        baseView.center = center
        
    }
}


///Ideas ---  1. addsubview just before scrolling and remove after
// 2. translate any changes from the zooming to base viww
