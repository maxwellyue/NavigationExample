//
//  ContentView.swift
//  NavigationExample
//
//  Created by yueyue max on 2023/3/8.
//

import SwiftUI

struct ContentView: View {
    @State private var selectItem: SidebarMenuItem? = SidebarMenuItem.overview

    var body: some View {
        NavigationSplitView {
            List(
                selection: $selectItem
            ) {
                ForEach(SidebarMenuItem.allCases, id: \.self) { item in
                    NavigationLink(item.rawValue, value: item)
                }
            }
        } detail: {
            ZStack {
                if let selectItem = selectItem {
                    NavigationStack {
                        List {
                            ForEach(0 ... 5, id: \.self) { value in
                                NavigationLink(value: value) {
                                    HStack {
                                        Text(selectItem.rawValue)
                                        Text("\(value)")
                                    }
                                }
                            }
                        }
                        .listStyle(.insetGrouped)
                        .navigationDestination(for: Int.self) { value in
                            VStack{
                                Text(selectItem.rawValue)
                                Text("\(value)")
                            }
                            .font(.largeTitle)
                        }
                    }
                } else {
                    Text("None")
                        .font(.largeTitle)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
