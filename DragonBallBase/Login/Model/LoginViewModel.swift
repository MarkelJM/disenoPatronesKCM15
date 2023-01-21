//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Markel Juaristi on 20/1/23.
//

import Foundation

class LoginViewModel : NSObject {
    //at begining the label must be hidden and once it is activated(after push login) must be shown
    var isLoggedLabelHidden: Bool = true
    
    func showLoggedLabel() {
            isLoggedLabelHidden = false
        }
    
    
    override init() {
        
    }
    
    var updateUI: ((_ token : String,_ error : String)-> Void)?
 //crear funcion login
    func login(user : String, password : String) {
        let apliclient = ApiClient(token: "")
        apliclient.login(user: user, password: password) { [weak self] token, error in
            
            if let token = token {
                self?.updateUI?(token, "")
                return
            }
            if let error = error {
                self?.updateUI?("", error.localizedDescription)
                
            }
        }
        
    }
}