//
//  main.swift
//  Graph-Assignment-Cyclic-Permutation
//
//  Created by Dylan Park on 2021-08-15.
//

import Foundation

// Cyclic Permutation
func cyclicPermutation() {
    print("Please input for Cyclic Permutation")
    let preNumberOfCases = readLine()!.split(separator: " ").map { Int($0) }
    let numberOfCases = preNumberOfCases[0]!

    
    for _ in 0..<numberOfCases {
        let preN = readLine()!.split(separator: " ").map { Int($0) }
        let N = preN[0]!
        let permutation = readLine()!.split(separator: " ").map { Int($0) }
        var alreadyPassed: Set = [1]
        var numOfCycles = 0
        for i in 1...N {
            // if the integer is already passed
            if alreadyPassed.contains(i) {
                continue
            }
            // if the integer has a roop
            if permutation[i - 1] == i {
                numOfCycles += 1
                continue
            }
            // search for a cycle
            var foundCycle: Bool = false
            var next = permutation[i - 1]!
            while (foundCycle == false) {
                alreadyPassed.insert(next)
                next = permutation[next - 1]!
                if alreadyPassed.contains(next) {
                    numOfCycles += 1
                    foundCycle = true
                }
            }
        }
        
        print(numOfCycles)
    }
}


cyclicPermutation()

/*
 Sample Input 1
 2
 8
 3 2 7 8 1 4 5 6
 10
 2 1 3 4 5 6 7 9 10 8
 
 Sample Output 1
3
7
 */
