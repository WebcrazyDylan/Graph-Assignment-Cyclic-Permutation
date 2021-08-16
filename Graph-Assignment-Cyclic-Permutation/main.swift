//
//  main.swift
//  Graph-Assignment-Cyclic-Permutation
//
//  Created by Dylan Park on 2021-08-15.
//

import Foundation

func dfs(start: Int, nodes: inout [Int], visited: inout [Bool]) {
  if visited[start] {
    return
  }
  visited[start] = true
  dfs(start: nodes[start], nodes: &nodes, visited: &visited)
}

var tests = Int(readLine()!)!
while tests > 0 {
  let n = Int(readLine()!)!
  var nodes = readLine()!.split(separator: " ").map { Int($0)! }
  nodes.insert(0, at: 0)

  var visited = [Bool](repeating: false, count: n + 1)
  var count = 0
  for v in 1...n {
    if !visited[v] {
      dfs(start: v, nodes: &nodes, visited: &visited)
      count += 1
    }
  }
  print(count)
  tests -= 1
}

