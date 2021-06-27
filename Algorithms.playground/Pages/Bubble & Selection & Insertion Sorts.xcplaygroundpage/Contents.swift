//MARK: - Bubble Sort

//MARK: - Simple Tipe
/*
 
 TIME COMPLEXITY of Bubble Sort
 BEST     - O(n)
 AVERAGE  - O(n^2)                                                                                                     Time Complexity
 WORST    - O(n^2)
 
 */

var array = [6,2,4,5]

func bubble(arrToSort: inout [Int]) -> [Int] {
    
    guard arrToSort.count > 1 else {return arrToSort}
    
    for i in 0..<arrToSort.count - 1 {     // Sra qanak@ misht havasar e MASIVI ELEMENTNERI QANAKIC HANAC 1
        for j in 1..<arrToSort.count - i {
            if arrToSort[j] < arrToSort[j-1] {
                let ternary = arrToSort[j]
                arrToSort[j] = arrToSort[j-1] // es 3 tox@ chgrelu hamar ka function|arrToSort.swap()
                arrToSort[j-1] = ternary
            }
        }
    }
    return arrToSort
}

var x = [8,3,5,4,6]
//    i = 0  [3,8,5,4,6] - [3,5,8,4,6] - [3,5,4,8,6] - [3,5,4,6,8]
//               j = 0         j = 1        j = 2         j = 3
//    i = 1  [3,5,4,6,8] - [3,4,5,6,8] - [3,4,5,6,8] - [3,4,5,6,8]
//               j = 0         j = 2        j = 3         j = 4
//
//
//


func bubble2(arr: inout [Int]) -> [Int] {
    guard arr.count > 1 else {return arr}
    // count = 5
    for i in 0..<arr.count - 1 { //(-1) nra hamara vor verjin elementi vra chkagni u Index out of Bounds chngni
        for j in 0..<arr.count - i - 1 { //(-1) nra hamara j=4-i jamanak Index out of bounds chngni
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
        }
    }
       return arr
}
bubble2(arr: &x)
bubble(arrToSort: &array)

//MARK: - Bubble Sort(Advanced Version)

extension Array where Element: Comparable {
    
    func bubbleSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) { // 1
            for j in 0..<(data.count-i-1) where areInIncreasingOrder(data[j+1], data[j]) { // 2
                data.swapAt(j, j + 1)
            }
        }
        
        return data
    }
}

array.bubbleSort()
array.bubbleSort(by: >)
//MARK: - Seleciton Sort
// [8,3,5,4,6]
//
//    i = 0         [8,3,5,4,6] --- [8,3,5,4,6]--[8,3,5,4,6]----[8,3,5,4,6]
//                     j = 1         j = 2        j = 3          j = 4
//  lowest = 0        lowest = 1    lowest = 1    lowest = 1      lowest = 1
//
//    i = 1         [3,8,5,4,6] --- [3,8,5,4,6]--[3,8,5,4,6]
//                     j = 2         j = 3        j = 4
//  lowest = 1       lowest = 2    lowest = 3    lowest = 3
//
//    i = 2         [3,4,5,8,6] --- [3,4,5,8,6]
//                     j = 3         j = 4
//  lowest = 2       lowest = 2    lowest = 2
//
//    i = 3         [3,4,6,8,5]------------FINAL [3,4,5,6,8]
//                     j = 4
//                  lowest = 3
//
//
// Selection@ lav hishelu hamar hishi vor SELECT enq anum LOWEST VALUE ev hamematum mnacac arjeqneri het.
//Selectionnel ena arrayi dzax koxm@ @ndunuma SORTED u aj koxmic gnum LOWEST arjeqa gtnum u qcum a dzax koxmi mej
/*

TIME COMPLEXITY of Selection Sort
BEST     - O(n^2)
AVERAGE  - O(n^2)                                                                                                     Time Complexity
WORST    - O(n^2)

*/
//[2, 5, 3, 1, 0]
func selectionSort(arrToSort: inout [Int]) -> [Int] {
    
    guard arrToSort.count > 1 else {return arrToSort}
    
    for i in 0..<arrToSort.count - 1 {
        
        var lowest = i
        
        for j in i + 1..<arrToSort.count {
            if arrToSort[j] < arrToSort[lowest] {
                lowest = j
            }
        }
        if lowest != i {
            arrToSort.swapAt(lowest, i)
        }
    }
    return arrToSort
}

var testA = [7,2,6,1,5,9, 41,11,231,123,1233,1231,31,31]
selectionSort(arrToSort: &array)

//MARK: - Selection Sort (Advanced Version)

extension Array where Element: Comparable {
    func advSelectionSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) {
            var key = i // 1
            
            for j in i+1..<data.count where areInIncreasingOrder(data[j], data[key]) { // 2
                key = j
            }
            
            guard i != key else { continue }
            
            data.swapAt(i, key) // 3
        }
        
        return data
    }
}

var am = [11,9,8,7,6,5]

//MARK: - Insertion Sort
//Insertion@ ena vor 1 in element@ @ndunuma arden sortavorvac u iranic heto elementner@ arden hamematuma ira het. Tenc dasavoruma arrayi dzax koxm@ sortavorac elementner@.Ete arden sortavorvacner@ mi qanisn en apa aji elementner@ hertov hamematuma minchev et elementi tex@ konkret gtni

// HEST HISHELU DZEV------Hishi vor arrayi element@ vekaluma u depi dzax SAXI HET HAMEMATELOV iran dnum a IRA TEX@
var amr = [8,3,5,4,6]
//[8,3,5,4,6] x = 0
//[3,8,5,4,6] x = 1
//[3,5,8,4,6] x = 2
//[3,4,5,8,6] x = 3
//[3,4,5,6,8] x = 4


/*

TIME COMPLEXITY of Insertion Sort
BEST     - O(n)
AVERAGE  - O(n^2)                                                                                                     Time Complexity
WORST    - O(n^2)

*/

func insertionSort(arr: inout [Int]) -> [Int] {
    guard arr.count > 1 else {return arr}
    
    for x in 0..<arr.count {
        var y = x
        while y > 0 && arr[y] < arr[y-1] {
            arr.swapAt(y, y-1)
            y -= 1                        // Es grvuma nra hamar vor het ijnelov stugi
        }
    }
    return arr
}

insertionSort(arr: &testA)

//func insertin(arr: inout [Int]) -> [Int] {
//
//}
//[8,3,5,4,6]
//    i = 0  [3,8,5,4,6] - [3,5,8,4,6] - [3,5,4,8,6] - [3,5,4,6,8]
//               j = 1         j = 2        j = 3         j = 4
//    i = 1  [3,5,4,6,8] - [3,4,5,6,8] - [3,4,5,6,8] - [3,4,5,6,8]
//               j = 1         j = 2        j = 3         j = 4
//
//
//


func bubbleSort3(_ arrToSort: inout [Int]) -> [Int] {
    guard arrToSort.count > 1 else { return arrToSort }
    
    for i in 0..<arrToSort.count - 1 {
        for j in 1..<arrToSort.count - i {
            if arrToSort[j] < arrToSort[j-1] {
                arrToSort.swapAt(j, j-1)
            }
        }
    }
    return arrToSort
}

