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

struct DetailPersonView: View {

    @StateObject var viewModel = DetailPersonViewModel()
    @SwiftUI.Environment(\.presentationMode) var presenterMode

    var body: some View {
        ScrollView{
            VStack{
                headerView
                bodyView
            }
        }
        .padding(.horizontal, 8)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.viewModel.fetchData()
        }
        
    }
    
    var headerView: some View{
        ZStack(alignment: .topLeading, content: {
            if self.viewModel.data?.profileUrl != nil {
                MovieDetailImage(imageUrl: self.viewModel.data!.profileUrl)
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
            }
            .foregroundColor(Color.red)

        })
    }
    
    var bodyView: some View{
        VStack(alignment: .leading, spacing: 30, content: {
            Text(self.viewModel.data?.name ?? "")
                .font(.title)
                .fontWeight(.bold)
            Text("Cumpleaños: \(self.viewModel.data?.birthday ?? ""))")
                .font(.title3)
            
            Text("Lugar de nacimiento: \(self.viewModel.data?.placeOfBirth ?? ""))")
                .font(.title3)
            
            Text("Biografía")
                .font(.title2)
                .fontWeight(.bold)
            
            Text(self.viewModel.data?.biography ?? "")
                .font(.title)
            

            
            if self.viewModel.data?.movieCredits?.cast != nil && !(self.viewModel.data?.movieCredits?.cast?.isEmpty ?? false){
                PersonMoviesTVCarrousel(title: "Movies", dataModelMovies: self.viewModel.data?.movieCredits?.cast ?? [], dataModelTVShows: nil, isMovie: true)
            }
            
            
            if self.viewModel.data?.tvCredits?.cast != nil && !(self.viewModel.data?.tvCredits?.cast?.isEmpty ?? false){
                PersonMoviesTVCarrousel(title: "TV Shows", dataModelMovies: nil, dataModelTVShows: self.viewModel.data?.tvCredits?.cast ?? [], isMovie: false)
            }
 
 
 
        })
        .padding()
        .padding(.bottom, 100)
        .background(
            roundedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: -50)
        
        )
        .padding(.top, -50)
 
    }
}

struct DetailPersonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPersonView()
    }
}

