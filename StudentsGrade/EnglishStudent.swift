//
//  EnglishStudent.swift
//  StudentGrades
//
//  Created by Dogus Guleryuz on 20.03.2023.
//

import Foundation

class EnglishStudent: Student {
  private(set) var termPaperGrade: Int
  private(set) var midtermGrade: Int
  private(set) var finalExamGrade: Int
  
  init(firstName: String, lastName: String, termPaperGrade: Int, midtermGrade: Int, finalExamGrade: Int) {
    self.termPaperGrade = termPaperGrade
    self.midtermGrade = midtermGrade
    self.finalExamGrade = finalExamGrade
    super.init(firstName: firstName, lastName: lastName, course: "English",finalExam: finalExamGrade)
  }
  
  override func computeFinalAverage() -> Double  {
    return Double(termPaperGrade) * 0.25 +
    Double(midtermGrade) * 0.35 +
    Double(finalExamGrade) * 0.4
  }
}
