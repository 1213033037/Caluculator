import SwiftUI

struct ContentView: View {
    @State private var currentNumber = "0"
    @State private var storedNumber = ""
    @State private var selectedOperator = ""
    
    let buttons = [
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "=", "/"]
    ]
    
    var body: some View {
        VStack(spacing: 12) {
            Text(currentNumber)
                .font(.system(size: 64))
                .fontWeight(.thin)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 16)
            
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            self.buttonTapped(button)
                        }) {
                            Text(button)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(button), height: self.buttonHeight())
                                .background(self.buttonBackgroundColor(button))
                                .foregroundColor(.white)
                                .cornerRadius(self.buttonCornerRadius())
                        }
                    }
                }
            }
        }
    }
    
    func buttonTapped(_ button: String) {
        if button == "X" {
            currentNumber = "0"
            storedNumber = ""
            selectedOperator = ""
            return
        }
        
        if button == "/" || button == "*" || button == "-" || button == "+" {
            selectedOperator = button
            storedNumber = currentNumber
            currentNumber = "0"
            return
        }
        
        if button == "=" {
            let num1 = Double(storedNumber) ?? 0.0
            let num2 = Double(currentNumber) ?? 0.0
            
            switch selectedOperator {
            case "/":
                currentNumber = "\(num1 / num2)"
            case "*":
                currentNumber = "\(num1 * num2)"
            case "-":
                currentNumber = "\(num1 - num2)"
            case "+":
                currentNumber = "\(num1 + num2)"
            default:
                break
            }
            
            return
        }
        
        if currentNumber == "0" {
            currentNumber = button
        } else {
            currentNumber += button
        }
    }
    
    func buttonWidth(_ button: String) -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonBackgroundColor(_ button: String) -> Color {
        if button == "/" || button == "*" || button == "-" || button == "+" {
            return Color.orange
        }
        
        if button == "=" {
            return Color.green
        }
        
        return Color.gray
    }
    
    func buttonCornerRadius() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
