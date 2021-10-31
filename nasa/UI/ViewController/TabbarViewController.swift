//
//  TabbarViewController.swift
//  nasa
//
//  Created by Mustafa Çağrı Peker on 29.10.2021.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        
        self.viewControllers = [vc1,vc2,vc3]
        
        self.tabBar.items?[0].title = "Curiosity"
        self.tabBar.items?[1].title = "Opportunity"
        self.tabBar.items?[2].title = "Spirit"
        
        self.tabBar.items?[0].image = UIImage(named: "rover1")
        self.tabBar.items?[1].image = UIImage(named: "rover2")
        self.tabBar.items?[2].image = UIImage(named: "rover3")
        
    }
    

    

}
