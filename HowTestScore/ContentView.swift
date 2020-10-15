import SwiftUI

struct ContentView: View {
    @State private var score: Int = Int(arc4random_uniform(101))
    @State private var counter: Int = 1
    @State private var input: String = ""
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            Text("僕のテストは何点だったでしょう？")
            TextField("0〜100を入力", text: $input)
                .padding()
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .padding()
            Button(action: {
                self.checkScore(inputScore: self.input)
            }) {
                Text("Check!!")
            }
                .padding()
            Text(message)
                .padding()
            Button(action: {
                self.initScore()
            }) {
                Text("もう一度やり直す")
            }
                .padding()
        }
    }
    
    func checkScore(inputScore: String) {
        if inputScore == "" {
            message = "何も入力されていません！"
            return
        } else {
            if let inputScoreInt = Int(inputScore) {
                if inputScoreInt > 100 {
                    message = "100以下の値を入力してください"
                } else if inputScoreInt < 0 {
                    message = "0以上の値を入力してください"
                } else if inputScoreInt == score {
                    message = "正解！\(counter)回目で当たりました！"
                } else if inputScoreInt > score {
                    message = "惜しい！もっと低かった"
                    counter += 1
                } else if inputScoreInt < score {
                    message = "惜しい！もっと高かった"
                    counter += 1
                }
            } else {
                message = "0から100の整数を入力してください"
            }
            
        }
    }
    
    func initScore() {
        self.score = Int(arc4random_uniform(101))
        self.counter = 1
        self.message = ""
        self.input = ""
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
