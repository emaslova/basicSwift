import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.







struct Queue<T> {
    
    private var element: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeLast()
    }
    
    func totalWeight() {
        guard elements.count > 0 else { return }
        var totalWeight: Double = 0
        elements.forEach { totalWeight += $0.weight }
        print("Вес всех элементов: ", totalWeight)
    }
}
}
