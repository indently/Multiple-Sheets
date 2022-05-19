//
//  ContentView.swift
//  Multiple Sheets
//
//  Created by Federico on 12/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showSettingsSheet = false
    @State private var showEditTextSheet = false
    @State private var text = "Edit this text"
    @State private var isCaps = false
    
    private var displayedText: String {
        return self.isCaps ? text.uppercased() : text
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(displayedText)
                .bold()
            Button("Edit") {
                showSettingsSheet.toggle()
            }
            .sheet(isPresented: $showSettingsSheet) {
                Form {
                    Section("Settings") {
                        Toggle("Capitalized?", isOn: $isCaps)
                        Button("Change text") {
                            showEditTextSheet.toggle()
                        }
                        Button("Done") {
                            showSettingsSheet.toggle()
                        }
                    }
                    Section("Preview") {
                        Text("Current text: \(Text(displayedText).bold())")
                    }
                }
                .sheet(isPresented: $showEditTextSheet) {
                    Form {
                        Section("Change the text") {
                            TextField("Edit the current text", text: $text)
                            Button("Submit") {
                                showEditTextSheet.toggle()
                            }
                        }
                    }
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
