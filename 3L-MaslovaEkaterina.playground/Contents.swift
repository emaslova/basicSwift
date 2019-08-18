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

enum DoorOpen: String {
case open, close
}

enum Transmission: String {
    case manual = "Механика"
    case auto = "Автомат"
}

enum EngineRunning {
    case start, stop
}

enum WindowsOpen: String {
    case open = "Открыты"
    case closed = "Закрыты"
    case ajar = "Приоткрыты"
    case openDriversWindow = "Открыто окно со стороны водителя. Он, наверное, курит! Ай-яй-яй, как нехорошо!"
}

enum TrunkVolume: String {
    case extraLarge = "Очень большой"
    case large = "Большой"
    case middle = "Средний"
    case small = "Маленький"
    case extraSmall = "Очень маленький"
}


struct Car {
    
    let carBrand: String
    let carBody: CarBody
    let yearOfIssue: Int
    let carcolor:  
    var km: Double
    var transmission: Transmission
    var trunkVolume: TrunkVolume
    var engineRunning: EngineRunning
    var windowsOpen: WindowsOpen
    var doorOpen: DoorOpen
    var trunkFilledUp: Int
    
    var description: String {
        return "Марка машины: \(carBrand)\nКузов автомобиля: \(carBody.rawValue)\nГод выпуска: \(yearOfIssue) \nЦвет машины: \(carcolor)\nПробег: \(km) \nКоробка передач: \(transmission.rawValue) \nОбъём багажника: \(trunkVolume.rawValue) \nДвигатель в положении: \(engineRunning) \nОкна: \(windowsOpen.rawValue) \nДвери в положении: \(doorOpen.rawValue) \nЗаполненный объем багажника: \(trunkFilledUp)%"
    }
}

var car1 = Car(carBrand: "BMW", carBody: .coupe, yearOfIssue: 2019, carcolor: .orange, km: 210.50, transmission: .auto, trunkVolume: .middle, engineRunning: .stop, windowsOpen: .closed, doorOpen: .close, trunkFilledUp: 50)

print(car1.description)




