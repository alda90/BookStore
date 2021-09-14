//
//  MainViewController.swift
//  BookStore
//
//  Created by AlDAIR cARRILO  on 13/09/21.
//  Copyright © 2021 CGTI. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Holi")

        let vc1 = UINavigationController(rootViewController: BookListViewController())
        let vc2 = UINavigationController(rootViewController: BookListViewController())
        let vc3 = UINavigationController(rootViewController: BookListViewController())
        let vc4 = UINavigationController(rootViewController: BookListViewController())
        
        vc1.title = "Best Sellers"
        vc2.title = "History"
        vc3.title = "Science"
        vc4.title = "Busniess"
        
        self.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        
        guard let items =  self.tabBar.items else { return }
        
        for x in 0..<items.count {
            items[x].tag = x
        }
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item")
        
        switch item.tag {
        case 0:
            section = "Best Sellers"
        case 1:
            section = "History"
        case 2:
            section = "Science"
        case 3:
            section = "Business"
        default:
            section = "Best Sellers"
        }
        
        
    }
  
    
  

}
