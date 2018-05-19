let testCases: Int? = Int(readLine()!)

var myString: String?, finalString: String = String()

var frequencies: [Int]

var greater: Int

for _ in 0..<testCases! {
    
    myString = readLine()
    
    greater = 0
    
    frequencies = [Int](repeating: 0, count: 26)
    
    for character in (myString?.unicodeScalars)! {
        
        switch character {
            
            case "a"..."z":
                frequencies[Int(character.value - (UnicodeScalar("a")?.value)!)] += 1
            
            case "A"..."Z":
                frequencies[Int(character.value - (UnicodeScalar("A")?.value)!)] += 1
            
            default:
                break
            
        }
        
    }
    
    for i in 0..<frequencies.count {
        
        if frequencies[i] > greater {
            
            greater = frequencies[i]
            
            finalString = String(Character(UnicodeScalar(i + Int(UnicodeScalar("a").value))!))
            
            
        } else if frequencies[i] == greater {
            
            finalString += [Character(UnicodeScalar(i + Int(UnicodeScalar("a").value))!)]

            
        }
        
    }
    
    print(finalString)
    
}