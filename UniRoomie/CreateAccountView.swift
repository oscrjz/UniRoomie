//
//  CreateAccountView.swift
//  UniRoomie
//
//  Created by Juan Pena Jr. on 1/27/25.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            HStack {
                if isSecure {
                    SecureField("Password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle()) 
                } else {
                    TextField("Password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                }

                Button(action: {
                    isSecure.toggle()
                }) {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
            .padding(.horizontal)


            Button(action: {
                print("Account Created with Name: \(name), Email: \(email)")
            }) {
                Text("Create Account")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

struct CreateAccount_preview: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
