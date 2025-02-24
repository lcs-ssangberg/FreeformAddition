import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    
    // Holds the view model, to track current state of
    // data within the app
    @State var viewModel = AdditionViewModel()
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Extra space at top
            Spacer()
            
            // OUTPUT
            // When the addition can be unwrapped, show the result
            if let addition = viewModel.addition {
                
                
                HStack(alignment: .center) {
                    
                    if addition.number1 < 0 {
                        Text("(\(addition.number1.formatted()))")
                            .font(.system(size: 96))
                    } else {
                        Text("\(addition.number1.formatted())")
                            .font(.system(size: 96))
                        
                    }
                    
                    
                    Text("+")
                        .font(.system(size: 96))
                    
                    if addition.number2 < 0 {
                        Text("(\(addition.number2.formatted()))")
                            .font(.system(size: 96))
                    } else {
                        Text("\(addition.number2.formatted())")
                            .font(.system(size: 96))
                        
                    }
                    
                    
                    Text("=")
                        .font(.system(size: 96))
                    
                    Text("\(addition.result.formatted())")
                        .font(.system(size: 96))
                    
                    
                    
                    
                }
                
                
            } else {
                
                // Show a message indicating that we are
                // awaiting reasonable input
                ContentUnavailableView(
                    "Unable to evaluate equation",
                    systemImage: "gear.badge.questionmark",
                    description: Text(viewModel.recoverySuggestion)
                )
                .frame(height: 300)
            }
            
            // INPUT
            TextField("Base", text: $viewModel.providedNumber1)
                .textFieldStyle(.roundedBorder)
            
            TextField("Exponent", text: $viewModel.providedNumber2)
                .textFieldStyle(.roundedBorder)
            
            // Extra space at bottom
            Spacer()
        }
        .padding()
    }
    
}

#Preview {
    AdditionView()
}
