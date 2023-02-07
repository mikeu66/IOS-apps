//
//  ContentView.swift
//  WalterMichael-HW10
//
//  Created by Michael  Walter on 11/17/21.
//
// Project: WalterMichael-HW10
// EID: MJW3895
// Course: CS329E
// Built to run on iPhone 14

import SwiftUI

struct ContentView: View {
    @State private var userId: String = ""
    @State private var password: String = ""
    @State private var status: String = "Not currently logged in"
    var body: some View {
        VStack{
            Text("User Login")
                .padding(60)
            HStack{
                Text("userID:")
                    .frame(width: 54)
                    .padding(.top, 20)
                    .padding(.leading,64)
                TextField("", text: $userId)
                    .frame(width: 250.0)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, 20)
                    //.padding(.trailing,20)
                    .padding(.leading,32)
                Spacer()
            }
            HStack{
                Text("Password: ")
                    //.padding(10)
                    .padding(.leading,20)
                TextField("", text: $password)
                    .frame(width: 250.0)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, 2)
                    .padding(.leading,26)
                //Spacer()
            }
            Spacer()
            Button(action: {
                if (password == "" || userId == ""){
                    status = "Invalid login"
                }
                else{
                    status = "logged in"
                }
            }) {
                Text("Login")
                    .padding(.bottom, 20)
            }
            
            Text(status)
                .padding(.top, 30)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
