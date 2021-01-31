//
//  ContentView.swift
//  SwiftUIDesigns
//
//  Created by Rohit Saini on 28/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View{
    @State private var txt = ""
    @State var show = false
    var body: some View{
        VStack(alignment:.leading,spacing:20){
            HStack{
                Button(action: {}, label: {
                    Image("menu").renderingMode(.original)
                })
                Image("logo")
                Spacer()
                Button(action: {}, label: {
                    Image("Notifications").renderingMode(.original)
                })
            }
            
            HStack{
                Image(systemName: "magnifyingglass").font(.body)
                TextField("Search For Movies,Shows", text: $txt)
            }
            .padding()
            .background(Color("Color"))
            
            ScrollView(showsIndicators: false){
                VStack(alignment:.leading,spacing:15){
                    Text("Netflix Originals").font(.title)
                    ZStack{
                        NavigationLink(destination: Details(show: $show), isActive: $show){
                            Text("")
                        }
                        Image("top").resizable()
                            .onTapGesture {
                                show.toggle()
                            }
                        VStack{
                            Spacer()
                            HStack{
                                VStack(alignment:.leading,spacing:10){
                                    Text("Marvel's The Defenders").font(.body)
                                    Text("Season 1").font(.caption)
                                }
                                Spacer()
                                Button(action: {}, label: {
                                    Image("play").renderingMode(.original)
                                })
                            }
                        }
                        .padding(.bottom)
                    }.frame(height:190)
                    HStack{
                        Spacer()
                        Button(action: {}, label: {
                            Text("View All")
                        }).foregroundColor(Color("Color1"))
                    }
                    Text("Continue Watching")
                    MiddleView()
                    BottomView()
                }
            }
        }.padding()
        .preferredColorScheme(.dark)
    }
}

struct MiddleView : View {
    
    var body : some View{
        
        VStack(spacing: 15){
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(datas){i in
                        
                        VStack(alignment: .leading,spacing: 0){
                            
                            Image(i.image)
                            
                            HStack{
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                }) {
                                    
                                    Image("play").renderingMode(.original).resizable().frame(width: 25, height: 25)
                                    
                                }.padding(.top, -12)
                            }
                            
                            VStack(alignment: .leading){
                                
                                Text(i.name)
                                Text(i.epname).foregroundColor(.gray)
                                
                                ZStack{
                                    
                                    Capsule().fill(Color.gray)
                                    
                                    HStack{
                                        
                                        Capsule().fill(Color("Color1")).frame(width: i.percentage)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                }.frame(height: 5)
                                
                            }.padding(.horizontal,10)
                            .padding(.bottom, 10)
                            
                            
                        }.background(Color("Color"))
                        .padding(.bottom)
                    }
                }
            }
        }
    }
}


struct BottomView:View{
    var body: some View{
        VStack(alignment:.leading,spacing:15){
            Text("Explore by Genere")
            HStack(spacing:10){
                ScrollView(.horizontal,showsIndicators:false){
                    HStack(spacing:30){
                        Button {
                            
                        } label: {
                            Text("Action")
                                .padding()
                            
                        }
                        .foregroundColor(.white)
                        .background(Color("Color1"))
                        .cornerRadius(10)
                        
                        Button {
                            
                        } label: {
                            Text("Adventure")
                                .padding()
                            
                        }
                        .foregroundColor(.white)
                        .background(Color("Color1"))
                        .cornerRadius(10)
                        
                        Button {
                            
                        } label: {
                            Text("Comedy")
                                .padding()
                            
                        }
                        .foregroundColor(.white)
                        .background(Color("Color1"))
                        .cornerRadius(10)
                    }
                    
                }
            }.padding(.horizontal)
            
            Text("Trending")
            ScrollView(.horizontal,showsIndicators:false){
                HStack(spacing:15){
                    ForEach(bottom,id:\.self){ i in
                        Image(i)
                    }
                }
            }
        }
    }
}

struct Details:View{
    @Binding var show:Bool
    var body: some View{
        VStack(spacing:15){
            HStack{
                Button {
                    show.toggle()
                } label: {
                    Image("back").renderingMode(.original)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("share").renderingMode(.original)
                }
                Button {
                    
                } label: {
                    Image("info").renderingMode(.original)
                }

            }
            ZStack{
                Image("detail").resizable()
                VStack(alignment:.leading,spacing:12){
                    Spacer()
                    Text("TV SERIES . ACTION")
                    Text("Marvel's The Defanders").font(.title)
                    HStack(spacing:10){
                        Text("98% Match").foregroundColor(.green)
                        Text("2019")
                        Text("hd")
                        Spacer()
                    }
                }
            }.frame(height:400)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            ScrollView(.vertical,showsIndicators:false){
                VStack(alignment:.leading,spacing:15){
                    HStack{
                        Button {
                            
                        } label: {
                            HStack(spacing:10){
                                Image(systemName: "play.fill")
                                Text("Play")
                            }
                            .padding()
                        }
                        .foregroundColor(.white)
                        .background(Color("Color1"))
                        .cornerRadius(10)
                       
                        
                        Button {
                            
                        } label: {
                            HStack(spacing:10){
                                Image(systemName: "plus")
                                Text("ADD TO LIST")
                            }
                            .padding()
                        }
                        .foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(10)
                        
                        Spacer()

                    }
                    
                    HStack{
                        VStack(alignment:.leading){
                            Text("Episodes").font(.title)
                            Text("Here are the episodes season 1").foregroundColor(.gray)
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            HStack{
                                Text("Season 1")
                                Image(systemName: "chevron.down")
                            }.padding()
                        }.foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(10)
                    }

                }
            }
        }
        .padding()
    }
}

struct type: Identifiable{
    var id: Int
    var name: String
    var epname:String
    var image: String
    var percentage:CGFloat
}

var datas = [type(id: 0, name: "Ghoul", epname: "Ep-S1", image: "m1", percentage: 45),
            type(id: 1, name: "13 Reasons Why", epname: "Ep-S2", image: "m2", percentage: 90)]

var bottom = ["b1","b2"]
