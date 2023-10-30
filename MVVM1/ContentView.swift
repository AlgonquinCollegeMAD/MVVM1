//
//  ContentView.swift
//  MVVM1
//
//  Created by Adesh Shah on 2023-10-30.
//

import SwiftUI

// Model
struct Course {
     let id: Int
     let courseCode: String
     let courseName: String
     let courseDescription: String
 }

// ViewModel

class CourseViewModel: ObservableObject {
    @Published var courses: [Course] = []
    func getCourses() {
        courses = [
            .init(id: 1, courseCode: "MAD9042", courseName: "Mobile Industry Trends", courseDescription: "This course investigates a variety of current topics related to the mobile industry and app development. While the specific course topics change each year to reflect technological developments in the industry, they can include recent trends in software development and testing, laws concerning data storage and privacy, new hardware technologies in mobile devices, sensor technology, Internet of Things, virtual and augmented reality, and cloud APIs."),
            .init(id: 2, courseCode: "MAD9145", courseName: "Applied Industry Projects", courseDescription: "Working in teams, students experience the analysis, design, implementation, testing and deployment of a mobile solution for a real-world client. Important topics from throughout their program of study are applied in this course. Faculty advisors facilitate student teams to demonstrate their skills in the applied project. Student teams make a technical presentation to their faculty advisors and participate in a public showcase of projects."),
            .init(id: 3, courseCode: "MAD9143", courseName: "Branding and Marketing for the Mobile", courseDescription: "The mobile landscape from a brand and marketing point of view is examined. Students learn about core brand elements and marketing strategies to successfully launch a mobile brand, analysing marketing performance, as well as other entrepreneurial skills. Working in teams they explore the importance of branding and marketing within the context of real-world mobile development projects."),
            .init(id: 4, courseCode: "String", courseName: "Cross-Platform Native Development", courseDescription: "Mobile application development can be accomplished through a variety of languages and frameworks. Students learn how to create cross-platform mobile applications, which access native platform features, while using a compiled native programming language. Object-oriented concepts and development techniques are explored using multi-platform app technologies such as .Net Maui. Designing for cross-platform compatibility and conserving battery life on mobile devices are stressed.")
            ]
    }
}

struct ContentView: View {
    @StateObject var vm  = CourseViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(vm.courses, id: \.id){
                    course in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(course.courseCode).bold()
                            Text(course.courseName)
                            Text(course.courseDescription).lineLimit(1)
                                .font(.footnote)
                            
                            
                        }
                        Spacer()
                        Text("\(course.id)")
                            .bold()
                            .padding()
                    }
                }
            }.navigationTitle("Level 4 courses")
    
        }
        .onAppear {
            vm.getCourses()
        }
    }
 
}
#Preview {
    ContentView()
}
