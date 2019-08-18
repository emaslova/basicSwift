import UIKit
import Foundation

enum CarBody: String {
    case sedan = "Седан"
    case hatchback = "Хэтчбэк"
    case minivan = "Минивэн"
    case jeep = "Внедорожник"
    case coupe = "Купе"
    case pickup = "Пикап"
    case truck = "Грузовик"
}

enum CarColor: String { // цвет машины задан не через UIColor, потому что его нельзя через rawValue красиво напечатать в консоли, получается Цвет машины: UIExtendedSRGBColorSpace 1 0.5 0 1 , а хочется чтобы было красиво :))
    case white = "Белый"
    case black = "Чёрный"
    case red = "Красный"
    case pink = "Розовый"
    case green = "Зелёный"
    case purple = "Фиолетовый"
    case silver = "Серебристый"
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
    let carColor: CarColor
    var km: Double
    var transmission: Transmission
    var trunkVolume: TrunkVolume
    var engineRunning: EngineRunning
    var windowsOpen: WindowsOpen {
        willSet {
            if newValue == .openDriversWindow {
                print("Курить нехорошо! Особенно в машине!")
            } else {
                print("Вы молодец, что не курите в машине!")
            }
        }
    }
    
    var doorOpen: DoorOpen
    var trunkFilledUp: Int
    
    
    
    var description: String {
        get {
            return "Марка машины: \(carBrand)\nКузов автомобиля: \(carBody.rawValue)\nГод выпуска: \(yearOfIssue) \nЦвет машины: \(carColor.rawValue)\nПробег: \(km) \nКоробка передач: \(transmission.rawValue) \nОбъём багажника: \(trunkVolume.rawValue) \nДвигатель в положении: \(engineRunning) \nОкна: \(windowsOpen.rawValue) \nДвери в положении: \(doorOpen.rawValue) \nЗаполненный объем багажника: \(trunkFilledUp)%"
        }
        set {
            if let newKm = Double(newValue) {
                self.km = newKm
            }
        }
    }
}

var car1 = Car(carBrand: "Ситроен", carBody: .hatchback, yearOfIssue: 2011, carColor: .black, km: 149111.0, transmission: .auto, trunkVolume: .extraSmall, engineRunning: .stop, windowsOpen: .closed, doorOpen: .close, trunkFilledUp: 50)

var car2 = Car(carBrand: "Какая-то большая фура", carBody: .truck, yearOfIssue: 2018, carColor: .silver, km: 350432.67, transmission: .manual, trunkVolume: .extraLarge, engineRunning: .start, windowsOpen: .open, doorOpen: .close, trunkFilledUp: 40)

print("ОПИСАНИЕ МОЕЙ МАШИНЫ:")
print(car1.description)
car1.description = "150000.0"
print("")
print(car1.description)
print("")
print("ОПИСАНИЕ ГРУЗОВИКА:")
print(car2.description)
car2.windowsOpen = .openDriversWindow
print("")
print(car2.description)
