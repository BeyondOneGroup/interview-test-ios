import Foundation
import SwiftUI

@MainActor
class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading = false
    @Published var showError = false
    
    func loadPokemons() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=50")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(PokemonResponse.self, from: data)
            pokemons = response.results
        } catch {
            showError = true
        }
    }
}
