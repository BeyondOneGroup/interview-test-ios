import Foundation
import UIKit

class PokemonViewModelUIKit {
    private(set) var pokemons: [Pokemon] = []
    private(set) var isLoading = false
    
    // Closure for handling UI updates
    var onPokemonsUpdated: (() -> Void)?
    var onLoadingStatusChanged: ((Bool) -> Void)?
    var onErrorOccurred: (() -> Void)?
    
    func loadPokemons() {
        isLoading = true
        onLoadingStatusChanged?(true)
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=50")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.onLoadingStatusChanged?(false)
                
                if let error = error {
                    print("Error fetching pokemons: \(error)")
                    self.onErrorOccurred?()
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    self.onErrorOccurred?()
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(PokemonResponse.self, from: data)
                    self.pokemons = response.results
                    self.onPokemonsUpdated?()
                } catch {
                    print("Error decoding pokemons: \(error)")
                    self.onErrorOccurred?()
                }
            }
        }
        
        task.resume()
    }
}
