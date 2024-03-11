//
//  OtherPickerView.swift
//  something
//
//  Created by Charles Blue on 2024/3/10.
//

import Foundation
import SwiftUI

struct OtherPickerView : View {
    var body: some View {
        List{
            Section(header: Text("Assistant On Duty").foregroundColor(.primary).font(.headline).fontWeight(.bold)) {
                ForEach(assistantOnDuty, id: \.id) { assistant in
                    AssistantRowView(item: assistant)
                }
            }
            
            Section(header: Text("Day off & Holidays").foregroundColor(.primary).font(.headline).fontWeight(.bold)) {
                HStack{
                    AvaterWithNameView(bgColor: Color.gray, name: "Dylan")
                    Spacer()
                    AvaterWithNameView(bgColor: Color.gray, name: "Guy")
                    Spacer()
                    AvaterWithNameView(bgColor: Color.gray, name: "Nanami")
                    Spacer()
                    AvaterWithNameView(bgColor: Color.gray, name: "Vicky")
                }
                HStack{
                    AvaterWithNameView(bgColor: Color.gray, name: "Ben")
                    Spacer()
                    AvaterWithNameView(bgColor: Color.gray, name: "Gustav")
                    Spacer()
                    AvaterWithNameView(bgColor: Color.gray, name: "Naomi")
                    Spacer()
                    AvaterWithNameView(bgColor: Color.gray, name: "Rasmus")
                }
                HStack{
                    AvaterWithNameView(bgColor: Color.gray, name: "Tom")
                    Spacer()
                    AvaterWithNameView(bgColor: Color.gray, name: "Mengqi")
                    Spacer()
                    AvaterWithNameView(bgColor: Color.gray, name: "Doris")
                    Spacer()
                    AvaterWithNameView(bgColor: Color.gray, name: "Charles")
                }

            }.listRowSeparator(.hidden, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

struct OtherPickerView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPickerView()
    }
}
