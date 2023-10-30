//
//  ClassViewModel.swift
//  MVVM1
//
//  Created by Adesh Shah on 2023-10-30.
//

import Foundation

class StudentManager:ObservableObject{
    @Published var students = [Student(name:"student 1", grade: 1, graduated: false), Student(name:"student 2", grade: 2, graduated: false), Student(name:"student 3", grade: 3, graduated: false), Student(name:"student 4", grade: 4, graduated: false), Student(name:"student 5", grade: 5, graduated: false)]
    
    func moveStudent(indices:IndexSet, newOffset:Int){
        students.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addStudent(){
        students.append(Student(id: UUID(), name: "NEW STUDENT", grade: 0, graduated: false))
    }
    
    func deleteteStudent(at indexSet: IndexSet){
        for index in indexSet{
            students.remove(at: index)
        }
    }
}
