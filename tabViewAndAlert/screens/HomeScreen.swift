//
//  HomeScreen.swift
//  tabViewAndAlert
//
//  Created by MacBook Pro on 11/08/21.
//

import SwiftUI

struct HomeScreen: View {
    @State var showingAlert = false
    @State var isSheet = false
    var actionSheet: ActionSheet{
        var title = "iOS"
        var message = "Here we go"
        return ActionSheet(title: Text(title), message: Text(message), buttons: [
            .default(Text("No"), action: {
                
            }),
            .destructive(Text("Ok"),action: {
                
            })
        ])
    }
    var body: some View {
        TabView{
            Button(action: {
                showingAlert = true
            }, label: {
                Text("Alert Dialog").font(.title)
            }).alert(isPresented: $showingAlert, content: {
                let title = "iOS"
                let message = "Here we go"
                return Alert(title: Text(title), message: Text(message), primaryButton:
                                .destructive(Text("No")){
                                    
                                },secondaryButton:
                                    .default(Text("Ok")){

                    })
            })
                .tabItem {
                    Image(systemName: "circle")
                    Text("Alert")
                }
            Button(action: {
                isSheet = true
            }, label: {
                Text("Action Sheet").font(.title)
            })
            .actionSheet(isPresented: $isSheet, content: {
                self.actionSheet
            })
                .tabItem {
                    Image(systemName: "circle")
                    Text("Sheet")
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
