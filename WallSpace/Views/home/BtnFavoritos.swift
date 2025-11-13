import SwiftUI

struct BtnFavoritos: View {
    @ObservedObject var searchObject = SearchObjetctController.shared
    let imageURL: String

    @State private var showAlert = false

    @State private var showButtons = false  // Controlar la visibilidad de los botones

    var body: some View {
        HStack(spacing: 6) {
            ZStack {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }
                if showButtons {
                    HStack {
                        Button {
                        } label: {
                            Image(systemName: "heart")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.black.opacity(0.35))
                                .clipShape(Circle())
                        }

                        Button {
                            showAlert = true
                        } label: {
                            Image(systemName: "arrow.down.circle")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.black.opacity(0.35))
                                .clipShape(Circle())
                        }
                    }
                    .padding(8)
                }
            }
            .onTapGesture {
                withAnimation {
                    showButtons.toggle()  
                }
            }
            .alert("¿Descargar imagen?", isPresented: $showAlert) {
                Button("Cancelar", role: .cancel) {}
                Button("Descargar") {
                    searchObject.downloadImage(from: imageURL)
                }
            } message: {
                Text("Se guardará en tu galería.")
            }
        }
    }
}

#Preview {
    BtnFavoritos(imageURL: "https://imagenes.com/ejemplo.jpg")
}
