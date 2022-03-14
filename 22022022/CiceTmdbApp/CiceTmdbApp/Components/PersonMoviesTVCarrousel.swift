//
//  MoviesTVSimpleCarrousel.swift
//  CiceTmdbApp
//
//  Created by CICE on 11/03/2022.
//

import SwiftUI

struct PersonMoviesTVCarrousel: View {
    
    var title: String
    var dataModelMovies: [MovieCreditsCast]?
    var dataModelTVShows: [TvCreditsCast]?
    var isMovie: Bool
    
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
                    if isMovie {
                        if let dataUnw = self.dataModelMovies {
                            ForEach(dataUnw){ movie in
                                NavigationLink(
                                    destination: self.setContentView(isMovie: true, id: movie.id ?? 0),
                                    label: {
                                        MovieTVSimpleCell(name: movie.title ?? "", image: movie.posterUrl)
                                    })
                                    .buttonStyle(PlainButtonStyle())
                            }
                        }else{
                            Text("There are no movies for this person")
                        }
                    }else {
                        if let dataUnw = self.dataModelTVShows {
                            ForEach(dataUnw){ show in
                                NavigationLink(
                                    destination: self.setContentView(isMovie: false, id: show.id ?? 0),
                                    label: {
                                        MovieTVSimpleCell(name: show.name ?? "", image: show.posterUrl)
                                    })
                                    .buttonStyle(PlainButtonStyle())
                            }
                        }else{
                            Text("There are no TV Shows for this person")
                        }
                    }
                    
                })
            }
        })
        //.padding(.bottom, 20)
        
        
    }
    
    @ViewBuilder
    func setContentView(isMovie: Bool, id: Int) -> some View {
        if isMovie{
            DetailMovieCoordinator.view(dto: DetailMovieCoordinatorDTO(dataId: id))
        }else{
            DetailShowCoordinator.view(dto: DetailShowCoordinatorDTO(dataId: id))
        }
    }
}

struct MovieTVSimpleCell: View {
    
    @ObservedObject var imageLoaderVM = ImageLoader()
    private var name: String?
    private var image: URL
    
    init(name: String, image: URL){
        self.name = name
        self.image = image
        self.imageLoaderVM.loadImage(whit: image)
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
                        .loader(state: .ok)
                } else{
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                        .cornerRadius(8)
                        .loader(state: .loading)
                }
            }
            .frame(width: 240, height: 306)
            
            Text(self.name ?? "")
                .fontWeight(.semibold)
                .padding(.top, 15)
                .lineLimit(1)
        }
    }
}
/*
struct MoviesTVSimpleCarrousel_Previews: PreviewProvider {
    static var previews: some View {
        PersonMoviesTVCarrousel(title: "", dataModel: DetailPersonServerModel(), isMovie: false)
    }
}
 */
