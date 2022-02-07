//
//  ContentView.swift
//  Weather App
//
//  Created by Decagon on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Lagos, Nigeria")
                mainCityWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temparature: isNight ? 49 : 75)
                
               
                    HStack(spacing: 20){
                        WeatherDayView(dayOfTheWeek: "TUE", imageName: "cloud.sun.fill", tempreture: 74)
                        WeatherDayView(dayOfTheWeek: "WED", imageName: "sun.max.fill", tempreture: 70)
                        WeatherDayView(dayOfTheWeek: "THUR", imageName: "wind", tempreture: 66)
                        WeatherDayView(dayOfTheWeek: "FRI", imageName: "sunset.fill", tempreture: 60)
                        WeatherDayView(dayOfTheWeek: "SAT", imageName: "moon.stars.fill", tempreture: 55)
                       
                    }
                    
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButtonTextView(buttonText: "Change Day Time", textColor: .blue, backgroundColor: .white)
                        
                    
                    }
                }
                Spacer()
            }
        }
    }

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfTheWeek: String
    var imageName: String
    var tempreture: Int
    
    var body: some View {
        VStack {
            Text(dayOfTheWeek)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium, design: .default))
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(tempreture)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct mainCityWeatherStatusView: View {
    
    var imageName: String
    var temparature: Int
    
    var body: some View{
        VStack (spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            
            Text("\(temparature)º")
                .font(.system(size: 70, weight: .bold, design: .default))
                .foregroundColor(.white)

    }
        .padding(.bottom, 50)
}
}


