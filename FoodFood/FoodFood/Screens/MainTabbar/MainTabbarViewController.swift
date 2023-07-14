//
//  MainTabbarViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import UIKit

class MainTabbarViewController: BaseViewController {
    
    private func setupControllers() {
        let vc1 = HomeFoodController()
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .systemBlue
        
        let vc3 = HomeFoodController()
        vc3.view.backgroundColor = .systemPink
        
        let vc4 = HomeFoodController()
        vc4.view.backgroundColor = .systemGray
        
        let nav1 = createNavWith(vc: vc1, title: "Home", image: "tabbar_home")
        let nav2 = createNavWith(vc: vc2, title: nil, image: "tabbar_profile")
        let nav3 = createNavWith(vc: vc3, title: nil, image: "tabbar_cart")
        let nav4 = createNavWith(vc: vc4, title: nil, image: "tabbar_chat")
        
        mainTabBar.setViewControllers([nav1, nav2, nav3, nav4], animated: false)
    }
    
    private func createNavWith(vc: UIViewController, title: String?, image: String) -> UINavigationController {
        let nav = UINavigationController.init(rootViewController: vc)
        nav.tabBarItem.title = title ?? ""
        let image = UIImage.init(named: image)
        
        nav.tabBarItem.image = image?.withRenderingMode(.alwaysOriginal)
        
        return nav
    }
    
    private func checkLoginAndPresentAuthentication() {
        SessionManager.isLogin = false
        if SessionManager.isLogin == false {
            let vc = SignUpViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        addChild(mainTabBar)
        view.addSubview(mainTabBar.view)
        
        mainTabBar.didMove(toParent: self)
        
        checkLoginAndPresentAuthentication()
    }
    
    private lazy var mainTabBar: UITabBarController = {
        let tabbarVC = UITabBarController.init()
        
        return tabbarVC
    }()

}
