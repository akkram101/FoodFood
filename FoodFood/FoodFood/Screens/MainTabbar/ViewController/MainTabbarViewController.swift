//
//  MainTabbarViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import UIKit

class MainTabbarViewController: BaseViewController {
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Setup Tabbar
    
    private func setupControllers() {
        CartManager.shared.delegate = self
        
        let vc1 = HomeFoodController()
        vc1.delegate = self
        let vc2 = CartViewController()
        let vc3 = ChatsViewController()
        let vc4 = UserProfileVC()
        
        let nav1 = createNavWith(vc: vc1, title: "Home", image: "tabbar_home")
        let nav2 = createNavWith(vc: vc2, title: "Cart", image: "tabbar_cart")
        let nav3 = createNavWith(vc: vc3, title: "Chat", image: "tabbar_chat")
        let nav4 = createNavWith(vc: vc4, title: "Profile", image: "tabbar_profile")
        
        mainTabBar.setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
    
    private func setupBadgeViews() {
        
        //Cart Badge
        mainTabBar.tabBar.addSubview(cartBadge)
        
        let cartTabbarIndex = 1
        let tabBarItems = mainTabBar.tabBar.items ?? []
        
        if cartTabbarIndex < tabBarItems.count {
            let itemWidth = mainTabBar.tabBar.frame.width / CGFloat(tabBarItems.count)
            
            let xOffset = itemWidth * CGFloat(cartTabbarIndex) + itemWidth/2 + adapt(5)
            let yOffset = adapt(5)
            
            cartBadge.frame = CGRect(x: xOffset, y: yOffset, width: adapt(14), height: adapt(14))
        }
        
        //Chat Badge
        mainTabBar.tabBar.addSubview(chatBadge)
        let chatTabbarIndex = 2
        
        if chatTabbarIndex < tabBarItems.count {
            let itemWidth = mainTabBar.tabBar.frame.width / CGFloat(tabBarItems.count)
            
            let xOffset = itemWidth * CGFloat(chatTabbarIndex) + itemWidth/2 + adapt(5)
            let yOffset = adapt(5)
            
            chatBadge.frame = CGRect(x: xOffset, y: yOffset, width: adapt(14), height: adapt(14))
        }
        
        chatBadge.counter = 6
    }
    
    private func createNavWith(vc: UIViewController, title: String?, image: String) -> UINavigationController {
        let nav = UINavigationController.init(rootViewController: vc)

        nav.tabBarItem = createTabBarItem(title: title, image: image)
        
        if title == "Cart" {
            nav.tabBarItem = cartTabBarItem
        }
        
        return nav
    }
    
    private func createTabBarItem(title: String?, image: String) -> UITabBarItem {
        let item = UITabBarItem()
        
        //Tabbar Title
        item.title = title ?? ""
        
        
        //Selected and Unselected Attributes
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGreen
        ]
        
        let unSelectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray
        ]
        
        item.setTitleTextAttributes(selectedAttributes, for: .selected)
        item.setTitleTextAttributes(unSelectedAttributes, for: .normal)
        
        
        //Tabbar Item Image
        let selectedImg = UIImage.init(named: image)
        let unselectedImage = UIImage.init(named: "\(image)_unselect")
        
        item.image = unselectedImage?.withRenderingMode(.alwaysOriginal)
        item.selectedImage = selectedImg?.withRenderingMode(.alwaysOriginal)
        
        return item
    }
    
    private func addTabbarShadow() {
        mainTabBar.tabBar.layer.shadowRadius = 3
        mainTabBar.tabBar.layer.shadowOpacity = 0.1
        mainTabBar.tabBar.layer.shadowColor = UIColor.systemGray.cgColor
        mainTabBar.tabBar.layer.shadowOffset = CGSize(width: 0, height: adapt(-3))
        mainTabBar.tabBar.clipsToBounds = false
    }
    
    private func setupUI() {
        setupBadgeViews()
        addTabbarShadow()
    }
    
    //MARK: - Add Notifications
    private func addNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(showTabbar), name: Notifications.showTabBar, object: nil)
    }
    
    //MARK: - Animations
    
    private let animateUpDuration: TimeInterval = 0.8
    private let animateDownDuration: TimeInterval = 0.4
    
    private lazy var minTabbarY: CGFloat = self.view.frame.height - self.mainTabBar.tabBar.frame.size.height
    private lazy var maxTabbarY: CGFloat = self.view.frame.height + self.mainTabBar.tabBar.frame.size.height

    func animateTabBar(to targetY: CGFloat,withDuration duration: TimeInterval) {
        guard targetY >= minTabbarY, targetY <= maxTabbarY else { return }
        
        UIView.animate(withDuration: duration) {
            self.mainTabBar.tabBar.frame.origin.y = targetY
        }
    }
    
    @objc func hideTabbar() {
        animateTabBar(to: maxTabbarY, withDuration: animateUpDuration)
    }
    
    @objc func showTabbar() {
       animateTabBar(to: minTabbarY, withDuration: animateDownDuration)
    }
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupUI()
        addNotifications()
        
        addChild(mainTabBar)
        view.addSubview(mainTabBar.view)
        
        mainTabBar.didMove(toParent: self)
    }
    
    //MARK: - Lazy Load
    
    private lazy var mainTabBar: UITabBarController = {
        let tabbarVC = UITabBarController.init()
        tabbarVC.tabBar.backgroundColor = .white
        
        return tabbarVC
    }()
    
    lazy var cartTabBarItem: UITabBarItem = {
        let item = createTabBarItem(title: "Cart", image: "tabbar_cart")
    
        return item
    }()
    
    private lazy var cartBadge: RedBadgeView = RedBadgeView()
    private lazy var chatBadge: RedBadgeView = RedBadgeView()

}

extension MainTabbarViewController: CartManagerDelegate {
    func addedToCart() {
        
        UIView.animateKeyframes(withDuration: RedBadgeView.animationDuration, delay: 0.0) {
            self.cartBadge.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { _ in
            self.cartBadge.counter = CartManager.counter
            UIView.animate(withDuration: RedBadgeView.animationDuration) {
                self.cartBadge.transform = .identity
            }
        }
    }
}
