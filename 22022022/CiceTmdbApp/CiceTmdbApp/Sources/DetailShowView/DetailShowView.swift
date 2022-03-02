/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import SwiftUI

struct DetailShowView: View {

    @StateObject var viewModel = DetailShowViewModel()
    //var viewModel: DetailShowServerModel
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    @State private var selectedTrailer: ResultVideo?
    

    var body: some View {
        ScrollView{
            VStack{
                headerView
                bodyView
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
//        .sheet(item: self.$selectedTrailer) { (myTrailer) in
//            SafariView(url: myTrailer.youtubeURL!)
//        }
        .onAppear {
            self.viewModel.fetchData()
        }
    }
    
    var headerView: some View{
        ZStack(alignment: .topLeading, content: {
            if self.viewModel.data?.posterUrl != nil {
                MovieDetailImage(imageUrl: self.viewModel.data!.posterUrl)
            }
            
            HStack{
                Button(action: {
                    self.presenterMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                })
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                
                Spacer()
                
                Button(action: {
                    // Aqui salvaremos las peliculas como favoritas en una BBDD (1. Firebase | 2. UserDefault)
                }, label: {
                    Image(systemName: "bookmark")
                })
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 20))
            }
            .foregroundColor(Color.red)
        })
    }
    
    var bodyView: some View{
        VStack(alignment: .leading, spacing: 30, content: {
            HStack{
                Text(self.viewModel.data?.genreText ?? "")
                Text("·").fontWeight(.heavy)
                Text(self.viewModel.data?.yearText ?? "")
                Text("·").fontWeight(.heavy)
                
                if self.viewModel.data?.episodeRunTime != nil && !(self.viewModel.data?.episodeRunTime!.isEmpty ?? false){
                    Text("\(self.viewModel.data?.episodeRunTime![0] ?? 0)")
                }
                
            }
            
            Text(self.viewModel.data?.overview ?? "")
                .font(.title2)
            
            HStack{
                if !(self.viewModel.data?.ratingText.isEmpty ?? false) {
                    Text(self.viewModel.data?.ratingText ?? "")
                        .foregroundColor(.red)
                }
                Text(self.viewModel.data?.scoreText ?? "")
                Spacer()
            }
            Text("Starrings")
                .font(.title)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                if self.viewModel.data?.cast != nil && !(self.viewModel.data?.cast?.isEmpty ?? false){
                    MovieCastCarrouselView(model: self.viewModel.data?.cast ?? [])
                }
            })
            
            HStack(alignment: .top, spacing: 4, content: {
                if self.viewModel.data?.crew != nil && !(self.viewModel.data?.crew?.isEmpty ?? false) {
                    VStack(alignment: .leading, spacing: 4) {
                        if self.viewModel.data?.directors != nil && !(self.viewModel.data?.directors?.isEmpty ?? false){
                            Text("Directors")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.data?.directors?.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                        
                        if self.viewModel.data?.producers != nil && !(self.viewModel.data?.producers?.isEmpty ?? false){
                            Text("Producer[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.data?.producers?.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                        
                        if self.viewModel.data?.screenWriters != nil && !(self.viewModel.data?.screenWriters?.isEmpty ?? false){
                            Text("Writer[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.data?.screenWriters?.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            })
            
            if self.viewModel.data?.numberOfSeasons != nil && self.viewModel.data?.numberOfSeasons ?? 0 > 0 {
                Text("Seasons")
                    .font(.title)
                    .fontWeight(.bold)
                
//                Text("Number of seasons: \(self.viewModel.numberOfSeasons ?? 0)")
//                    .font(.callout)
//                    .fontWeight(.bold)
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    ShowsSeasonsCarrousel(model: self.viewModel.data?.seasons ?? [])
                })
            }
            
            if self.viewModel.data?.similar?.results != nil && !(self.viewModel.data?.similar?.results?.isEmpty ?? false){
                Text("Similar shows")
                    .font(.title)
                    .fontWeight(.bold)
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    MoviesTVSimilarCarrouselView(model: self.viewModel.data?.similar?.results ?? [])
                })
            }
            
            if self.viewModel.data?.youtubeTrailers != nil && !(self.viewModel.data?.youtubeTrailers?.isEmpty ?? false){
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("Trailers")
                        .font(.title)
                        .fontWeight(.bold)
                    ForEach((self.viewModel.data?.youtubeTrailers)!){ item in
                        Button(action: {
                            self.selectedTrailer = item
                        }, label: {
                            HStack{
                                Text(item.name ?? "")
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.red)
                            }
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                })
            }
            
            
            
            
        })
    }
}

struct DetailShowView_Previews: PreviewProvider {
    static var previews: some View {
        if let dataUnw = DetailShowServerModel.stubbedDetailShow{
            DetailShowView()
        }
    }
}

