//
//  AddTrainingView.swift
//  Interval
//
//  Created by Misha Kuznecov on 02/02/2021.
//

import SwiftUI

class Training: ObservableObject {
    @Published var exercises = [Exercise]()
}

struct AddTrainingView: View {
    @ObservedObject var training = Training()
    @State private var showingNewExercise = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(training.exercises) { exercise in
                        HStack {
                            Text("\(exercise.name)")
                            Spacer()
                            Text("\(exercise.repetitions ?? 0)")
                        }
                        
                    }
                }
                Button {
                    showingNewExercise = true
                } label: {
                    Text("Add exercise")
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 60, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .navigationTitle("New Training")
                .sheet(isPresented: $showingNewExercise) {
                    AddExerciseView(training: training)
                }
            }
        }
    }
}

struct AddTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        AddTrainingView()
    }
}
