//
//  spiral.swift
//  
//
//  Created by Victor Jean on 06/05/2018.
//

import Foundation

let TAM = 9
let INFINITO = 999999999

struct Aresta {
    var origem : Int?
    var destino : Int?
    var peso : Int?
}

var arestas = Array<Aresta>()
for _ in 0..<350{
    arestas.append(Aresta())
}

func modulo(_ s: String) -> Int? {
    switch s {
    case "0":
        return 48
    case "1":
        return 49
    case "2":
        return 50
    case "3":
        return 51
    case "4":
        return 52
    case "5":
        return 53
    case "6":
        return 54
    case "7":
        return 55
    case "8":
        return 56
    case "a":
        return 97
    case "b":
        return 98
    case "c":
        return 99
    case "d":
        return 100
    case "e":
        return 101
    case "f":
        return 102
    case "g":
        return 103
    default: //h
        return 104
    }
}

func BellmanFord(n_arestas: Int, n_nodos: Int, origem: Int, destino: Int) -> Int{
    var trocou = 1
    var distancia = Array<Int>()
    
    for _ in 0...n_nodos {
        distancia.append(INFINITO)
    }
    
    distancia[origem] = 0
    
    for _ in 0...n_nodos {
        if(trocou == 1){
            trocou = 0
            for j in 0..<n_arestas {
                if(distancia[arestas[j].destino!] > distancia[arestas[j].origem!] + arestas[j].peso!){
                    distancia[arestas[j].destino!] = distancia[arestas[j].origem!] + arestas[j].peso!
                    trocou = 1
                }
            }
        }
    }
    return distancia[destino]
}

var tabuleiro = Array<Array<Int>>()

var cont : Int = 1

for i in 0..<TAM{
    var novaColuna = Array<Int>()
    for j in 0..<TAM{
        if(i == 0 || j == 0){
            novaColuna.append(0)
        } else {
            novaColuna.append(cont)
            cont = cont+1
        }
    }
    tabuleiro.append(novaColuna)
}

cont = 0;
for i in 1..<TAM{
    for j in 1..<TAM{
        if((i+1) < TAM && (j+2) < TAM){
            arestas[cont].origem = tabuleiro[i][j]
            arestas[cont].destino = tabuleiro[i+1][j+2]
            arestas[cont].peso = 1
            cont = cont+1
        }
        if((i+1) < TAM && (j-2) >= 1){
            arestas[cont].origem = tabuleiro[i][j]
            arestas[cont].destino = tabuleiro[i+1][j-2]
            arestas[cont].peso = 1
            cont = cont+1
        }
        if((i+2) < TAM && (j+1) < TAM) {
            arestas[cont].origem = tabuleiro[i][j];
            arestas[cont].destino = tabuleiro[i+2][j+1];
            arestas[cont].peso = 1;
            cont = cont+1
        }
        if((i+2) < TAM && (j-1) >= 1) {
            arestas[cont].origem = tabuleiro[i][j];
            arestas[cont].destino = tabuleiro[i+2][j-1];
            arestas[cont].peso = 1;
            cont = cont+1
        }
        if((i-1) > 0 && (j+2) < TAM) {
            arestas[cont].origem = tabuleiro[i][j];
            arestas[cont].destino = tabuleiro[i-1][j+2];
            arestas[cont].peso = 1;
            cont = cont+1
        }
        if((i-1) > 0 && (j-2) >= 1) {
            arestas[cont].origem = tabuleiro[i][j];
            arestas[cont].destino = tabuleiro[i-1][j-2];
            arestas[cont].peso = 1;
            cont = cont+1
        }
        if((i-2) > 0 && (j+1) < TAM) {
            arestas[cont].origem = tabuleiro[i][j];
            arestas[cont].destino = tabuleiro[i-2][j+1];
            arestas[cont].peso = 1;
            cont = cont+1
        }
        if((i-2) > 0 && (j-1) >= 1) {
            arestas[cont].origem = tabuleiro[i][j];
            arestas[cont].destino = tabuleiro[i-2][j-1];
            arestas[cont].peso = 1;
            cont = cont+1
        }
    }
}

var origem : Int, destino : Int, palavra : String?, resultadoFuncao : Int, de : String, para : String

repeat {
    palavra = readLine()
    var result = palavra?.split(separator: " ")
    
    de = String(result![0])
    para = String(result![1])
    
    let de_index_0 = de.index(de.startIndex, offsetBy: 0)
    let de_index_1 = de.index(de.startIndex, offsetBy: 1)
    
    let para_index_0 = para.index(para.startIndex, offsetBy: 0)
    let para_index_1 = para.index(para.startIndex, offsetBy: 1)
    
    origem = (modulo(String(de[de_index_0]))! - modulo("a")!)*8 + modulo(String(de[de_index_1]))! - modulo("0")!
    destino = (modulo(String(para[para_index_0]))! - modulo("a")!)*8 + modulo(String(para[para_index_1]))! - modulo("0")!
    
    resultadoFuncao = BellmanFord(n_arestas: cont, n_nodos: 64, origem: origem, destino: destino)
    
    print("To get from \(de) to \(para) takes \(resultadoFuncao) knight moves.")
    
} while(de != para)


