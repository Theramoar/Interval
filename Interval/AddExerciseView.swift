//
//  ContentView.swift
//  Interval
//
//  Created by Misha Kuznecov on 02/02/2021.
//

import SwiftUI
import CoreData

struct Exercise: Identifiable {
    var id = UUID()
    var name: String
    var time: TimeInterval?
    var repetitions: Int?
}


struct AddExerciseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var training: Training
    @State private var exerciseName = ""
    @State private var exerciseCountType = 0
    @State private var exerciseCountTypes = ["Time", "Repetitions"]
    @State private var repetitionsString = ""
    @State private var timeString = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Exercise name", text: $exerciseName)
                Picker("Exercise count", selection: $exerciseCountType) {
                    ForEach(0 ..< exerciseCountTypes.count) {
                        Text("\(self.exerciseCountTypes[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                if exerciseCountType == 0 {
                    timeTextField
                }
                else {
                    repetitionsTextField
                    
                }
                Button("Add Exercise") {
                    appendExercise()
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Add Exercise")
        }
    }
    
    var repetitionsTextField: some View {
        TextField("Number of repetitions", text: $repetitionsString)
        
    }
    
    var timeTextField: some View {
        TextField("Time of exercise", text: $timeString)
    }
    
    
    private func appendExercise() {
        let repetitions = Int(repetitionsString)
        let time = TimeInterval(timeString)
        let exercise = Exercise(name: exerciseName, time: time, repetitions: repetitions)
        training.exercises.append(exercise)
        print(training.exercises.count)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView(training: Training()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
