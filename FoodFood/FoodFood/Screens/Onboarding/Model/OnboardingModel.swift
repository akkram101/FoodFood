//
//  OnboardingModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/13/23.
//

import Foundation
 
class OnboardingModel {
    let mainTitle: String
    let subTitle: String
    let imgStr: String
    
    init(mainTitle: String, subTitle: String, imgStr: String) {
        self.mainTitle = mainTitle
        self.subTitle = subTitle
        self.imgStr = imgStr
    }
}

class OnboardingFactory {
    
    class func createSteps() -> [OnboardingModel] {
        let step1 = OnboardingModel(mainTitle: "Find your Comfort\n Food Here",
                                    subTitle: "Here You Can find a chef or dish for every\n taste and color. Enjoy",
                                    imgStr: "onBoardImg1")
        
        let step2 = OnboardingModel(mainTitle: "Food Ninja is Where Your\nComfort Food Lives",
                                    subTitle: "Enjoy a fast and smooth food delivery at\n your doorstep",
                                    imgStr: "onBoardImg2")
        
        
        return [step1, step2]
    }    
}
