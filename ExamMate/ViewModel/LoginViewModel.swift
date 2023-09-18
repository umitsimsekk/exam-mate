//
//  LoginViewModel.swift
//  ExamMate
//
//  Created by Ümit Şimşek on 18.09.2023.
//

import Foundation
import FirebaseAuth


class LoginViewModel {
    
    let authManagerProtocol : AuthManagerProtocol
    weak var output : LoginOutput?
    
    init(authManagerProtocol: AuthManagerProtocol) {
        self.authManagerProtocol = authManagerProtocol
    }
    
    func signIn(){
        let email = output?.user?.email ?? ""
        let password = output?.user?.password ?? ""
        authManagerProtocol.signIn(withEmail: email, password: password) { succes in
            if succes {
                self.output?.showAlert(title: "Success!", message: "User logged in")
            } else {
                self.output?.showAlert(title: "Error!", message: "an error occurred while the user was logging in.")

            }
        }
    }
    
}
