//
//  MoviesPosterCarrousel.swift
//  CiceTmdbApp
//
//  Created by CICE on 23/02/2022.
//

import SwiftUI

struct MoviesPosterCarrousel: View {
    
    var title: String
    var moviesModel: [MoviesTVModelView]
    var isPoster: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            HStack{
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 50, height: 5)
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 20, content: {
                    ForEach(self.moviesModel){ movie in
                        MoviePosterCell(model: movie, isPoster: self.isPoster)
                    }
                })
            }
            
            
        })
        .padding(.bottom, 20)
        
        
    }
}

struct MoviePosterCell: View {
    
    @ObservedObject var imageLoaderVM = ImageLoader()
    private var modelData: MoviesTVModelView
    var isPoster: Bool
    
    init(model: MoviesTVModelView, isPoster: Bool? = true){
        self.modelData = model
        self.isPoster = isPoster ?? false
        if isPoster ?? false{
            self.imageLoaderVM.loadImage(whit: model.posterUrl)
        }else{
            self.imageLoaderVM.loadImage(whit: model.backdropUrl)
        }
        
    }
    
    var body: some View{
        VStack{
            ZStack {
                if self.imageLoaderVM.image != nil{
                    Image(uiImage: self.imageLoaderVM.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .shadow(radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.red, lineWidth: 1)
                        )
                } else{
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                        .cornerRadius(8)
                }
            }
            .frame(width: self.isPoster ? 240 : 270, height: self.isPoster ? 306 : 150)
            
            if !self.isPoster{
                Text(self.modelData.name ?? "")
                    .fontWeight(.semibold)
                    .padding(.top, 15)
                    .lineLimit(1)
            }
            
            
        }
    }
}

/*
struct MoviesPosterCarrousel_Previews: PreviewProvider {
    static var previews: some View {
        MoviesPosterCarrousel(title: "Now playing",
                              moviesModel: MoviesServerModel.stubbedMoviesNowPlaying, isPoster: true)
    }
}
 */
