////
////  testMenu.swift
////  Test
////
////  Created by Гаджи Герейакаев on 29.06.2023.
////
//
import SwiftUI

struct testMenu: View {
    @State private var buttonStates: [Bool] = [true, false, false, false, false]

    var body: some View {
        HStack {
            Button(action: {
                self.updateButtonStates(index: 0)
            }) {
                Text("Кнопка 1")
                    .padding()
                    .foregroundColor(getButtonTextColor(forIndex: 0))
                    .background(getButtonBackgroundColor(forIndex: 0))
                    .cornerRadius(10)
            }
            
            Button(action: {
                self.updateButtonStates(index: 1)
            }) {
                Text("Кнопка 2")
                    .padding()
                    .foregroundColor(getButtonTextColor(forIndex: 1))
                    .background(getButtonBackgroundColor(forIndex: 1))
                    .cornerRadius(10)
            }
            
            Button(action: {
                self.updateButtonStates(index: 2)
            }) {
                Text("Кнопка 3")
                    .padding()
                    .foregroundColor(getButtonTextColor(forIndex: 2))
                    .background(getButtonBackgroundColor(forIndex: 2))
                    .cornerRadius(10)
            }
            
            Button(action: {
                self.updateButtonStates(index: 3)
            }) {
                Text("Кнопка 4")
                    .padding()
                    .foregroundColor(getButtonTextColor(forIndex: 3))
                    .background(getButtonBackgroundColor(forIndex: 3))
                    .cornerRadius(10)
            }
            
            Button(action: {
                self.updateButtonStates(index: 4)
            }) {
                Text("Кнопка 5")
                    .padding()
                    .foregroundColor(getButtonTextColor(forIndex: 4))
                    .background(getButtonBackgroundColor(forIndex: 4))
                    .cornerRadius(10)
            }
        }
    }
    
    private func getButtonBackgroundColor(forIndex index: Int) -> Color {
        return buttonStates[index] ? .blue : .gray
    }
    
    private func getButtonTextColor(forIndex index: Int) -> Color {
        return buttonStates[index] ? .white : .black
    }
    
    private func updateButtonStates(index: Int) {
        buttonStates = buttonStates.enumerated().map { (buttonIndex, _) in
            return buttonIndex == index
        }
    }
}


struct testMenu_Previews: PreviewProvider {
    static var previews: some View {
        testMenu()
    }
}
