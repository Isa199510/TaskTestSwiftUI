//
//  VerticalTextView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 23.03.2023.
//

import SwiftUI

struct VerticalTextView: View {
    @State var text = "Isa Arbuhov"
    var body: some View {
        VStack {
            ForEach(replaceArray(text: text), id: \.self) { item in
                VStack {
                    Text(item)
                }
            }
        }
    }
}

struct VerticalTextView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalTextView()
    }
}

func replaceArray(text: String) -> [String] {
    Array(text).map { String($0)}
}
