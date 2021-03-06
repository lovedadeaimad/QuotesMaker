//
//  Extensions.swift
//  QuotesMaker
//
//  Created by Shadrach Mensah on 28/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


extension CGRect{
    
    
    
}


extension UIDevice{
    
    class var idiom:UIUserInterfaceIdiom{
        return current.userInterfaceIdiom
    }
}


extension CGFloat{
    static var fixedWidth:CGFloat{
        let idiom = UIDevice.current.userInterfaceIdiom
        if idiom == .phone{
            return UIScreen.main.bounds.width * 0.9
        }else if idiom == .pad{
            return 500
        }
        return 0
    }
    
    static var fixedHeight:CGFloat{
        return UIScreen.main.bounds.height * 0.8
    }
    
        
    static func Angle(_ degree:CGFloat)-> CGFloat{
        return (.pi * degree) / 180
    }
}




extension Array{
    
    mutating func push(_ element:Element){
        if count > 10 {
            self = Array(dropFirst())
            append(element)
        }else{
            append(element)
        }
    }
    
    mutating func pop()->Element{
        return popLast()!
    }
    
    var isMulti:Bool{
        return count > 1
    }
}


extension Int{
    
    func nsNumber()->NSNumber{
        return NSNumber(value: self)
    }
}


extension UIView{
    
    
    
    
}




extension UIScrollView{
    
    class func panelScrollView()->UIScrollView{
        let scroll = UIScrollView(frame: .zero)
        scroll.bounces = true
        scroll.isScrollEnabled = true
        return scroll
    }
}


extension UIImage{
    
    class func image(for tab:StudioTab.TabActions)->UIImage{
        switch tab {
        case .stylePanel:
           return #imageLiteral(resourceName: "panel")
        case .moveUp:
            return #imageLiteral(resourceName: "mup")
        case .moveDown:
            return #imageLiteral(resourceName: "mdw")
        case .delete:
            return #imageLiteral(resourceName: "delete")
        case .layers:
            return #imageLiteral(resourceName: "stack")
        case .fill:
            return #imageLiteral(resourceName: "paint")
        case .gradient:
            return #imageLiteral(resourceName: "ic_grad")
        case .imgPanel:
            return #imageLiteral(resourceName: "img_ic")
        case .undo:
            return #imageLiteral(resourceName: "undo_arrow")
        case .redo:
            return #imageLiteral(resourceName: "redo_arrow")
        }
    }
}



extension UIViewController {
        func add(_ child: UIViewController, to parentView:UIView? = nil) {
            addChild(child)
            if let v = parentView{
                v.addSubview(child.view)
            }else{
                view.addSubview(child.view)
            }
            child.didMove(toParent: self)
        }
        
        func removeFrom() {
            guard parent != nil else {
                return
            }
            
            willMove(toParent: nil)
            removeFromParent()
            
            view.removeFromSuperview()
        }
        
}
