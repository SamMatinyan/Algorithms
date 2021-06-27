import UIKit

var array = [8,3,5,6,4]

//MARK: - Merge Sort
//Arrayi elementner@ bajanum enq enqan jamanak minchev amen mek@ lini arandzin Array-i mej
//Ay senc ic --------[7,3,1,8,5,4,2,6]
//                       ||      ||
//                       ||      ||
//               [7,3][1,8]   [5,4][2,6]
//                     ||           ||
//                [3,7] [1,8]     [4,5][2,6]
//                     ||           ||
//                [1,3,7,8]        [2,4,5,6]
//                            ||
//                     [1,2,3,4,5,6,7,8]
//Sranic heto nor sksum enq MERGE(miadzulum) anel, aysinq arrayneri arajin elementrner@ hamematenq irar het
/*
 TIME COMPLEXITY
 Best    - O(n log(n))
 Average - O(n log(n))                                                                                                     Time Complexity
 Worst   - O(n log(n))      log(n)-@ e himqov log a(e ~ 2.7)
 
 */
func mergeSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else {return arr}                                                          //[7, 3, 1, 8, 5, 4, 2, 6]
    
    let leftArray  = Array(arr[0..<arr.count/2])                                                   //[7, 3, 1, 8]
    let rightArray = Array(arr[arr.count/2..<arr.count])                                           //[5, 4, 2, 6]
    
    return merge(left: mergeSort(arr: leftArray), right: mergeSort(arr: rightArray))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    
    var sortedArr = [Int]()                                                          //[]
    var      left = left                                                          //[7, 3, 1, 8]
    var     right = right                                                         //[5, 4, 2, 6]

    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            sortedArr.append(left.removeFirst())
        } else {
            sortedArr.append(right.removeFirst())
        }
    }
    return sortedArr + left + right   // Stex raznica chka demic kgrvi left@ te right@
}


//MARK: - Quick Sort---Sa lav hishelu hamar mi bar a petq hishel----> PIVOT <----QUICK SORT
//STEP 1.  @ndhanur gaxapar@ ena vor arrayi mej nshanakenq PIVOT(orinak arrayi verjin element@) u array@ nenc sortavorenq vor PIVOT ic dzax        @nkac elementner@ linen PIVOT ic poqr isk PIVOT ic aj @nkac elementner@ linen PIVOT ic mec.
//STEP 2. Recursiya-i mejocov PIVOT-ic dzax u aj @nkac arrayneri hamar enqan enq QUICK SORT anum(aysinqn amen meki hamar quick sort enq  kanchum) minchev irenq sortavorven
/*
 TIME COMPLEXITY of  QUICK SORT
 Best    - O(n log(n))
 Average - O(n log(n))
 Worst   - O(n^2)
 
 */

func quickSort(arr: [Int]) -> [Int] {
    
    guard arr.count > 1 else {return arr}                                   //[7, 3, 1, 8, 5, 4, 2, 6]
    
    var lower   = [Int]()
    var equal   = [Int]()
    var greater = [Int]()
    
    for x in arr {
        let pivot = arr[0]
        
        if x < pivot {
            lower.append(x)
        }
        if x == pivot {
            equal.append(x)
        }
        if x > pivot {
            greater.append(x)
        }
    }
    return quickSort(arr: lower) + equal + quickSort(arr: greater)
}

//MARK: - Bucket Sort
/*
 Step 1. Sarqel bucketner ev elementner@ qcel et bucketneri mej
 Step 2. Amen bucket i hamar kirarel InsertionSort vorpeszi sax bucketner@ sortavorven
 Step 3. Merge anel et sortavorvac bucketner@ irar het
 ----------------------------------------------------------
 Elementner@ bucketnerum lcvum en hetevyal orinachaputyamb:
 
 bucketNumber = (elementValue / totalNumberOfBuckets) + 1
 Orinak
 bucket 1: from 0 to 9
 bucket 2: from 10 to 19
 bucket 3: from 20 to 29
 and so on.
 ----------------------------------------------------------
 TIME COMPLEXITY of  BUCKET SORT
 Best    - Omega(n + k)
 Worst   - O(n^2)                                                                                                     Time Complexity
 Average - Theta(n + k)
 n = number of elements
 k = number of buckets
 */


// [8,3,5,6,4]

var xxx = [6,2,1,8,4,9,5,3,7]

//MARK: - SHUFFLE
//arrayi elementner@ karan XARNENQ -ays funkciayov                 --------                             array.shuffle() kam array.shuffled()

extension Array {
    mutating func shufflee() {
        if count < 2 { return }
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count-i))) + i
            swapAt(i, j)
        }
    }
}

xxx.shufflee()


class Player {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func play() {}
}

class Batsman: Player {
    override func play() {
        bat()
    }
    
    private func bat() {
        print("\(name) is batting 🏏")
    }
}


class Bowler: Player {
    override func play() {
        bowl()
    }
    
    func bowl() {
        print("\(name) is bowling 🏏")
    }
}

class CricketTeam {
    let name: String
    let team: [Player]
    
    init(team: [Player], name: String) {
        self.team = team
        self.name = name
        }
    
    func play() {
        team.forEach { $0.play() }
    }
}

let rohitSharma = Batsman(name: "Rohit Sharma")
let bumrah      = Bowler(name: "Jasprit Bumrah")

let indianTeam  = CricketTeam(team: [rohitSharma, bumrah], name: "India")

indianTeam.play()

