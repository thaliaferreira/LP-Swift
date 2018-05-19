import Foundation

func imprimeMatriz(matriz : Array<Array<Int>>, ordem:Int) {
	print("\n")
	for i in 0...(ordem-1){
    	for j in 0...(ordem-1){
    	    print("["+String(matriz[i][j])+"]", terminator:"")
    	}
    	print("\n")
	}
}

print("Ordem da Matriz");
let n : Int = Int(readLine()!)!
var ordem : Int = n
print("Posicoes a Percorrer")
var b : Int = Int(readLine()!)!
print("\n")

var matriz = Array<Array<Int>>()

for _ in 0...ordem{
    var novaColuna = Array<Int>()
    for _ in 0...ordem{
        novaColuna.append(0)
    }
    matriz.append(novaColuna)
}

//spiral
var i : Int=0
var j : Int = 0
var count : Int=0
var aux : Int=0

if ((b <= 0) || (b > (n*n))) {
	print("b não existe na ordem \(n)")
	count=b	
}

while (count < b){
	for j2 in j...(ordem-1){
		j=j2
		count=count+1
		matriz[i][j]=1
		
		if (count == b){
			print("linha:\(i) e coluna:\(j)")
			imprimeMatriz(matriz:matriz ,ordem:n )
			exit(0)
		}
		if(j==ordem-1) {
			i=i+1
			for i2 in i...(ordem-1){
				i=i2
				count=count+1
				matriz[i][j]=1
				if (count == b){
					print("linha:\(i) e coluna:\(j)")
					imprimeMatriz(matriz:matriz ,ordem:n)
					exit(0)
				}
				
			}
			
				
			for j2 in (aux..<j).reversed() {
				j=j2
				count=count+1
				matriz[i][j]=1
				if (count == b){
					print("linha:\(i) e coluna:\(j)")
					imprimeMatriz(matriz:matriz ,ordem:n )
					exit(0)
				}
			}	
			aux=aux+1
				
			for i2 in (aux..<i).reversed(){
				i=i2
				count=count+1
				matriz[i][j]=1
				if (count == b){
					print("linha:\(i) e coluna:\(j)")
					imprimeMatriz(matriz:matriz ,ordem:n )
					exit(0)
				}
			}
							
			j=aux
			i=aux
			ordem=ordem-1
				

		}	
			

	}
		

}



