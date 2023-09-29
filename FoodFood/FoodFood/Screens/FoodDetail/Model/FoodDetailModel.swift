//
//  FoodDetailModel.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import Foundation

class FoodDetailModel {
    var baseModel: BaseFoodModel = BaseFoodModel()
    var description: String = ""
    let distance: Int = Int.random(in: 1...99)
    let rating: CGFloat = CGFloat.random(in: 3...5)
    let orderCount: Int = Int.random(in: 1...1000)
    
    static let style = """
    <style>
        p, ul, li {
            line-height: 1.8;
            font-size: 13px;
        }
    </style>
    """
    
    class func getDescription(productID: String) -> String {
        var description = ""
        if productID == BaseFoodFactory.productID1 {
            description = """
    Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.
    <ul>
        <li>Strowberry</li>
        <li>Cream</li>
        <li>wheat</li>
    </ul>
    <br>
    Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.
    """
        } else if productID == BaseFoodFactory.productID2 {
            description = """
    South American tallarines verdes (green noodles) have a green pasta sauce made with both spinach and basil, similar to a pesto sauce. The sauce also has lots of queso fresco cheese and is creamier than traditional pesto sauce.
    <br>
    <br>
    
    These noodles might just become a staple around your house as they're so good and so easy to make. Simply cook the pasta, make the sauce, and then toss them together. In about 30 minutes, this dish can be on the table, making it perfect for a weeknight dinner.
    <br><br>
    Serve these delicious noodles as a main course with boiled yellow potatoes and green beans, or as a side dish to accompany steak or chicken.
    """
        } else if productID == BaseFoodFactory.productID3 {
            description = """
    A dish and cooking process native to the Philippines, adobo refers to the method of marinating meat, seafood, or vegetables (pretty much anything!) in a combination of soy sauce and vinegar. This marinade also includes other herbs and flavorings like garlic, bay leaves, and whole peppercorns.
    <br><br>
    Cooking food in vinegar is no foreign concept to us Filipinos. In pre-colonial times, our ancestors used to cook seafood in vinegar in order to preserve their freshness. Many regard adobo as a spin on kinilaw, which is another traditional cooking method. Kinilaw refers mainly to cooking raw seafood in vinegar and spices. Another similar process is paksiw, which utilizes meat broth in vinegar and spices.
    """
        } else if productID == BaseFoodFactory.productID4 {
            description = """
Can't get to Wisconsin to enjoy a mouthwatering ooey-gooey butter burger? It's super-easy to make them at home!
<br><br>
Wisconsin has long been famous for its dairy production, producing more cheese and butter than any other state, so it's no wonder the butter burger was created in that state. An authentic butter burger is made with lean ground beef, preferably sirloin, and a generous amount of butter. Hot cooked chopped onions are usually layered on the burgers along with a slice of cheese if you like. If you crave additional toppings, feel free to add them to the bottom bun before you add the hamburger patty.
"""
    } else if productID == BaseFoodFactory.productID5 {
            description = """
Pulled chicken is versatile and easy to adapt to a wide range of recipes, from tacos to sandwiches to salads. It also happens to be incredibly easy to make, especially if you use the Instant Pot. The pressure cooker function makes the process quick and frees you up to prep other dishes or make a homemade sauce.
<br><br>
All you'll need is some chicken breasts and broth. Add a few garlic cloves and a bay leaf for flavor if you have them handy. The chicken cooks in just 5 minutes (plus a few minutes for the cooker to come up to pressure and release). By shredding the chicken directly in the cooking liquid, it stays nice and moist. After shredding, you're ready to chow down or pack away the chicken for meal prep.
"""
    } else if productID == BaseFoodFactory.productID6 {
        description = """
Whether you're working with a rib-eye, New York strip, or any other cut of your choice, there's truly no better way to cook a steak a home than with a cast-iron pan. The sizzling hot pan helps you get a beautiful golden-brown sear, while the technique of finishing the steaks in the oven helps prevent overcooking.
<br><br>
A cast-iron pan may not give you the same picture-perfect marks or smoky flavor as the grill, but many prefer pan-seared steaks because they have better, more uniform browning—and more browning equals more flavor. Once you learn a few tricks, you can create a restaurant-quality steak dinner in just a few minutes at home.
"""
    } else if productID == BaseFoodFactory.productID7 {
        description = """
If you love fried fish but you'd rather not have to deal with the oil and hassle of frying, this delicious baked haddock with a crispy panko crust is the recipe for you. If you can't find haddock, other mild white fish like cod and catfish also work very well in this recipe.
<br><br>
Serve the fillets with wedges of lemon or a homemade tartar sauce or rémoulade and add a side of baked french fries or roasted potatoes for a satisfying meal. For a lighter dinner, serve the fish fillets atop a bed of arugula or with some simple steamed vegetables. Or stuff the fillets into buns with all the fixings for a wonderful fish sandwich. So many possibilities!
"""
    } else if productID == BaseFoodFactory.productID8 {
        description = """
Broccoli rabe (aka broccoli raab or rapini) is a bitter green more closely related to turnips than broccoli. It looks a bit like a leggy, leafy version of broccoli, but it has a bracing bitterness that adds a lovely zest to pasta dishes.
<br><br>
Choose bunches that have dark leafy greens with no yellowing and thin stalks (no thicker than a pencil) for the best texture and flavor. To tame some of the bitterness, blanch the rabe in boiling water, as in this recipe, before adding it to dishes. If you can’t find rabe, substitute broccoli, broccolini, or young turnip greens and proceed with the recipe as directed.
<br><br>
To balance the bitterness of the rabe here, it is paired with browned sweet Italian sausage and shallots. A pinch of red chile flakes will spice the dish up, but it’s optional.
"""
    } else if productID == BaseFoodFactory.productID9 {
        description = """
If you’re new to grilling or just new to grilling burgers you’re probably feeling a little overwhelmed by the firehose of information available. You’ll read about endless hacks and gimmicks for grilling the best burger, and if you’re like me you might walk away feeling even less sure about what to do than when you started.
<br><br>
But I’m here to deliver some good news: the best burger is really simple. In my testing, I found that every time I tried to complicate things in search of a better burger, it just didn’t pay off. A really great grilled burger is all about the beef and the char. Season it simply, handle it minimally, and cook it hot and fast and you’re well on your way to the ideal burger.
"""
    } else if productID == BaseFoodFactory.productID10 {
        description = """
This Tex Mex recipe was inspired by my recipe for Mexican Pizza, the first recipe I ever developed. The combination of refried beans in the meat adds fabulous flavor and texture and solves the problem of a well-done burger, which is usually dry. Just 1/3 cup of refried beans is enough to add wonderful moisture to the meat.
<br><br>
When you cook burgers, especially on the grill, it's important that they are covered to hold in the heat. Make sure the grill grate is thoroughly cleaned, and oil it very lightly before you add the burgers. Don't press down on the burgers while they cook, because you'll just press out all the juice and the burgers will be dry. Turn the burgers only once, and carefully. And always make sure that the meat - any ground meat - is cooked to 160°F as tested with a reliable meat thermometer before you serve it.
"""
    }
        
        return String(format: "%@<p>%@</p>", FoodDetailModel.style,description)
    }
    
}
