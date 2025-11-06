import SwiftUI

struct BtnFavoritos: View {
    @ObservedObject var searchObject = SearchObjetctController.shared
    let imageURL: String

    @State private var showAlert = false

    var body: some View {
        HStack(spacing: 6) {
            // Favoritos (aún sin lógica)
            Button {
            } label: {
                Image(systemName: "heart")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.35))
                    .clipShape(Circle())
            }

            // Descargar
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

#Preview {
    BtnFavoritos(imageURL: "https://imagenes.com/ejemplo.jpg")
}
