//
//  MainTabBarController.swift
//  LayoutPractice
//
//  Created by 정지현 on 2021/02/27.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    let firstVC = FirstViewController()
    let secondVC = SecondViewController()
    let thirdVC = ThirdViewController()
    let fourthVC = FourthViewController()
    
    let firstTabBarItem = UITabBarItem(title: "FIRST", image: UIImage(systemName: "house"), tag: 0)
    let secondTabBarItem = UITabBarItem(title: "SECOND", image: UIImage(systemName: "book"), tag: 1)
    let thirdTabBarItem = UITabBarItem(title: "THIRD", image: UIImage(systemName: "message"), tag: 2)
    let fourthTabBarItem = UITabBarItem(title: "FOURTH", image: UIImage(systemName: "person"), tag: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstNavigationController = UINavigationController(rootViewController: firstVC)
        let secondNavigationController = UINavigationController(rootViewController: secondVC)
        let thirdNavigationController = UINavigationController(rootViewController: thirdVC)
        let fourthNavigationController = UINavigationController(rootViewController: fourthVC)
        
        firstNavigationController.tabBarItem = self.firstTabBarItem
        secondNavigationController.tabBarItem = self.secondTabBarItem
        thirdNavigationController.tabBarItem = self.thirdTabBarItem
        fourthNavigationController.tabBarItem = self.fourthTabBarItem
        
        self.viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController, fourthNavigationController]
    }
}
