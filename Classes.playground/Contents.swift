import Foundation

//La difenrencia entre las estructuras y las clases en swift, es que las estructuras por si misma ya incorporan un constructor, mientras que las clases debes espeficiar el inicializador o constructor

struct Persona {
    var name: String
    var age: Int
}

Persona(name: "Carlos", age: 32)

class Person {
    var name:String
    var age:Int
    
    init(
        name: String,
        age:Int
    ) {
        self.name = name
        self.age = age
    }
    //en las structures deberiamos hacer mutating func en vez de solo func
    func increseAge() {
        self.age += 1
    }
}

let foo = Person(
    name: "Foo",
    age: 20
)
foo.age //resultado 20
foo.increseAge()
foo.age //resultado 21
