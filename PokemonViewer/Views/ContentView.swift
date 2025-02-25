import SwiftUI

struct ContentView: UIViewControllerRepresentable {

    typealias UIViewControllerType = PokemonListViewController

    func makeUIViewController(context: Context) -> PokemonListViewController {
        PokemonListViewController()
    }

    func updateUIViewController(_ uiViewController: PokemonListViewController, context: Context) {
       // Update the ViewController here
    }
}

/*
 ----------------------------------------
 -----------  SwiftUI version -----------
 ----------------------------------------

 
struct ContentView: View {
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        PokemonListViewController()
    }
}

#Preview {
    ContentView()
}



 NavigationView {
     ZStack {
         List(viewModel.pokemons) { pokemon in
             Text(pokemon.name.capitalized)
                 .padding(.vertical, 8)
         }
         .listStyle(.plain)
         
         if viewModel.isLoading {
             ProgressView()
         }
     }
     .navigationTitle("Pokemon")
     .alert("Error", isPresented: $viewModel.showError) {
         Button("OK", role: .cancel) { }
     } message: {
         Text("Something went wrong")
     }
 }
 .task {
     await viewModel.loadPokemons()
 }
 */
