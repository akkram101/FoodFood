//
//  FoodDetailModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import Foundation

class FoodDetailModel {
    var foodName: String = ""
    var imageName: String = ""
    let description: String = FoodDetailModel.randomDescription()
    let distance: Int = Int.random(in: 1...99)
    let rating: CGFloat = CGFloat.random(in: 3...5)
    let orderCount: Int = Int.random(in: 1...1000)
    
    class func randomDescription() -> String {
        return FoodDetailModel.descriptionArrays.randomElement() ?? ""
    }
    
    static let descriptionArrays = ["""
<style>
    p, ul, li {
        line-height: 1.8;
        font-size: 13px;
    }
</style>

<p>Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.</p>
<ul>
    <li>Strowberry</li>
    <li>Cream</li>
    <li>wheat</li>
</ul>
</br>
<p>Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.</p>
""",
                                    
                                    
"""
<style>
    p, ul, li {
        line-height: 1.8;
        font-size: 13px;
    }
</style>

<p>2140-3940 CALORIES</p></br>
<p>10 Pieces (5 legs, 5 thighs) of our signature crispy juicy bone-in fried chicken. Served with a side of gravy for dipping. Choose from regular and spicy.
</p>
""",
                                    
                                    
"""
<style>
    p, ul, li {
        line-height: 1.8;
        font-size: 13px;
    }
</style>

<p>610 CALORIES</p></br>
<p>Our unique spaghetti topped with Jollibee&rsquo;s signature sweet-style sauce, loaded with chunky slices of savory ham, ground meat, and hotdog.
</p>
"""]
    
    
}
