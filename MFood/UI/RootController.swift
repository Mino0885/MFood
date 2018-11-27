//
//  RootController.swift
//  MFood
//
//  Created by Mino on 2018/11/27.
//  Copyright © 2018 Mino. All rights reserved.
//

import UIKit

class RootController: UITabBarController {
    
    static var currTabbar: UITabBarController?
    var tabBarVC: [UIViewController]?
    static var barMinY: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let tmpTextView = UITextView()
        self.view.addSubview(tmpTextView)
        tmpTextView.becomeFirstResponder()
        tmpTextView.resignFirstResponder()
        tmpTextView.removeFromSuperview()
        
        self.view.backgroundColor = UIColor.white
        self.delegate = self
        
        let recommendation = RecommendationViewController()
        let recommendationVC = UINavigationController(rootViewController: recommendation)
        recommendationVC.navigationItem.title = "placeholder"
        recommendationVC.tabBarItem.title = "推荐"
        recommendationVC.tabBarItem.image = #imageLiteral(resourceName: "tabbar_index")
        recommendationVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar_indexHL")
        
        let privateCustom = PrivateCustomViewController()
        let privateCustomVC = UINavigationController(rootViewController: privateCustom)
        privateCustomVC.tabBarItem.image = #imageLiteral(resourceName: "tabbar_contacts")
        privateCustomVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar_contactsHL")
        privateCustomVC.tabBarItem.title = "私人定制"
        
        let personal = PersonalViewController()
        let personalVC = UINavigationController(rootViewController: personal)
        personalVC.tabBarItem.image = #imageLiteral(resourceName: "tabbar_me")
        personalVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar_meHL")
        personalVC.tabBarItem.title = "个人"
        
        self.viewControllers = [
            recommendationVC,
            privateCustomVC,
            personalVC
        ]
        self.tabBar.tintColor = UIConfig.main_back_color
        RootController.barMinY = self.tabBar.frame.minY
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension RootController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if tabBarController.selectedViewController?.isEqual(tabBarController.viewControllers?.first) ?? false {
            if viewController.isEqual(tabBarController.selectedViewController) {
                //                NotificationCenter.default.post(name: ZalyNotificationKey.openPluginList, object: nil)
                return false
            }
        }
        return true
    }
}

