let a1: Float? = Float(readLine()!)
let a2: Float? = Float(readLine()!)
let a3: Float? = Float(readLine()!)
let a4: Float? = Float(readLine()!)
var media: Float

func calcMedia(a1: Float, a2:Float, a3:Float, a4:Float) -> Float{
  var av: Float
  av = (2*a1+3*a2+4*a3+a4)/4
  return av
}

media = calcMedia(a1: a1!, a2: a2!, a3: a3!, a4: a4!)

if(media >= 7.0){
  print("Aluno aprovado")
}
else if(media <= 5.0){
  print("Aluno reprovado")
}
else{
  print("Aluno em exame")
}