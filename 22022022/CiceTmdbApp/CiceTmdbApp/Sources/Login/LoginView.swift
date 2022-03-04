//
//  LoginView.swift
//  CiceTmdbApp
//
//  Created by CICE on 03/03/2022.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    @State var authType: AuthenticationType
    
    @State var email = ""
    @State var password = ""
    @State var confirmationPassword = ""
    @State var showPassword = false
    
    
    var body: some View {
        ZStack{
            VStack(spacing: 40, content: {
                helloApp
                imageAppLogo
                // Haremos una comprobacion para saber si el usuario esta autenticado en Firebase
                if !self.viewModelSession.userAuthenticated {
                    VStack(spacing: 20, content: {
                        CustomTextField(placeholder: "email",
                                        title: "email",
                                        text: self.$email)
                            .padding(10)
                            .background(
                                Color(red: 239/255,
                                      green: 243/255,
                                      blue: 244/255,
                                      opacity: 1)
                            )
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 5, y: 5)
                        
                        if self.showPassword{
                            CustomTextField(placeholder: "Password",
                                            title: "Password",
                                            text: self.$password)
                                .padding(10)
                                .background(
                                    Color(red: 239/255,
                                          green: 243/255,
                                          blue: 244/255,
                                          opacity: 1)
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 5, y: 5)
                        }else{
                            CustomSecureTextField(placeholder: "Password",
                                                  title: "Password",
                                                  text: self.$password)
                                .padding(10)
                                .background(
                                    Color(red: 239/255,
                                          green: 243/255,
                                          blue: 244/255,
                                          opacity: 1)
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 5, y: 5)
                            
                        }
                        
                        if authType == .signUp{
                            if showPassword{
                                CustomTextField(placeholder: "Confirmation Password",
                                                title: "Confirmation Password",
                                                text: self.$confirmationPassword)
                                    .padding(10)
                                    .background(
                                        Color(red: 239/255,
                                              green: 243/255,
                                              blue: 244/255,
                                              opacity: 1)
                                    )
                                    .cornerRadius(10)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 5, y: 5)
                            } else{
                                CustomSecureTextField(placeholder: "Confirmation Password",
                                                      title: "Confirmation Password",
                                                      text: self.$confirmationPassword)
                                    .padding(10)
                                    .background(
                                        Color(red: 239/255,
                                              green: 243/255,
                                              blue: 244/255,
                                              opacity: 1)
                                    )
                                    .cornerRadius(10)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 5, y: 5)
                            }
                        }
                        
                        Toggle("Show password", isOn: self.$showPassword)
                            .padding()
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        // Button de login / registro
                        Button(action: {
                            self.authEmailTouched()
                        }, label: {
                            Text(self.authType.text)
                                .font(.headline)
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                                .background(
                                    Color(red: 239/255, green: 243/255, blue: 244/255)
                                )
                                .clipShape(Capsule())
                        })
                        .foregroundColor(.gray)
                        .padding()
                        
                        
                        // Button de cambio de formulario si no estoy logado
                        Button(action: {
                            self.footerTouched()
                        }, label: {
                            Text(self.authType.footterText)
                                .font(.headline)
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                                .background(
                                    Color(red: 239/255, green: 243/255, blue: 244/255)
                                )
                                .clipShape(Capsule())
                        })
                        .foregroundColor(.gray)
                        .padding()
                        
                    })
                }
            })
            .padding()
        }
    }
    
    var helloApp: some View {
        Text("Cice TMDB App")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .foregroundColor(.gray)
    }
    
    var imageAppLogo: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 20)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
            .overlay(
                Circle()
                    .stroke(Color.red, lineWidth: 2)
            )
    }
    
    private func authEmailTouched(){
        switch authType {
        case .signIn:
            self.viewModelSession.signIn(with: .emailAndPassword(email: self.email, password: self.password))
        case .signUp:
            self.viewModelSession.signUp(email: self.email, password: self.password, passwordConfirmation: self.confirmationPassword)
        }
    }
    
    private func footerTouched(){
        self.authType = authType == .signUp ? .signIn : .signUp
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authType: .signUp)
    }
}
