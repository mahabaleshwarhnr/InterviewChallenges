//
//  PrimeNumberHourGlass.swift
//
//
//  Created by Mahabaleshwar on 29/12/16.
//  Copyright © 2016 Mahabaleshwar. All rights reserved.
//
/*****************************************************************************
 
             Print Prime number series in an hourglass shape
 
 ****************************************************************************
The user will enter the number of rows and the output should contain those many
rows printing the prime number series and a mirror image of the hourglass with the
text UNOCOIN side by side (exactly as shown in the below example).
Example:
Input: 7 (Number of Rows)
Output:
2+3+5+7  UNOCOIN
 11+13    UNOCO
  17+      UNO
  1         U
 9+2       UNO
3+29+     UNOCO
31+37+4  UNOCOIN
 
NOTE: To form a perfect hourglass, split the numbers of the prime number series to
next row and for the last number of the prime number series, discard any remaining
digit after the split (In example: “19” was split to place “9” into the next row to form
an hourglass and “41” is split to place “4” in the last row and remaining digit ‘1’ is
discarded). For the UNOCOIN text, repeat the text (UNOCOIN) to make a perfect
diamond shape for large rows. TWO SHAPES MUST BE SIDE BY SIDE.*/


import Foundation

var lastCaluclatedPrimeNumber = 1
var extraCharater = ""
var display = extraCharater
//Change whatever text you want
let unocoin = "UNOCOIN"

////Get valid number hour glass rows for even and odd number entry
func getValidHourGlass(forRows rows: Int) -> Int {
    if rows%2 == 0 {
        return rows - 1
    } else {
        return rows
    }
}

///Returns number is prime or not
func isPrime(number: Int) -> Bool {
    switch number {
    case 0, 1:
        return false
    case 2, 3:
        return true
    default:
        for i in 2...Int(sqrt(Double(number))) {
            if number % i == 0 {
                return false
            }
        }
        return true
    }
}

///Find the next prime number
func nextPrimeNumber(_ number: Int) -> Int {
    var number = number
    while(true) {
        number = number + 1
        if isPrime(number: number) {
            break
        }
    }
    return number
}

///Add whitespaces
func addWhite(spaces numberOfSpaces: Int) {
    for _ in 0..<numberOfSpaces {
        print(" ", terminator: "")
    }
}

/**Generate the prime number series for display string length.
Remaining chracer will be stored in extracharacter. */
func genarateValidHourGlassPrimeChracter(formattedStringLength length: Int, display: String) -> String {
    
    var formattedDisplay = ""
    let formattedDisplayIndex = display.index(display.startIndex, offsetBy: length)
    formattedDisplay = display.substring(to: formattedDisplayIndex)
    
    let offest = display.characters.count - length
    let extraChraracterIndex = display.index(display.endIndex, offsetBy: -offest)
    extraCharater = display.substring(from: extraChraracterIndex)
    return formattedDisplay
}


print("****UNOCOIN*****")
print("Enter Number of rows")
if let userInput = readLine() {
    if var numberOfRows = Int(userInput) {
        numberOfRows = getValidHourGlass(forRows: numberOfRows)
        
        if unocoin.characters.count >= numberOfRows {
            var formmatedUnoCoin = unocoin
            var offset = formmatedUnoCoin.characters.count
            var spaceAmount = 0
            for index in 0..<numberOfRows {
                //Check the midpoint of HourGlass
                if index < (numberOfRows + 1)/2 {
                    let characterIndex = formmatedUnoCoin.index(formmatedUnoCoin.startIndex, offsetBy: offset)
                    formmatedUnoCoin = unocoin.substring(to: characterIndex)
                    spaceAmount = index
                    offset = formmatedUnoCoin.characters.count - 2
                } else {
                    let characterIndex = unocoin.index(unocoin.startIndex, offsetBy: formmatedUnoCoin.characters.count + 2)
                    formmatedUnoCoin = unocoin.substring(to: characterIndex)
                    spaceAmount = spaceAmount - 1
                }
                if index > 0 {
                    addWhite(spaces: spaceAmount)
                }
                for characterIndex in 0..<formmatedUnoCoin.characters.count {
                    let primeNumber = nextPrimeNumber(lastCaluclatedPrimeNumber)
                    lastCaluclatedPrimeNumber = primeNumber
                    display = display + primeNumber.description
                    
                    if display.characters.count == formmatedUnoCoin.characters.count {
                        print(display, terminator: "")
                        display = ""
                        break
                    } else if display.characters.count == formmatedUnoCoin.characters.count - 1 {
                        display = display + "+"
                        print(display, terminator: "")
                        display = ""
                        break
                    } else if display.characters.count < formmatedUnoCoin.characters.count {
                        display = display + "+"
                    } else {
                        display = display + "+"
                        display = genarateValidHourGlassPrimeChracter(formattedStringLength: formmatedUnoCoin.characters.count, display: display)
                        print(display, terminator: "")
                        display = extraCharater
                        break
                    }
                }
                
                print("\t", terminator: "")
                if index > 0 {
                    addWhite(spaces: spaceAmount)
                }
                print(formmatedUnoCoin)
                
            }
        }
    }
}




