//MARK: - Linear Search ============================> Most Important<============================

let arrayik = [1, 2, 3, 4, 5, 6, 7, 8, 9]

func findNumber(arr: [Int], x: Int) -> Int {

    for (index, value) in arr.enumerated() {
        if value == x {
            return index
        }
    }
    return -1
}

findNumber(arr: arrayik, x: 5)
findNumber(arr: arrayik, x: 11)

//MARK: - Another type

let arr = [1,3,5,7,9,11,13,15,17,19,21]


func findNumber2(numberToFind: Int, whereToFind: [Int]) -> Int {
 var currentIndex = 0
    
    for item in whereToFind {
        if item == numberToFind {
            return currentIndex
        }
        currentIndex += 1
    }
    return -1
}


findNumber2(numberToFind: 13, whereToFind: arr)
findNumber2(numberToFind: 1, whereToFind: arr)

//MARK: - Type 3

let arro = [1,3,5,7,9,11,13,15,17,19,21]


func findNumber3(numberToFind: Int, whereToFind: [Int]) -> Int? {
    for item in whereToFind {
        if item == numberToFind {
            return whereToFind.firstIndex(of: item)
        }
    }
    return nil
}

findNumber3(numberToFind: 11, whereToFind: arro)

//MARK: - firstIndex(:where)

let grades = [8,7,11,15,18,3,6,7,2,11]

if let index = grades.firstIndex(where: {$0 < 7} ) {
    print("The first index < 7 = \(index)")
}


//MARK: - all(:where)

extension Array where Element: Equatable {
    func all(where predicate: (Element) -> Bool) -> [Element]  {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}

let gradess = [8, 9, 10, 1, 2, 5, 3, 4, 8, 8]
let goodGrades = gradess.all(where: { $0 > 7 })
//print(goodGrades)
// Output: [8, 9, 10, 8, 8]


//MARK: - Binary Search============================> Most Important<============================

let str = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23]


func binarySearch(in numbers: [Int], for value: Int) -> Int?
{
    var left = 0
    var right = numbers.count - 1

    while left <= right {

        let middle = (left + right) / 2

        print("Looking for \(value) in \(numbers[left...right])")
        print("Middle index is \(middle), value is \(numbers[middle])")

        if numbers[middle] < value {
            print("\(numbers[middle]) is smaller than \(value), choosing right half of array")
            left = middle + 1
        } else if numbers[middle] > value {
            print("\(numbers[middle]) is bigger than \(value), choosing left half of array")
            right = middle - 1
        } else {
            return middle
        }
    }

    return nil
}

binarySearch(in: str, for: 15)

//binarySearch(in: str, for: 18)
