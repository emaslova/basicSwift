import UIKit

// Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

// Контроль ежедневной калорийности на диете

enum DailyCaloriesError: Error {
    // съедено слишком много
    case toManyCalories
}

class DailyCalories {
    
    //максимальное допустимое количество калорий в день, если вы не хотите набрать вес
    var dailyLimit: Int
    
    // счётчик калорий
    var dailyCount: Int

    init(dailyLimit: Int, dailyCount: Int) {
        self.dailyLimit = dailyLimit
        self.dailyCount = dailyCount
    }
    
    func myDailyCount() {
        print("Сегодня вы съели \(dailyCount) калорий")
    }
    
    //  едим что-то
    func eatSomething() throws {
        // проверяем, не превышена ли суточная калорийность
        guard dailyCount <= dailyLimit else { throw DailyCaloriesError.toManyCalories }
    }
    
    func resultOfDay() {
        if dailyCount == dailyLimit {
            print("Вы молодец! Съели ровно столько, сколько нужно!")
        } else if dailyCount < dailyLimit {
            print("Вы можете съесть ещё \(dailyLimit - dailyCount) калорий.")
        } else {
            print("Сегодня вы съели больше на \(dailyCount - dailyLimit) калорий")
        }
    }
}

var dailyCalories = DailyCalories(dailyLimit: 1400, dailyCount: 1600)

dailyCalories.myDailyCount()

do {
    try dailyCalories.eatSomething()
} catch DailyCaloriesError.toManyCalories {
    print("Вы превысили суточную норму калорий!")
} catch let error {
    print(error)
}

dailyCalories.resultOfDay()
