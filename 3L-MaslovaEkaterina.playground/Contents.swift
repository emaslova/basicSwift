import UIKit

enum CarBody: String {
    case sedan = "Седан"
    case hatchback = "Хэтчбэк"
    case minivan = "Минивэн"
    case jeep = "Внедорожник"
    case coupe = "Купе"
    case pickup = "Пикап"
    case truck = "Грузовик"
}

enum DoorOpen {
case open, close
}

enum Transmission {
    case manual, auto
}

enum EngineRunning {
    case start, stop
}

enum WindowsOpen: String {
    case open = "Окна открыты"
    case closed = "Окна закрыты"
    case ajar = "Окна приоткрыты"
    case openDriversWindow = "Открыто окно со стороны водителя. Он, наверное, курит! Ай-яй-яй, как нехорошо!"
}


struct Car {
    
    let carBrand: String
    let yearOfIssue: Int
    let carBody: CarBody
    let carcolor: UIColor
    let door: Int
    var environmentalClass: Int
    var engineRunning: EngineRunning
    var windowsOpen: WindowsOpen
    var doorOpen: DoorOpen
    var transmission: Transmission
    var km: Double
}

var car1 = Car(carBrand: "Ситроен", yearOfIssue: 2011, carBody: .hatchback, carcolor: .black, door: 3, environmentalClass: 4, engineRunning: .stop, windowsOpen: .closed, doorOpen: .close, transmission: .auto, km: 150170.50)

var car2 = Car(carBrand: "Какая-то большая фура", yearOfIssue: 2018, carBody: .truck, carcolor: .yellow, door: 2, environmentalClass: 2, engineRunning: .start, windowsOpen: .openDriversWindow, doorOpen: .close, transmission: .manual, km: 121.50)




