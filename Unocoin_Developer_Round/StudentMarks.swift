//
//  StudentMarks.swift
//
//
//  Created by Mahabaleshwar on 30/12/16.
//  Copyright © 2016 Mahabaleshwar. All rights reserved.
//

/*
 **********************************************************************
          Implement Quicksort algorithm to sort the below problem.
 **********************************************************************
 
 • The user will enter the student names
 • The user will enter the subjects (as many subjects as he/she wants)
 • The user will enter the marks for all students for each subject
 • You will total the marks for each students
 • You will store them in a dynamic list. The user should be able to add as many
 names, subjects and marks as he/she wants.
 • You should be able to sort the names based on their total marks they
 received in descending order and print the output as shown below.
 Example:
 Input:
 Names = {‘Raj, ‘ Simran’, ‘Vinod’} Subject = {‘English’, ‘Math’, ‘Science’}
 Marks = Raj:{30, 50, 40}, Simran:{50, 70, 50}, Vinod:{40, 40, 30}
 Output:
 Rank | Name | English | Math | Science | Total Marks
 ----------------------------------------------------------------------------------------------------
 1 | Simran | 50 | 70 | 50 | 170
 2 | Raj | 30 | 50 | 40 | 120
 3 | Vinod | 40 | 40 | 30 | 110
 */

import Foundation

var outputHeader = ["Rank", "Name"]

func input() -> String {
    var defaultInput = ""
    if let userInput = readLine(strippingNewline: true) {
        defaultInput = userInput
    }
    return defaultInput
}

func shouldAskInput() -> Bool {
    print("Do you want to add one more (Y) or (N)")
    if let userCommand = readLine(strippingNewline: true) {
        if userCommand == "N" || userCommand.lowercased() == "n"{
            return false
        } else {
            return true
        }
    }
    return false // If not entered input return false
}

///Quicksort function
func quicksort(studentList: [Student]) -> [Student] {
    var list = studentList
    if list.count <= 1 {
        return list
    }
    
    let pivot = list[0].totalMarks
    
    var smallerList = [Student]()
    var equalList = [Student]()
    var biggerList = [Student]()
    
    for x in list {
        if x.totalMarks < pivot {
            smallerList.append(x)
        } else if x.totalMarks == pivot {
            equalList.append(x)
        } else if x.totalMarks > pivot {
            biggerList.append(x)
        } else {
            break
        }
    }
    //Sort in descending order
    //Call recursively until list is less than equal to 1
    return  quicksort(studentList: biggerList) + equalList + quicksort(studentList: smallerList)
}

func display(sortedStudentList: [Student]) {
    for header in outputHeader {
        print(header, separator: "", terminator: "\t")
        print("|", terminator: "")
    }
    print("\t****************************************************************")
    for (studentRank,sortedStudent) in sortedStudentList.enumerated() {
        for (headerIndex,header) in outputHeader.enumerated() {
            switch headerIndex {
            case 0:
                print(studentRank + 1, separator: " ", terminator: "\t\t")
                print("|", separator: " ",terminator: "")
            case 1:
                print(sortedStudent.name, separator: " ", terminator: "\t\t")
                print("|", separator: " ", terminator: "")
            case 2..<outputHeader.count-1:
                print(sortedStudent.marks[header] ?? "",separator: " ", terminator: "\t\t")
                print("|",  separator: " ", terminator: "")
            case outputHeader.count-1:
                print(sortedStudent.totalMarks)
            default:
                break
            }
        }
    }
}

struct Student {
    var name: String
    var marks: [String: Int] //["Subjects":40]
    var totalMarks: Int // We can calculate totalmarks from marks also
}


var studentNamesList = [String]()
var subjectList = [String]()
var studentsInfoList = [Student]()

var shouldAdd = true
print("Enter the names of student")
while(shouldAdd) {
    let name = input()
    if !name.isEmpty {
        studentNamesList.append(name)
        shouldAdd = shouldAskInput()
        if shouldAdd {
            print("Enter name")
        }
    }
}
print(studentNamesList)

print("Enter the subjects")
shouldAdd = true
while(shouldAdd) {
    let name = input()
    if !name.isEmpty {
        subjectList.append(name)
        shouldAdd = shouldAskInput()
        if shouldAdd {
            print("Enter subject")
        }
    }
}

print(subjectList)

//Build data structure
for name in studentNamesList {
    var marksDictionary = [String: Int]()
    var totalmarks = 0
    print("*************************************************************")
    for subject in subjectList {
        print("Enter \(name)'s obtain marks in \(subject)")
        if let marks = Int(input()) {
            marksDictionary[subject] = marks
            totalmarks = totalmarks + marks
        }
    }
    
    let student = Student(name: name, marks: marksDictionary, totalMarks:totalmarks)
    studentsInfoList.append(student)
}

let sortedStudentList = quicksort(studentList: studentsInfoList)
//Build the output header
outputHeader = outputHeader + subjectList + ["Totalmarks"]
display(sortedStudentList: sortedStudentList)

