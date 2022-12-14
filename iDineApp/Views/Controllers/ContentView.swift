//
//  ContentView.swift
//  iDineApp
//
//  Created by Sam Greenhill on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    //SwiftUI is designed to be composable, which means that you can make views out of any other views you like. we have a textview and we want to add more to it.
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                List {
                    ForEach(menu) { section in
                        Section(header: Text(section.name)) {
                            ForEach(section.items) { item in
                                NavigationLink(destination: ItemDetail(item: item)) {
                                    ItemRow(item: item)
                                }
                            }
                        }
                    }
//                    .listRowSeparator(.hidden) // 隐藏分割线
                    //.listRowSeparatorTint(.green)// 修改分割线颜色
                }
      
                .navigationTitle("Menu")
                //            .listStyle(.automatic) // 默认, 有圆角,两边有15间距
                //            .listStyle(.grouped) // 无圆角,两边无间距
                //            .listStyle(.plain) // 无圆角,两边无间距,header会悬浮在顶部
                //                        .listStyle(.inset) // 无圆角,两边无间距,header会悬浮在顶部
                //            .listStyle(.insetGrouped) // 有圆角,两边有15间距
                .listStyle(.sidebar)
            } else {
                // Fallback on earlier versions
            } // 有圆角,两边有15间距, 可折叠
            //
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
