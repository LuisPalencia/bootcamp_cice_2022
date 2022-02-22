//
//  ContentView.swift
//  FashionApp
//
//  Created by CICE on 17/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HeaderComponents()
            Text("Hola Mundo")
                .font(.title)
            Button(action: {
                // Aqui es en donde se captura la accion del button
            }, label: {
                HStack{
                    Image(systemName: "play")
                    Text("Play")
                }
            })
            .padding()
            .font(.title2)
            .foregroundColor(.black)
            .background(Color.yellow)
            .shadow(radius: 10)
        }
    }
}

struct RefactoringView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            VStack(spacing: 20){
                HeaderComponents()
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 50))
                Image("captura1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.5),
                            radius: 20,
                            x: 5,
                            y: 5)
                    .overlay(
                        Text("Hola chicos")
                            .foregroundColor(.red)
                            .font(.title)
                            .fontWeight(.heavy)
                    )
            }
        }
    }
}

struct ShapesView: View {
    var body: some View {
        VStack(spacing: 20){
            HeaderComponents()
            Text("Se puede meter shapes para decorar las vistas")
                .foregroundColor(.orange)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.black)
                )
                .padding(8)
            Text("Se puede ajustar el fondo pero No con un Shape")
                .foregroundColor(.orange)
                .padding(10)
                .background(Color.black)
                .cornerRadius(20)
                .padding(8)
                .shadow(radius: 10)
        }
    }
}

struct VerticalStackView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20){
                HeaderComponents()
                
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("VStack dentro de otra VStack")
                    Divider()
                    Text("Esta puede tener subvistas")
                    Divider()
                    Text("Hasta un máximo de 10")
                    Divider()
                    Image(systemName: "arrow.left")
                }
                ).font(.title2)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)
                
                ).padding()
                
                VStack(alignment: .trailing, spacing: 10, content: {
                    Text("VStack dentro de otra VStack")
                    Divider()
                    Text("Esta puede tener subvistas")
                    Divider()
                    Text("Hasta un máximo de 10")
                    Divider()
                    Image(systemName: "arrow.right")
                }
                ).font(.title2)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)
                
                ).padding()
            }
            
            
        }
    }
}

struct HorizontalStackView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                HeaderComponents()
                
                HStack(spacing: 20){
                    Text("Leading")
                    Text("Middle")
                    Text("Traling")
                }
                .padding()
                .border(Color.orange)
                
                HStack{
                    Image(systemName: "1.circle").foregroundColor(.yellow)
                    Image(systemName: "2.circle").foregroundColor(.blue)
                    Image(systemName: "3.circle").foregroundColor(.red)
                }
                .padding()
                .font(.largeTitle)
                
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 100) {
                            Button(action: {
                            }, label: {
                                Image(systemName: "a.circle.fill").foregroundColor(.yellow)
                            })
                            Button(action: {
                            }, label: {
                                Image(systemName: "b.circle.fill").foregroundColor(.black)
                            })
                            Button(action: {
                            }, label: {
                                Image(systemName: "c.circle.fill").foregroundColor(.red)
                            })
                            Button(action: {
                            }, label: {
                                Image(systemName: "d.circle.fill").foregroundColor(.blue)
                            })
                            Button(action: {
                            }, label: {
                                Image(systemName: "e.circle.fill").foregroundColor(.green)
                            })
                            .padding()
                        }
                    }
                    .font(.largeTitle)
                    .background(Color.clear)
                }
            }
        }
    }
}

struct AlignmentHStackView: View {
    var body: some View {
        VStack(spacing: 20){
            HeaderComponents()
            
            HStack{
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing, 5)
            }
            .border(Color.orange)
            
            HStack(alignment: .top){
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                    .padding(.top, 5)
                Spacer()
                Text("Center")
                    .padding(.top, 5)
                Spacer()
                Text("Trailing")
                    .padding([.trailing, .top], 5)
            }
            .border(Color.orange)
            
            HStack(alignment: .bottom){
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading").padding(.bottom, 5)
                Spacer()
                Text("Center").padding(.bottom, 5)
                Spacer()
                Text("Trailing")
                    .padding([.trailing, .bottom], 5)
            }
            .border(Color.orange)
        }
    }
}

struct HStackPriorityView: View {
    
    var textViewAux: some View {
        Text(".layoutPriority(1) asigna hacia donde va el equilibrio de la vista")
            .font(.largeTitle)
            .padding(.horizontal)
            .background(Color.orange)
    }
    
    var priorityHStack: some View {
        VStack{
            HStack{
                Text("SwiftUI")
                    .font(.title)
                    .lineLimit(1)
                Image("user1")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title2)
                    .layoutPriority(1)
            }
            .padding(.horizontal)
            
            HStack{
                Text("SwiftUI")
                    .font(.title)
                    //.lineLimit(1)
                    .layoutPriority(1)
                Image("user1")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title2)
                    .lineLimit(1)
            }
            .padding(.horizontal)
        }
        
        
    }
    
    @ViewBuilder func showNextText() -> some View {
        VStack(alignment: .center, spacing: 20, content: {
            Text("Toma ya!")
        })
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            HeaderComponents()
            textViewAux
            priorityHStack
            showNextText()
        })
    }
}

struct IntroZStackView: View {
    var body: some View {
        Group{
            ZStack(alignment: .topTrailing){
                VStack(spacing: 20){
                    Spacer()
                    HeaderComponents()
                    Spacer()
                }
                
                Text("Esta es una ZStack")
                    .padding(.trailing, 20)
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BasicChangedCircle: View {
    
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20){
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .offset(x: self.change ? 120 : 0, y: self.change ? 300 : 0)
                .animation(.easeInOut, value: change)
            
            Spacer()
            
            Button("Change"){
                self.change.toggle()
            }
        }
    }
}

struct CurvesAnimationsView: View {
    
    @State private var move = false
    
    var body: some View {
        VStack(spacing: 20){
            Text("Animacion con curvas")
                .font(.largeTitle)
            
            Group {
                Text("1")
                GeometryReader{ proxy in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (proxy.size.width - 40) : 40, y: 40)
                        .animation(.easeInOut(duration: 2), value: self.move)
                }
                
                Text("2")
                GeometryReader{ proxy in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (proxy.size.width - 40) : 40, y: 40)
                        .animation(.linear(duration: 2), value: self.move)
                }
                
                Text("3")
                GeometryReader{ proxy in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (proxy.size.width - 40) : 40, y: 40)
                        .animation(.easeOut(duration: 2), value: self.move)
                }
            }
            
            Button("Change"){
                self.move.toggle()
            }
        }
        .font(.largeTitle)
        .padding(.bottom)
    }
}

struct CurvesAnimationsViewDos: View {
    
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20){
            Text("Esta es otra prueba").font(.largeTitle)
            Text("Vamos a probar con mas animaciones").font(.callout)
            Spacer()
            HStack{
                Spacer()
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
                    .offset(x: self.change ? -250 : 0, y: self.change ? -450 : 0)
                    .animation(.easeInOut, value: self.change)
            }
            
            Button("Change"){
                self.change.toggle()
            }
        }
    }
}

struct MenuAnimationView: View {
    
    @State private var showButtonMenu = false
    @State private var showButton1 = false
    @State private var showButton2 = false
    @State private var showButton3 = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing, content: {
                ScrollView {
                    VStack(spacing: 20){
                        Text("Menu Flotante").font(.title)
                        Text("Como les gusta a los Androides").font(.callout)
                        Spacer()
                        ShapesView()
                        CurvesAnimationsView()
                    }
                }
                .frame(maxWidth: .infinity)
                
                Group{
                    boton1
                    boton2
                    boton3
                    botonMenu
                }
                .padding()
                .foregroundColor(.white)
                .animation(.default, value: self.showButtonMenu)
                
                Group{
                    NavigationLink(
                        //destination: Text("bad.badge.plus"),
                        destination: CurvesAnimationsView(),
                        isActive: self.$showButton1,
                        label: {
                            Text("")
                        })
                }
                
            })
            .frame(maxWidth: .infinity)
            .navigationTitle("Test Navegacion")
            
        }
    }
    
    var boton1: some View {
        Button(action: {
            self.showButton1.toggle()
            self.showButtonMenu.toggle()
        }, label: {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        })
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 4, y: 4)
        )
        .offset(x: 0, y: self.showButtonMenu ? -150 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    
    var boton2: some View {
        Button(action: {
            self.showButtonMenu.toggle()
            self.showButton2.toggle()
        }, label: {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        })
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 4, y: 4)
        )
        .offset(x: self.showButtonMenu ? -150 : 0, y: 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    
    var boton3: some View {
        Button(action: {
            self.showButtonMenu.toggle()
        }, label: {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        })
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 4, y: 4)
        )
        .offset(x: self.showButtonMenu ? -100 : 0, y: self.showButtonMenu ? -100 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    
    var botonMenu: some View {
        Button(action: {
            self.showButtonMenu.toggle()
            self.showButton3.toggle()
        }, label: {
            Image(systemName: "plus")
                .foregroundColor(.white)
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 45 : 0))
        })
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 4, y: 4)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //ContentView()
            //RefactoringView()
            //ShapesView()
            //VerticalStackView()
            //HorizontalStackView()
            //AlignmentHStackView()
            //HStackPriorityView()
            //IntroZStackView().previewDevice("iPhone 12")
            //BasicChangedCircle().previewDevice("iPhone 12")
            //CurvesAnimationsView()
            //CurvesAnimationsViewDos().preferredColorScheme(.dark)
            MenuAnimationView()
        }
    }
}
