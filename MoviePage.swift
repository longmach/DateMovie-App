//
//  MoviePage.swift
//  dateNight
//
//  Created by MAC on 2021-10-27.
//

import SwiftUI
import WebKit

struct MoviePage: View {
    let url = URL (string: "https://www.youtube.com/watch?v=yDJIcYE32NU")!
    var body: some View {
            VStack{
                Spacer()
                    .frame(height: 50)
                Text("The Notebook")
                    .font(.title)
                Text("Rating: 7.8       Duration: 2h 3min")
                Text("Available at: Netflix, Amazon Prime")
                Image("1")
                    .resizable()
                    .frame(width: 300.0, height: 300.0, alignment: .center)
                Text("A poor yet passionate young man falls in love with a rich young woman, giving her a sense of freedom, but they are soon separated because of their social differences.")
                    .frame(width: 350)
                
                ViewVideo(videoID: "yDJIcYE32NU")
                    .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
            }
            .ignoresSafeArea()
    }
}

struct MoviePage_Previews: PreviewProvider {
    static var previews: some View {
        MoviePage()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
    }
}

struct ViewVideo: UIViewRepresentable{
    let videoID: String
    
    func makeUIView (context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = true
        uiView.load(URLRequest(url: youtubeURL))
    }
}
