//
//  SceneDelegate.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 12-01-24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // Castear UIScene a UIWindowScene
        guard let scene = (scene as? UIWindowScene) else { return }
        // Instanciar un objeto Window con el scene desempaquetado
        let window = UIWindow(windowScene: scene)
        // Creamos el navigator controller
        let navigationController = UINavigationController()
        // Creamos el primer view controller de nuestra aplicacion
        let loginViewController = LoginViewController()
        // Añadimos el primer view controller al navigation controller
        navigationController.setViewControllers([loginViewController], animated: true)
        // Hacemos el navigation controller el view controller base
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }



}

