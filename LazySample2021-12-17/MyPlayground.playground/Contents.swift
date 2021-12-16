import UIKit

var greeting = "Hello, playground"



struct Person {
   let name: String
   let age: Int
}

struct PeopleViewModel {
    var people: [Person]
    init(people: [Person]) {
        self.people = people
        print("View model initialized")
    }
 // lazy
   lazy var oldest1: Person? = {
       print("Lazy var oldest initialized")
       return people.max(by: { $0.age < $1.age })
   }()
 // computed
    var oldest2: Person? {
         print("oldest person calculated")
         return people.max(by: { $0.age < $1.age })
     }

}

var viewModel = PeopleViewModel(people: [
   Person(name: "Antoine", age: 30),
   Person(name: "Jaap", age: 3),
   Person(name: "Maaike", age: 27)
])
// lazy
print(viewModel.oldest1!)
// computed
print(viewModel.oldest2!)

viewModel.people.append(Person(name: "Jan", age: 69))
// lazy
print(viewModel.oldest1!)
// computed
print(viewModel.oldest2!)

