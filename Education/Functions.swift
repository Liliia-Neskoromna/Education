//
//  Functions.swift
//  Education
//
//  Created by Liliia Neskoromna on 10.12.2020.
//

import Foundation

final class Functions {
    
    static let shared = Functions()
    
    func factorialRecursion(_ number: Int) -> Int {
        if number == 0 {
            return 1
        } else {
            return number * factorialRecursion(number - 1)
        }
    }
    
    func factorialIteration(_ number: Int) -> Int {
        var mult = number
        var result = 1
        while mult > 0 {
            result *= mult
            mult -= 1
        }
        return result
    }
    
    func fibonacci(_ number: Int) -> [Int] {
        
        var fibs: [Int] = [0, 1]
        var variable1 = 0
        var variable2 = 1
        
        switch number {
        case 1:  return [fibs[0]]
        case 2:  return [fibs[0],fibs[1]]
        default:
            
            (2...number-1).forEach { _ in
                let temp = variable2
                variable2 = variable1 + variable2
                variable1 = temp
                fibs.append(variable2)
            }
            return fibs
        }
    }
    
    func piToN(_ number: Int) -> Double {
        
        let doublePi = String(Double.pi)
        var result = ""
        var numberPi = 0.0
        
        if (number < 1 || number > 15) {
            print("Please input range from 1 to 15")
        } else {
            result = String(doublePi.prefix(number+2))
        }
        
        if let tempNumberPi = Double(result) {
            numberPi = tempNumberPi
        } else {
            return numberPi
        }
        
        return numberPi
    }
}
