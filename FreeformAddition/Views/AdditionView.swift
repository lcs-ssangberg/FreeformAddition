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
                
                
                HStack {
                    
                    Group {
                        
                        if addition.number1 < 0 {
                            Text("(\(addition.number1.formatted()))")
                        } else {
                            Text("\(addition.number1.formatted())")
                        }
                        
                        Text("+")
                        
                        if addition.number2 < 0 {
                            Text("(\(addition.number2.formatted()))")
                        } else {
                            Text("\(addition.number2.formatted())")
                            
                        }
                        
                        Text("=")
                        
                        Text("\(addition.result.formatted())")
                        
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.25)
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
            TextField("#1", text: $viewModel.providedNumber1)
                .textFieldStyle(.roundedBorder)
            
            TextField("#2", text: $viewModel.providedNumber2)
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
