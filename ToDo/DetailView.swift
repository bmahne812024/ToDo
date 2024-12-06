//
//  DetailView.swift
//  ToDo
//
//  Created by Brian Mahne on 12/6/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State var toDo: String
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text("You are a Swifty Legend!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text(toDo)
            Spacer()
            Button("Get Back!") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
        }

        
    }
}

#Preview {
    DetailView(toDo: "go to work")
}
