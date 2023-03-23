//
//  MathStudent.swift
//  StudentGrades
//
//  Created by Dogus Guleryuz on 20.03.2023.
//

import Foundation

class MathStudent: Student {
  private(set) var quiz1: Int
  private(set) var quiz2: Int
  private(set) var quiz3: Int
  private(set) var quiz4: Int
  private(set) var quiz5: Int
  private(set) var test1Grade: Int
  private(set) var test2Grade: Int
  private(set) var finalExamGrade: Int
  
  init(firstName: String, lastName: String, quiz1: Int, quiz2: Int, quiz3: Int, quiz4: Int, quiz5: Int, test1Grade: Int, test2Grade: Int, finalExamGrade: Int) {
    self.quiz1 = quiz1
    self.quiz2 = quiz2
    self.quiz3 = quiz3
    self.quiz4 = quiz4
    self.quiz5 = quiz5
    self.test1Grade = test1Grade
    self.test2Grade = test2Grade
    self.finalExamGrade = finalExamGrade
    super.init(firstName: firstName, lastName: lastName, course: "Math", finalExam: finalExamGrade)
  }
  
  override func computeFinalAverage() -> Double {
    let resultOfQuizes=(quiz1+quiz2+quiz3+quiz4+quiz5)/5
    return Double(resultOfQuizes) * 0.15 +
    Double(test1Grade) * 0.25 +
    Double(test2Grade) * 0.25 +
    Double(finalExamGrade) * 0.35
  }
}

