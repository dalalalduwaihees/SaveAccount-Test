//
//  Authentication.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 4/12/20.
//  Copyright © 2020 OMAR. All rights reserved.

import Foundation
import Firebase
import CodableFirebase

extension Networking{
    static func signUp(email:String, password:String, success: @escaping()-> Void, fail: @escaping(Error)-> Void)
       {
           
           Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
               // ...
               if error == nil {
                // signed up successfully
                success()
               }else{
                fail(error!)
            }
        }
       }
       
       static func signIn(email:String, password:String, success: @escaping()-> Void, fail: @escaping()-> Void)
       {
           Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
             // ...
               if error == nil{
                   let alertController = UIAlertController(title: "You have signed in successfully", message: "You have signed in with \nemail: \(email)\npasswrod: \(password)", preferredStyle: .alert)
                   alertController.addAction(UIAlertAction(title: "ok", style: .cancel))
                   success()
               }else{
                   let alertController = UIAlertController(title: "🥺", message: "You caouldn't sign up with \nemail: \(email)\npasswrod: \(password)", preferredStyle: .alert)
                   alertController.addAction(UIAlertAction(title: "ok", style: .cancel))
                   fail()
               }
               
           }
       }
       
       static func signOut(success: @escaping()-> Void)
          {
           try! Auth.auth().signOut()
       }
}
