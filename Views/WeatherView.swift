import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(spacing: -15){
                VStack(alignment: .leading, spacing: 10) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime .month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                    Text("The temperature is").padding(.top).font(.headline)
                        .frame(maxWidth: 330, alignment: .center)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack {
                        VStack(spacing: 10){
                            if weather.weather[0].main == "Drizzle" {
                                Image(systemName: "cloud.drizzle.fill").font(.system(size: 40))
                            } else {
                                Image(systemName: "sun.max").font(.system(size: 40))}
                            Text(weather.weather[0].main)
                        
                        }
                        .frame(width: 80 , alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°").font(.system(size: 100)).fontWeight(.bold).padding()
                        
                    }
                    Spacer()
                        .frame(height: 20)
                    
                    AsyncImage(url: URL(string: "https://plus.unsplash.com/premium_vector-1726060273712-1f98b2ebdaff?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fG5pZ2h0JTIwY2l0eSUyMHNjYXBlfGVufDB8fDB8fHww")) { image in image
                        .resizable().aspectRatio(contentMode: .fit).frame(width:350).cornerRadius(20)} placeholder: {
                            ProgressView()
                        }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("The Weather Now is: ")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.low", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity.fill", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom, 20).foregroundColor(Color(hue: 0.765, saturation: 0.496, brightness: 0.782))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.765, saturation: 0.496, brightness: 0.782))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View{
        WeatherView(weather: previewWeather)
    }
}
