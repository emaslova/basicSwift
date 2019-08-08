import UIKit

print ("Задание 1. Решить квадратное уравнение")
print ("Квадратное уравнение: ax2+bx+c=0") // подсказка для гуманитариев
print ("")
print ("Дано:")
let a: Float = 1
print ("a = " + String(a))
let b: Float = 1
print ("b = " + String(b))
let c: Float = -6
print ("c = " + String(c))
print ("")
print ("Дискриминант: D=b2–4ac") // подсказка для гуманитариев
var d = b*b - 4*a*c
print ("d = " + String(d))
print ("")
let x = -b / (2*a)
let x1 = -b + sqrt (d) / 2*a
let x2 = -b - sqrt(d) / 2*a
if d < 0 {print ("квадратное уравнение не имеет корней")}
if d==0 {print (("x = ") + String(x))}
if d > 0 {print (("x1 = ") + String(x1) + ("   x2 = ") + String(x2))}
print ("")
print ("Задание 2.")
print ("Даны катеты прямоугольного треугольника. Найти гипотенузу, периметр и площадь треугольника")
var a1: Double = 3
var b1: Double = 4
print ("катет1 = " + String(a1) + "    катет2 = " + String(b1))
var c1 = sqrt((a1*a1) + (b1*b1))
print ("Гипотенуза треугольника = " + String(c1))
var d1: Double = a1 + b1 + c1
print ("Периметр треугольника = " + String(d1))
var s: Double = (a1 + b1) / 2
print ("Площадь треугольника = " + String(s))
print("")
print ("Задание 3.")
print ("Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет")
var deposit: Double = 100000
var percent: Double = 10
var year: Double = 5
print ("Сумма вклада = " + String(deposit))
print ("Годовой процент = " + String(percent) + "%")
print ("Вклад на " + String(year) + " лет")
var total = deposit * percent * year // знаю, что самый простой вариант, логичнее написать формулу, которая будет высчитывать процент каждый год или даже месяц и плюсовать ее к основному вкладу, но у меня адски тяжело даются все эти формулы :( 
print ("При начислении процентов в конце срока сумма вклада: " + String(total) + "рублей")






