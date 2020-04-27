//
//  SavingYourAccount.swift
//  SaveAccount
//
//  Created by Dalal Salem on 4/15/20.
//  Copyright © 2020 Dalal Salem. All rights reserved.
//

import SwiftUI

struct SavingYourAccount: View {
    @State var type: String = ""
    @State var Username: String = ""
    @State var Password: String = ""
    
    var body: some View {
        VStack{
            Text("Creat account").font(.largeTitle)
            TextField("Account type", text: $type)
            TextField("User Name", text: $Username)
            TextField("Password", text: $Password)
            
            Button(action: {
                let account = Account(accountType: self.type, uasernameacc: self.Username, passwordacc: self.Password)
                
                
                Networking.createItem(account, inCollection: "accounts"){
                   print( "horraw")
                }
               
            }) {
                Text("Save")
            }
        }.padding()
    }
}

struct SavingYourAccount_Previews: PreviewProvider {
    static var previews: some View {
        SavingYourAccount()
    }
}
