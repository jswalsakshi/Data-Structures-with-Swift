  let beverages = TreeNode("Beverages")
  
  let hot = TreeNode("Hot")
  let cold = TreeNode("Cold")
  
  let tea = TreeNode("Tea")
  let coffee = TreeNode("Coffee")
  
  
  beverages.add(hot)
  beverages.add(cold)
  hot.add(tea)
  hot.add(coffee)

  beverages.forEachDepthFirst {
    print($0.value)
  }
  
  beverages.forEachLevelOrder { print($0.value) }
  
  if let searchResult = beverages.search("hot") {
    print(searchResult)
  }
