import Foundation

enum Animals {
    case cat, dog, rabbit
}

let cat = Animals.cat

switch cat {
    case .cat:
        "This is a cat"
        break
    case .dog:
        "This is a dog"
        break
    case .rabbit:
        "This is a rabbit"
        break
}

let cat2 = Animals.cat
switch cat2 {
    case .cat:
        "This is a cat"
        break
    case .dog:
        "this is a dog"
    break
    //Si solo coloco estos dos, el ide xcode me marca error porque me falta colocar rabbit xq debe ser exhaustivo(cubrir todos los casos), por lo que si no quiero colocar los que siguen, se debe colocar default
    default:
        "This is something else"
}

//Nosotros tambièn podemos pasar valores a las instancias de los enums como paràmetros

enum ShortCut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = ShortCut.wwwUrl(path: URL(string: "https://apple.com")!)

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    var getManufacturer2:String {
        switch self {
            case let .car(manufacturer, _),
                let .bike(manufacturer, _):
                return manufacturer
        }
    }
}

let car = Vehicle.car(
    manufacturer: "Tesla",
    model: "X"
)

switch car { //Me retornarìa "Tesla"
    case let .car(manufacturer, _):
        manufacturer
        break
    case let .bike(manufacturer, _):
        manufacturer
        break
}

let bike = Vehicle.bike(
    manufacturer: "HD",
    yearMade: 1987
)

switch bike { //Me retornarìa "HD"
    case let .car(manufacturer, _):
        manufacturer
        break
    case let .bike(manufacturer, _):
        manufacturer
        break
}

//Otra Forma es haciendo una function
func getManufacturer(from vehicle: Vehicle) -> String {
    switch vehicle {
        case let .car(manufacturer, _): // Con "_" le estamos diciendo que ignore lo otro
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
    }
}

getManufacturer(from: car) //Imprime "Tesla"
getManufacturer(from: bike) //Imprime "HD"

//Otra forma màs compacta es trasladar la funciòn getManufacturer dentro del enum y convertirlo a una propiedad
car.getManufacturer2
bike.getManufacturer2

enum FamilyMember: String { //Debo colocar el tipo de valor del enum para que se vaya el error
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue
FamilyMember.brother.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case blush = "😊"
    case rocket = "🚀"
    case fire = "🔥"
}

FavoriteEmoji.allCases // Utilizando el protocol CaseIterable, podemos listar todos los casos
FavoriteEmoji.allCases.map(\.rawValue) //Mapeamos todos los valores

if let blush = FavoriteEmoji(rawValue: "😊") {
    "Found the blush emoji"
    blush
} else {
    "This emoji doen't exist"
}

if let snow = FavoriteEmoji(rawValue: "❄️") {
    "Snow exists!? Really?"
    snow
} else {
    "As expected, snow doesn't exist in our enum"
}
