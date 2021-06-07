import Foundation

public extension Int {
    
    var roman: String? {
        var str = ""
        
        if self < 1 || self > 3999 { return nil }
        var number = self
        if number / 1000 > 0 {
            for _ in 0..<self/1000 {
                str.append("M")
            }
            number %= 1000
        }
        
        if number / 100 > 0 {
            let digit = number / 100
            if digit > 0 && digit < 4 {
                for _ in 0..<digit {
                    str.append("C")
                }
            } else if digit == 4 {
                str.append("CD")
            } else if digit == 5 {
                str.append("D")
            } else if digit > 5 && digit < 9 {
                str.append("D")
                for _ in 0..<(digit-5) {
                    str.append("C")
                }
            } else if digit == 9 {
                str.append("CM")
            }
            number %= 100
        }
            
        if number / 10 > 0 {
            let digit = number / 10
            if digit > 0 && digit < 4 {
                for _ in 0..<digit {
                    str.append("X")
                }
            } else if digit == 4 {
                str.append("XL")
            } else if digit == 5 {
                str.append("L")
            } else if digit > 5 && digit < 9 {
                str.append("L")
                for _ in 0..<(digit-5) {
                    str.append("X")
                }
            } else if digit == 9 {
                str.append("XC")
            }
            number %= 10
        }
        
        if number > 0 {
            if number > 0 && number < 4 {
                for _ in 0..<number {
                    str.append("I")
                }
            } else if number == 4 {
                str.append("IV")
            } else if number == 5 {
                str.append("V")
            } else if number > 5 && number < 9 {
                str.append("V")
                for _ in 0..<(number-5) {
                    str.append("I")
                }
            } else if number == 9 {
                str.append("IX")
            }
            number %= 10
        }
        
        return str
    }
}
