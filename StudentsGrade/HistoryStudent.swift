//
//  HistoryStudent.swift
//  StudentGrades
//
//  Created by Dogus Guleryuz on 20.03.2023.
//

import Foundation

class HistoryStudent: Student {
  private(set) var attendanceGrade: Int
  private(set) var projectGrade: Int
  private(set) var midtermGrade: Int
  private(set) var finalExamGrade: Int
  
  init(firstName: String, lastName: String, attendanceGrade: Int, projectGrade: Int, midtermGrade: Int, finalExamGrade: Int) {
    self.attendanceGrade = attendanceGrade
    self.projectGrade = projectGrade
    self.midtermGrade = midtermGrade
    self.finalExamGrade = finalExamGrade
    super.init(firstName: firstName, lastName: lastName, course: "History",finalExam: finalExamGrade)
  }
  
  override func computeFinalAverage() -> Double  {
    return Double(attendanceGrade) * 0.1 +
    Double(projectGrade) * 0.3 +
    Double(midtermGrade) * 0.3 +
    Double(finalExamGrade) * 0.3
  }
}
