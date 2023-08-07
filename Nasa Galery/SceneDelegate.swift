//
//  SceneDelegate.swift
//  Nasa Galery
//
//  Created by Projeto Apraxia on 03/08/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: PhotoViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
