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


class Car {
    
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
    
    init(carBrand: String, carBody: CarBody, yearOfIssue: Int, carColor: CarColor, km: Double, transmission: Transmission, trunkVolume: TrunkVolume, engineRunning: EngineRunning, windowsOpen: WindowsOpen, doorOpen: DoorOpen, trunkFilledUp: Int) {
        self.carBrand = carBrand
        self.carBody = carBody
        self.yearOfIssue = yearOfIssue
        self.carColor = carColor
        self.km = km
        self.transmission = transmission
        self.trunkVolume = trunkVolume
        self .engineRunning = engineRunning
        self.windowsOpen = windowsOpen
        self.doorOpen = doorOpen
        self.trunkFilledUp = trunkFilledUp
    }
    
    func goToDrive() {
        var newKm = km
        newKm += 100.0
        km = newKm
        
        print("Пробег увеличен на 100 км")
    }
    
}


class SportCar: Car {
    
    weak var transported: TrunkCar?
    var spoiler: String
    var sportsSuspension: String
    var sportsBrakeSystem: String
    var sportsWheels: Int
    
    override var description: String {
        get {
            return "Марка машины: \(carBrand)\nКузов автомобиля: \(carBody.rawValue)\nГод выпуска: \(yearOfIssue) \nЦвет машины: \(carColor.rawValue)\nПробег: \(km) \nКоробка передач: \(transmission.rawValue) \nОбъём багажника: \(trunkVolume.rawValue) \nДвигатель в положении: \(engineRunning) \nОкна: \(windowsOpen.rawValue) \nДвери в положении: \(doorOpen.rawValue) \nЗаполненный объем багажника: \(trunkFilledUp)% \nМашина перевозится с помощью: \(transported?.carBrand ?? "не транспортируется, едет сама") \nСпойлер: \(spoiler) \nСпортивная подвеска: \(sportsSuspension) \nСпортивная тормозная система: \(sportsBrakeSystem) \nСпортивные колёса: \(sportsWheels)"
        }
        set {
            if let newKm = Double(newValue) {
                self.km = newKm
            }
        }
    }
    
    init(carBrand: String, carBody: CarBody, yearOfIssue: Int, carColor: CarColor, km: Double, transmission: Transmission, trunkVolume: TrunkVolume, engineRunning: EngineRunning, windowsOpen: WindowsOpen, doorOpen: DoorOpen, trunkFilledUp: Int, transported: TrunkCar? = nil, spoiler: String, sportsSuspension: String, sportsBrakeSystem: String, sportsWheels: Int) {
        
        self.transported = transported
        self.spoiler = spoiler
        self.sportsSuspension = sportsSuspension
        self.sportsBrakeSystem = sportsBrakeSystem
        self.sportsWheels = sportsWheels
        super.init(carBrand: carBrand, carBody: carBody, yearOfIssue: yearOfIssue, carColor: carColor, km: km, transmission: transmission, trunkVolume: trunkVolume, engineRunning: engineRunning, windowsOpen: windowsOpen, doorOpen: doorOpen, trunkFilledUp: trunkFilledUp)
        }
    
    override func goToDrive() {
        super.goToDrive()
        print("Слишком быстро не гоняй!")
    }
    
    func takesUpgradeInWorkshop() {
        let newSportsWheels = sportsWheels
        newSportsWheels == 4
        sportsWheels = newSportsWheels
        print("У вашего спорткара 4 новых супер-спортивных колеса.")
    }
}

class TrunkCar: Car {
    
    unowned let transports: SportCar
    var trailer: String
    var trunkWheels: Int
    
    override var description: String {
        get {
            return "Марка машины: \(carBrand)\nКузов автомобиля: \(carBody.rawValue)\nГод выпуска: \(yearOfIssue) \nЦвет машины: \(carColor.rawValue)\nПробег: \(km) \nКоробка передач: \(transmission.rawValue) \nОбъём багажника: \(trunkVolume.rawValue) \nДвигатель в положении: \(engineRunning) \nОкна: \(windowsOpen.rawValue) \nДвери в положении: \(doorOpen.rawValue) \nЗаполненный объем багажника: \(trunkFilledUp)% \nПеревозит: \(transports.carBrand) \nПрицеп: \(trailer) \nКолёса: \(trunkWheels)"
        }
        set {
            if let newKm = Double(newValue) {
                self.km = newKm
            }
        }
    }
    
    init(carBrand: String, carBody: CarBody, yearOfIssue: Int, carColor: CarColor, km: Double, transmission: Transmission, trunkVolume: TrunkVolume, engineRunning: EngineRunning, windowsOpen: WindowsOpen, doorOpen: DoorOpen, trunkFilledUp: Int, transports: SportCar, trailer: String, trunkWheels: Int) {
        
        self.transports = transports
        self.trailer = trailer
        self.trunkWheels = trunkWheels
        super.init(carBrand: carBrand, carBody: carBody, yearOfIssue: yearOfIssue, carColor: carColor, km: km, transmission: transmission, trunkVolume: trunkVolume, engineRunning: engineRunning, windowsOpen: windowsOpen, doorOpen: doorOpen, trunkFilledUp: trunkFilledUp)
    }
    
    override func goToDrive() {
        super.goToDrive()
        print("Доставка будет вовремя!")
    }
    
    func makeSafer() {
        var newTrunkWheels = trunkWheels
        newTrunkWheels += 2
        trunkWheels = newTrunkWheels
        print("Добавлено 2 запасных колеса. Грузовик стал безопаснее.")
    }
    
}





var sportCar: SportCar = SportCar(carBrand: "Porsche GT3 RS", carBody: .coupe, yearOfIssue: 2015, carColor: .red, km: 20000.0, transmission: .manual, trunkVolume: .extraSmall, engineRunning: .stop, windowsOpen: .closed, doorOpen: .close, trunkFilledUp: 0, spoiler: "Есть", sportsSuspension: "установлена", sportsBrakeSystem: "Заводская комплектация", sportsWheels: 4)

var trunkCar: TrunkCar = TrunkCar(carBrand: "Mercedes-Benz Actros", carBody: .truck, yearOfIssue: 2011, carColor: .silver, km: 350000.0, transmission: .auto, trunkVolume: .extraLarge, engineRunning: .start, windowsOpen: .openDriversWindow, doorOpen: .close, trunkFilledUp: 50, transports: sportCar, trailer: "отсутствует", trunkWheels: 6)

sportCar.transported = trunkCar

print("ОПИСАНИЕ СПОРТКАРА:")
print(sportCar.description)
sportCar.goToDrive()
sportCar.takesUpgradeInWorkshop()
print("")
print("ОПИСАНИЕ ГРУЗОВИКА:")
print(trunkCar.description)
trunkCar.goToDrive()
trunkCar.makeSafer()
