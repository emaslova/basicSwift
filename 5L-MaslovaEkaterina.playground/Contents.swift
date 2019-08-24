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

enum CarColor: String {
    case white = "Белый"
    case black = "Чёрный"
    case red = "Красный"
    case pink = "Розовый"
    case green = "Зелёный"
    case purple = "Фиолетовый"
    case silver = "Серебристый"
}


protocol Car {
    var carBrand: String { get }
    var carBody: CarBody { get }
    var yearOfIssue: Int { get }
    var carColor: CarColor { get }
    var km: Double {get set}
    
    func engineWorking(engine: String)
    func windowsOpen(windows: String)
}

extension Car {
    func engineWorking(engine: String) {
        switch engine {
        case "start":
            print("Двигатель работает.")
        default:
            print("Двигатель заглушен.")
        }
    }
}


extension Car {
    func windowsOpen(windows: String) {
        switch windows {
        case "open":
            print("Окна открыты.")
        case "closed":
            print("Окна закрыты.")
        default:
            print("Окна приоткрыты.")
        }
    }
}


class SportCar: Car {
    var carBrand: String
    var carBody: CarBody
    var yearOfIssue: Int
    var carColor: CarColor
    var km: Double
    
    var spoiler: String
    var sportsSuspension: String
    var sportsBrakeSystem: String
    
    
    init(carBrand: String, carBody: CarBody, yearOfIssue: Int, carColor: CarColor, km: Double, spoiler: String, sportsSuspension: String, sportsBrakeSystem: String) {
        self.carBrand = carBrand
        self.carBody = carBody
        self.yearOfIssue = yearOfIssue
        self.carColor = carColor
        self.km = km
        self.spoiler = spoiler
        self.sportsSuspension = sportsSuspension
        self.sportsBrakeSystem = sportsBrakeSystem
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Марка машины: \(carBrand)\nКузов автомобиля: \(carBody.rawValue)\nГод выпуска: \(yearOfIssue) \nЦвет машины: \(carColor.rawValue)\nПробег: \(km) \nСпойлер: \(spoiler) \nСпортивная подвеска: \(sportsSuspension) \nСпортивная тормозная система: \(sportsBrakeSystem)"
    }
}



class TrunkCar: Car {
    
    var carBrand: String
    var carBody: CarBody
    var yearOfIssue: Int
    var carColor: CarColor
    var km: Double
    
    var trailer: String
    var trunkWheels: Int
    
    init(carBrand: String, carBody: CarBody, yearOfIssue: Int, carColor: CarColor, km: Double, trailer: String, trunkWheels: Int) {
        
        self.carBrand = carBrand
        self.carBody = carBody
        self.yearOfIssue = yearOfIssue
        self.carColor = carColor
        self.km = km
        self.trailer = trailer
        self.trunkWheels = trunkWheels
        
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Марка машины: \(carBrand)\nКузов автомобиля: \(carBody.rawValue)\nГод выпуска: \(yearOfIssue) \nЦвет машины: \(carColor.rawValue)\nПробег: \(km)\nПрицеп: \(trailer) \nКолёса: \(trunkWheels)"
    }
}


var sportCar: SportCar = SportCar(carBrand: "Porsche GT3 RS", carBody: .coupe, yearOfIssue: 2019, carColor: .pink, km: 210000.0, spoiler: "Есть", sportsSuspension: "установлена", sportsBrakeSystem: "Заводская комплектация")


var trunkCar: TrunkCar = TrunkCar(carBrand: "Mercedes-Benz Actros", carBody: .truck, yearOfIssue: 2011, carColor: .green, km: 54879.58, trailer: "отсутствует", trunkWheels: 6)


print("ОПИСАНИЕ СПОРТКАРА:")
print(sportCar.description)
sportCar.engineWorking(engine: "start")
sportCar.windowsOpen(windows: "open")
print("")
print("ОПИСАНИЕ ГРУЗОВИКА:")
print(trunkCar.description)
trunkCar.engineWorking(engine: "no")
trunkCar.windowsOpen(windows: "no")
