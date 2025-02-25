import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create the window and set its size
        window = UIWindow(windowScene: windowScene)
        
        // Create the root view controller
        let pokemonListViewController = PokemonListViewController()
        let navigationController = UINavigationController(rootViewController: pokemonListViewController)
        
        // Set the root view controller
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called when a scene is being released by the system
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when a scene has moved from an inactive state to an active state
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when a scene will move from an active state to an inactive state
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as a scene transitions from the background to the foreground
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as a scene transitions from the foreground to the background
    }
}
