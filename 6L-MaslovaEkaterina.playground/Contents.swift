import UIKit
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.



protocol ShoppingListable {
    var clothes: String {get set}
    var price: Double {get set}
}

class ShoppingList: ShoppingListable {
    var clothes: String
    var price: Double
    var size: Int
    
    init(clothes: String, price: Double, size: Int) {
        self.clothes = clothes
        self.price = price
        self.size = size
    }
}

extension ShoppingList {
    var description : String {
        return "Элемент одежды: \(clothes), стоимость: \(price) рублей, размер: \(size)"
    }
}

struct Queue <T: ShoppingListable> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.count == 0
    }
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue() -> T {
        return elements.removeLast()
    }
    
    var shoppingList1: T? {
        if isEmpty {
            print("Ваша корзина пуста.")
            return nil
        } else {
            print("Первым вы добавили в корзину: \(elements.first!)")
            return elements.first
        }
    }
    
    public var shoppingList2: T? {
        if isEmpty {
            print("Ваша корзина пуста.")
            return nil
        } else {
            print("Последний добавленный в корзину товар: \(elements.last!)")
            return elements.last
        }
    }
    
    func shoppingListForMe() {
        guard elements.count > 0 else { return }
        let shoppingListForMe: Int = 0
        print("Всего в вашей корзине товаров: ", shoppingListForMe)
    }
    
    subscript(element: Int...) -> Double {
        var price: Double = 0
        for index in element where index < self.elements.count {
            price += self.elements[index].price
        }
        return price
    }
}

extension Queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var myShoppingListToday: ShoppingList = ShoppingList(clothes: "Юбка", price: 4999.99, size: 44)

print(myShoppingListToday.description)

var shoppingForAll = Queue<ShoppingList>()
shoppingForAll.enqueue(element: .init(clothes: "Шарф", price: 114.0, size: 44))
shoppingForAll.enqueue(element: .init(clothes: "Шапка", price: 482.9, size: 48))
shoppingForAll.enqueue(element: .init(clothes: "Пальто", price: 590.0, size: 46))


shoppingForAll.shoppingList1
shoppingForAll.shoppingList2

let GrandShopping = shoppingForAll.myFilter(predicate: {$0.price == 5})
print(GrandShopping)
