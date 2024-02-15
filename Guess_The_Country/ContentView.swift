//
//  ContentView.swift
//  Guess_The_Country
//
//  Created by inCHESS on 15.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Afghanistan", "Aland islands", "Albania", "Algeria", "American samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Biot", "Bolivia", "Bonaire", "Bosnian", "Botswana", "Bouvet", "Brazil", "British antarctic territory", "British virgin islands", "Brunei", "Bulgaria", "Burkina faso", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape verde", "Cascadia", "Cayman islands", "Centralafricanrepublic", "Chad", "Chile", "China", "Christmas island", "Cocos islands", "Colombia", "Comoros", "Congo 1", "Congo", "Cook slands", "Costa rica", "Croatian", "Cuba", "Curacao", "Cyprus", "Czech republic", "Denmark", "Djibouti", "Dominica", "Dominican republic", "East timor", "Ecuador", "Egypt", "El salvador", "England", "Equatorial guinea", "Eritrea", "Estonia", "Ethiopia", "European union", "Ex yugoslavia", "Falkland islands", "Faroe islands", "Fiji", "Finland", "France", "French polynesia", "French southern territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea bissau", "Guinea", "Guyana", "Haiti", "Holy see", "Honduras", "Hong kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle of man", "Israel", "Italy", "Ivory coast", "Jamaica", "Jan mayen", "Japan", "Jarvis island", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands antilles", "Netherlands", "New caledonia", "New zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk island", "North korea", "Northern ireland", "Northern mariana islands", "Norway", "Oman", "Pakistan", "Palau", "Palestinian territory", "Panama", "Papua new guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto rico", "Qatar", "Reunion", "Romania", "Russia", "Rwanda", "Saint barthelemy", "Saint helena and dependencies", "Saint helena", "Saint kitts and nevis", "Saint lucia", "Saint martin", "Saint pierre and miquelon", "Samoa", "San marino", "Sao tome and principe", "Saudi arabia", "Scotland", "Senegal", "Serbia", "Seychelles", "Sierra leone", "Singapore", "Sint eustatius", "Sint Maarten", "Slovakia", "Slovenia", "Smom", "Solomon islands", "Somalia", "South africa", "South georgia", "South sudan", "Spain", "Spm", "Sri lanka", "Sudan", "Suriname", "Svalbard", "Svg", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor leste", "Togo", "Tokelau", "Tonga", "Trinidad and tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and caicos islands", "Tuvalu", "Uganda", "Ukraine", "United arab emirates", "United kingdom", "United states", "Uruguay", "Ussr", "Uzbekistan", "Vanuatu", "Vatican", "Venezuela", "Vietnam", "Virgin islands", "Wales", "Wallis and futuna", "Western sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 15) {
                VStack {
                    Spacer(minLength: 20)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        self.showingScore = true
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .frame(width: 900, height: 200)
                            //.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(color: .black, radius: 2)
                        
                    }
                }
                Text ("Общий счет: \(score)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                Spacer()
            }
        } .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message:
                    Text("Общий счет: \(score)"), dismissButton: .default(Text("Продолжить")) {
                self.askQuestion()
            })
        }
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Правильный ответ !"
            score += 1
        } else {
            scoreTitle = "Неправильный ответ ! Это флаг \(countries[number])"
            score -= 1
        }
    }
}

#Preview {
    ContentView()
}
