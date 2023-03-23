//
//  Student.swift
//  StudentGrades
//
//  Created by Dogus Guleryuz on 20.03.2023.
//

import Foundation

class Student {
  private(set) var firstName: String
  private(set) var lastName: String
  private(set) var course: String
  private(set) var finalExam: Int
  
  init(firstName: String, lastName: String, course: String, finalExam: Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.course = course
    self.finalExam = finalExam
  }
  
  func getFirstName() -> String {
    return firstName
  }
  
  func getLastName() -> String {
    return lastName
  }
  
  func getCourse() -> String {
    return course
  }
  
  func getFinalExam() -> String {
    return course
  }
  
  func computeFinalAverage() -> Double {
          fatalError("computeFinalAverage() must be implemented in derived classes")
      }
  
}


