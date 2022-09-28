
import SwiftUI

enum ButtonType:String {
    case first, second, third, forth, fifth, sixth, seventh, eighth, nineth, zero
    case Dot, equal, plus, minus, multiple, devide
    case percent, opposite, clear
    
    var ButtonDisplayNm: String {
        switch self {
        case .first:
            return "1"
        case .second:
            return "2"
        case .third:
            return "3"
        case .forth:
            return "4"
        case .fifth:
            return "5"
        case .sixth:
            return "6"
        case .seventh:
            return "7"
        case .eighth:
            return "8"
        case .nineth:
            return "9"
        case .zero:
            return "0"
        case .Dot:
            return "."
        case .equal:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiple:
            return "X"
        case .devide:
            return "$"
        case .percent:
            return "%"
        case .opposite:
            return "/"
        case .clear:
            return "C"
        
        }
    }
    
//    백그라운드 컬러 만들기 ( 위에 숫자 처럼 만들어보자)
    var BackGroundColor: Color {
        switch self {
        case .first, .second,.third,.forth,.fifth,.sixth,.seventh,.eighth,.nineth,.zero, .Dot :
            return Color("NumeberButton")
        case .devide,.multiple,.minus,.plus,.equal:
            return .orange
        default:
            return .gray
        }
    }
    //   포어그라운드 컬러 만들기 ( 위에 숫자 처럼 만들어보자)
    var ForegroundColor: Color {
        switch self {
        case .first, .second,.third,.forth,.fifth,.sixth,.seventh,.eighth,.nineth,.zero, .Dot,.devide,.multiple,.minus,.plus,.equal:
            return .white
        case .clear, .opposite,.percent:
            return .black
        }
    }
}



struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    
    private let buttonData: [[ButtonType]] = [
        [ .clear, .opposite, .percent, .devide ],
        [ .seventh, .eighth, .nineth, .multiple ],
        [ .forth, .fifth, .sixth, .minus ],
        [ .first, .second, .third, .plus],
        [ .zero, .zero, .Dot, .equal ]
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
//                    companyPriceLable.text = "\(convertToCurrencyFormat(price:stock.price))원"
                    Text(totalNumber).padding().font(.system(size: 60)).foregroundColor(.white)
                }
                

                ForEach(buttonData, id:\.self) {
                    line in
                    HStack {
                        ForEach(line, id: \.self) {
                            item in
                            
                             Button {
                                 
                                 if item.ButtonDisplayNm == "C" {
                                        totalNumber = "0"
                                } else if totalNumber == "0" {
                                    totalNumber = item.ButtonDisplayNm
                                }  else {
                                    totalNumber += item.ButtonDisplayNm
                                }
                            } label: {
                                Text(item.ButtonDisplayNm).frame(width: 80, height: 80).background(item.BackGroundColor).cornerRadius(40).foregroundColor(item.ForegroundColor).font(.system(size: 33))
                            }
                        }
                    }
                }


            } // Vstack 끝
        } // Zstack 끝
    } // body 끝
} // Struct ConView 끝

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 세마디 콤바 넣는 활용법
func convertToCurrencyFormat(price: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 0
    let result = numberFormatter.string(from: NSNumber(value: price))!
//        let result = numberFormatter.string(from: NSNumber(value: price)) ?? "" --> 강제 언네핑 말고 이게 nill 값이면 빈 "" 리턴 해줘라 실무에서는 이 방법이 더 안전하여 많이 사용함
    return result
}

// ################# 최초 생성한 방법 ####################

//                    HStack {
//                        Button { //버튼 1 시작
//                            totalNumber = "0"
//                        } label: {
//                            Text("AC").frame(width: 80, height: 80).background(.gray).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        }
//                        Text("%").frame(width: 80, height: 80).background(.gray).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("/").frame(width: 80, height: 80).background(.gray).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("$").frame(width: 80, height: 80).background(.orange).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                    }
                
//                    HStack {
//                        Button {
//                            if totalNumber == "0" {
//                                totalNumber = "7"
//                            }  else {
//                                totalNumber += "7"
//                            }
//                        } label: {
//                            Text("7").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        }
//
//                        Text("8").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("9").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("X").frame(width: 80, height: 80).background(.orange).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                    }
                
                
//                Button { //버튼 3 시작
//
//                } label: {
//                    HStack {
//                        Text("4").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("5").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("6").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("-").frame(width: 80, height: 80).background(.orange).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                    }
//                } //버튼 3 끝
//
//                Button { //버튼 4 시작
//
//                } label: {
//                    HStack {
//                        Text("1").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("2").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("3").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("+").frame(width: 80, height: 80).background(.orange).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                    }
//                } //버튼 4 끝
//
//                Button { //버튼 5 시작
//
//                } label: {
//                    HStack {
//                        Text("0").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("0").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text(".").frame(width: 80, height: 80).background(Color("NumeberButton")).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                        Text("=").frame(width: 80, height: 80).background(.orange).cornerRadius(40).foregroundColor(.white).font(.system(size: 33))
//                    }
//                } //버튼 5 시작
