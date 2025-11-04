import SwiftUI

struct BtnFavoritos: View {
    @ObservedObject var searchObject = SearchObjetctController.shared
    let imageURL: String

    var body: some View {
        HStack(spacing: 6) {
            Button {
                // Aquí guardarías favoritos
            } label: {
                Image(systemName: "heart")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.35))
                    .clipShape(Circle())
            }

            Button {
                searchObject.downloadImage(from: imageURL)
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

#Preview {
    BtnFavoritos(imageURL: "https://example.com")
}
