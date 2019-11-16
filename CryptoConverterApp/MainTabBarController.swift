//
//  MainTabBarController.swift
//  CryptoConverterApp
//
//  Created by Владимир Файб on 16.11.2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    viewControllers = [
      generateViewController(rootViewController: SeachViewController(), image: "magnifyingglass", title: "Search"),
      generateViewController(rootViewController: ViewController(), image: "arrow.2.circlepath.circle", title: "Convert")
    ]
  }
  private func generateViewController(rootViewController: UIViewController, image: String, title: String) -> UIViewController {
    
    let navigationVC = UINavigationController(rootViewController: rootViewController)
    navigationVC.tabBarItem.title = title
    navigationVC.tabBarItem.image = UIImage(systemName: image)
    rootViewController.navigationItem.title = title
    navigationVC.navigationBar.prefersLargeTitles = true
    
    return navigationVC
  }
}
