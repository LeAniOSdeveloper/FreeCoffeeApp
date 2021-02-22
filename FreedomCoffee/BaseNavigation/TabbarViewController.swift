//
//  TabbarViewController.swift
//  FreedomCoffee
//
//  Created by Ân Lê on 21/02/2021.
//

import UIKit

enum TabbarItemTag: Int {
    case firstViewController = 101
    case secondViewConroller = 102
}
class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    func setup(){
//        tabBar.backgroundColor = .black
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        tabBar.isTranslucent = false
        
        let homeview = Main_storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let  navHome = HomeNavViewController(rootViewController: homeview)
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "icons8-home-24 (3)"), selectedImage: UIImage(named: "icons8-home-24 (2)"))
     
        
        
        let searchView = Main_storyboard.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        let navSearchView = SearchNavViewController(rootViewController: searchView)
        navSearchView.tabBarItem.title = "hellp"
        navSearchView.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "icons8-search-24"), tag :102)
        
        
        self.viewControllers = [navHome,navSearchView]
    }
    

  
    
    private func animate(_ imageView : UIImageView){
        UIView.animate(withDuration: 0.1, animations: {
                   imageView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
               }) { _ in
                   UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: .curveEaseInOut, animations: {
                       imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                   }, completion: nil)
               }
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        
        let timeInterval: TimeInterval = 0.7
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.9) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.25, y: 1.25)
            
               }
   
        barItemView.tintColor = .white
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
               propertyAnimator.startAnimation()
        
       
    }
  
}
