//
//  main.swift
//  StudentGrades
//
//  Created by Dogus Guleryuz on 20.03.2023.
//

import Foundation

// How to read a file?
let filename = "sample.in"
var students: [Student] = []
var englishLines: String = ""
var historyLines: String = ""
var mathLines: String = ""
var line = ""

if let contents = try? String(contentsOfFile: "/Users/helinkoylu/Desktop/Dogus/StudentsGrade/StudentsGrade/\(filename)") {
  let raws = contents.components(separatedBy: .newlines)
  for i in stride(from: 1, to: raws.count-1, by: +2)
  {
    let raw = raws[i].components(separatedBy: ",")
    let firstName = raw[1]
    let lastName = raw[0].replacingOccurrences(of: ",", with: "")
    let lessonRaw = raws[i+1].components(separatedBy: " ")
    let course = lessonRaw[0]
    
    switch course {
      
    case "Math":
      let quiz1 = Int(lessonRaw[1])!
      let quiz2 = Int(lessonRaw[2])!
      let quiz3 = Int(lessonRaw[3])!
      let quiz4 = Int(lessonRaw[4])!
      let quiz5 = Int(lessonRaw[5])!
      let test1Grade = Int(lessonRaw[6])!
      let test2Grade = Int(lessonRaw[7])!
      let finalExamGrade = Int(lessonRaw[8])!
      let student = MathStudent(firstName: firstName, lastName: lastName, quiz1: quiz1, quiz2: quiz2, quiz3: quiz3, quiz4: quiz4, quiz5: quiz5, test1Grade: test1Grade, test2Grade: test2Grade, finalExamGrade: finalExamGrade)
      students.append(student)
      
    case "English":
      let termPaperGrade = Int(lessonRaw[1])!
      let midtermGrade = Int(lessonRaw[2])!
      let finalExampGrade = Int(lessonRaw[3])!
      let student = EnglishStudent(firstName: firstName, lastName: lastName, termPaperGrade: termPaperGrade, midtermGrade: midtermGrade, finalExamGrade: finalExampGrade)
      students.append(student)
      
    case "History":
      let attendanceGrade = Int(lessonRaw[1])!
      let projectGrade = Int(lessonRaw[2])!
      let midtermGrade = Int(lessonRaw[3])!
      let finalExamGrade = Int(lessonRaw[4])!
      let student = HistoryStudent(firstName: firstName, lastName: lastName, attendanceGrade: attendanceGrade, projectGrade: projectGrade, midtermGrade: midtermGrade, finalExamGrade: finalExamGrade)
      students.append(student)

    default:
      fatalError("Invalid course: \(course)")
    }
  }
}

students.sort { $0.lastName < $1.lastName }

var totalA = 0, totalB = 0, totalC = 0, totalD = 0, totalF = 0

for student in students {
  
  let finalAverage = student.computeFinalAverage()
  var letterGrade: String
  let finalExam = student.finalExam
  let finAvg = String(format: "%.2f", student.computeFinalAverage())
  
  switch Int(finalAverage / 10) {
  case 10, 9:
    letterGrade = "A"
    totalA += 1
  case 8:
    letterGrade = "B"
    totalB += 1
  case 7:
    letterGrade = "C"
    totalC += 1
  case 6:
    letterGrade = "D"
    totalD += 1
  default:
    letterGrade = "F"
    totalF += 1
  }
  
  if student.course=="Math"
  {
    line = "\(student.firstName) \(student.lastName)".padding(toLength: 40, withPad: " ", startingAt: 0) + " \(finalExam)".padding(toLength: 8, withPad: " ", startingAt: 0) + "\(finAvg)".padding(toLength: 8, withPad: " ", startingAt: 0) + "\(letterGrade)".padding(toLength: 6, withPad: " ", startingAt: 0)+"\n"
  }else if student.course=="English" {
    line = "\(student.firstName) \(student.lastName)".padding(toLength: 40, withPad: " ", startingAt: 0) + " \(finalExam)".padding(toLength: 8, withPad: " ", startingAt: 0) + "\(finAvg)".padding(toLength: 8, withPad: " ", startingAt: 0) + "\(letterGrade)".padding(toLength: 6, withPad: " ", startingAt: 0)+"\n"
  }else if student.course=="History"
  {
    line = "\(student.firstName) \(student.lastName)".padding(toLength: 40, withPad: " ", startingAt: 0) + " \(finalExam)".padding(toLength: 8, withPad: " ", startingAt: 0) + "\(finAvg)".padding(toLength: 8, withPad: " ", startingAt: 0) + "\(letterGrade)".padding(toLength: 6, withPad: " ", startingAt: 0)+"\n"
  }
  
  switch student.course {
  case "English":
    englishLines.append(line)
  case "History":
    historyLines.append(line)
  case "Math":
    mathLines.append(line)
  default:
    fatalError("Unknown subject: \(student.course)")
  }
}

// How to write into a file?
let outputFilename = "sample.out"
var outputString = ""
if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
  outputString = """
                 Student Grade Summary
                 ---------------------
                 
                 ENGLISH CLASS
                 
                 Student                                   Final   Final   Letter
                 Name                                      Exam    Avg     Grade
                 ----------------------------------------------------------------
                 \(englishLines)
                 
                 HISTORY CLASS
                 
                 Student                                   Final   Final   Letter
                 Name                                      Exam    Avg     Grade
                 ----------------------------------------------------------------
                 \(historyLines)
                 
                 MATH CLASS
                 
                 Student                                   Final   Final   Letter
                 Name                                      Exam    Avg     Grade
                 ----------------------------------------------------------------
                 \(mathLines)
                 
                 OVERALL GRADE DISTRIBUTION
                 A:   \(totalA)
                 B:   \(totalB)
                 C:   \(totalC)
                 D:   \(totalD)
                 F:   \(totalF)
                 """
  let fileURL = dir.appending(path: outputFilename)
  do {
    try outputString.write(to: fileURL, atomically: false, encoding: .utf8)
    print("Sucessfully wrote into \(fileURL.absoluteString)")
  } catch {
    print(error.localizedDescription)
  }
}


