//
//  LoginViewModel.swift
//  ExamMate
//
//  Created by Ümit Şimşek on 18.09.2023.
//

import Foundation

class SignupViewModel {
    weak var output : SignupOutput?
    
    let authManagerProtocol : AuthManagerProtocol
    
    init(authManagerProtocol: AuthManagerProtocol) {
        self.authManagerProtocol = authManagerProtocol
    }
    
    func createUser() {
        let username = output?.userInfo?.username ?? ""
        let email = output?.userInfo?.email ?? ""
        let password = output?.userInfo?.password ?? ""

        authManagerProtocol.createUser(withEmail:email, password: password) { success in
            if success {
                self.output?.showAlert(title: "Success!", message: "User created")
            } else {
                self.output?.showAlert(title: "Error!", message: "An error occurred while creating the user.")

            }
        }
    }
   

}
