//
//  PowerViewModel.swift
//  MVVMAndFreeformInput
//
//  Created by Sebastian on 2025-02-21.
//

import Foundation

@Observable
// VIEW MODEL
class AdditionViewModel {
   
   // MARK: Stored properties
   
   // Holds whatever the user has typed in the text fields
   var providedNumber1: String
   var providedNumber2: String
   
   // Holds an appropriate error message, if there was a
   // problem with input provided by the user
   var recoverySuggestion: String = ""
   
   // MARK: Computed properties
   // Holds the evaluated power, when the input provided is valid
   var addition: Addition? {
       
       //check that #1 is a double
       guard let number1 = Double(providedNumber1) else {
           recoverySuggestion = "Please provide a numeric value for the first number."
           
           return nil
       }
       
       //check that #2 is a double
       guard let number2 = Double(providedNumber2) else {
           recoverySuggestion = "Please provide an numeric value for the second number."
           
           return nil
       }
       
       // Now that we know the base and exponent have valid values, return the evaluated power
       recoverySuggestion = "" // No error message
       return Addition(number1: number1, number2: number2)
       
   }
   
   
   //MARK: initalizers
   init(
       providedNumber1: String = "",
       providedNumber2: String = "",
       recoverySuggestion: String = ""
   ) {
       self.providedNumber1 = providedNumber1
       self.providedNumber2 = providedNumber2
       self.recoverySuggestion = recoverySuggestion
   }
   
}
