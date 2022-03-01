//
//  ShowsSeasonsCarrousel.swift
//  CiceTmdbApp
//
//  Created by CICE on 01/03/2022.
//

import SwiftUI

struct ShowsSeasonsCarrousel: View {
    
    let model: [Season]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 12, content: {
                    ForEach(self.model) { item in
                        ShowSeasonCell(model: item)
                    }
                })
            })
        })

    }
    
}

struct ShowSeasonCell: View {
    
    let model: Season
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: Season){
        self.model = model
        self.imageLoaderVM.loadImage(whit: self.model.posterPathUrl)
    }
    
    var body: some View{
        VStack{
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                Text(self.model.name ?? "")
                    .font(.headline)
                
                
            }else{
                Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]), startPoint: .bottom, endPoint: .top))
                    .clipShape(Circle())
            }
        }
    }
    
}

struct ShowsSeasonsCarrousel_Previews: PreviewProvider {
    static var previews: some View {
        ShowsSeasonsCarrousel(model: [Season(airDate: "", episodeCount: 1, id: 1, name: "", overview: "", posterPath: "", seasonNumber: 1)])
    }
}
