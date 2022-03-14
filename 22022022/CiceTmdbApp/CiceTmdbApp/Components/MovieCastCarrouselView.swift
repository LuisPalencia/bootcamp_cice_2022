//
//  MovieCastCarrouselView.swift
//  CiceTmdbApp
//
//  Created by CICE on 28/02/2022.
//

import SwiftUI

struct MovieCastCarrouselView: View {
    
    let model: [Cast]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 12, content: {
                    ForEach(self.model) { item in
                        NavigationLink(
                            destination: DetailPersonCoordinator.view(dto: DetailPersonCoordinatorDTO(dataId: item.id ?? 0)),
                            label: {
                                MovieCastCell(model: item)
                            })
                            .buttonStyle(PlainButtonStyle())
                        
                    }
                })
            })
        })
    }
}

struct MovieCastCell: View {
    
    let model: Cast
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: Cast){
        self.model = model
        self.imageLoaderVM.loadImage(whit: self.model.profilePathUrl)
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

struct MovieCastCarrouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCastCarrouselView(model: [Cast(adult: false,
                                            gender: 2,
                                            id: 1136406,
                                            knownForDepartment: "Acting",
                                            name: "Tom Holland",
                                            originalName: "Tom Holland",
                                            popularity: 109.485,
                                            profilePath: "/2qhIDp44cAqP2clOgt2afQI07X8.jpg",
                                            castID: 54,
                                            character: "Peter Parker / Spider-Man",
                                            creditID: "5d8e28d38289a0000fcc32f9",
                                            order: 0),
                                       Cast(adult: false,
                                            gender: 2,
                                            id: 1136406,
                                            knownForDepartment: "Acting",
                                            name: "Tom Holland",
                                            originalName: "Tom Holland",
                                            popularity: 109.485,
                                            profilePath: "/2qhIDp44cAqP2clOgt2afQI07X8.jpg",
                                            castID: 54,
                                            character: "Peter Parker / Spider-Man",
                                            creditID: "5d8e28d38289a0000fcc32f9",
                                            order: 0)
        ])
    }
}
