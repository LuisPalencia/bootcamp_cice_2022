//
//  MoviesTVSimilarCarrouselView.swift
//  CiceTmdbApp
//
//  Created by CICE on 01/03/2022.
//

import SwiftUI

struct MoviesTVSimilarCarrouselView: View {
    
    let model: [SimilarResult]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 12, content: {
                    ForEach(self.model) { item in
                        MovieTVSimilarCell(model: item)
                    }
                })
            })
        })

    }
}

struct MovieTVSimilarCell: View {
    
    let model: SimilarResult
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: SimilarResult){
        self.model = model
        self.imageLoaderVM.loadImage(whit: self.model.posterPathUrl)
    }
    
    var body: some View{
        HStack{
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(self.model.name ?? "")
                        .font(.headline)
                })
            }else{
                Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]), startPoint: .bottom, endPoint: .top))
                    .clipShape(Circle())
            }
        }
    }
    
}

struct MoviesTVSimilarCarrouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesTVSimilarCarrouselView(model: [SimilarResult(adult: false,
                                                    backdropPath: "",
                                                    genreIDS: [0,1],
                                                    id: 1,
                                                    name: "",
                                                    originCountry: ["",""],
                                                    originalLanguage: "",
                                                    originalName: "",
                                                    overview: "",
                                                    popularity: 0.0,
                                                    posterPath: "",
                                                    firstAirDate: "",
                                                    voteAverage: 0.0,
                                                    voteCount: 0)])
    }
}
