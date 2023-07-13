//
//  DataSource.swift
//  RGBA3
//
//  Created by 本杉春奈 on 2023/07/07.
//

import UIKit

class RGBA{
    
    var rValue:CGFloat
    var gValue:CGFloat
    var bValue:CGFloat
    var aValue:CGFloat
    
    var haku:UInt8
    
    init(rValue:CGFloat = (1.0),gValue:CGFloat = (1.0),bValue:CGFloat = (1.0),aValue:CGFloat = (1.0),haku:UInt8 = 0) {
        self.rValue = rValue
        self.gValue = gValue
        self.bValue = bValue
        self.aValue = aValue
        self.haku = haku
    }
    
//    
//    
    func R(tmp:Float){
        haku = UInt8(tmp)
        rValue = CGFloat(tmp/255)
    }
////    func G() -> <#return type#> {
//        <#function body#>
//    }
//    func B() -> <#return type#> {
//        <#function body#>
//    }
//    func A() -> <#return type#> {
//        <#function body#>
//    }
//    
}
