//
//  AwardsView.swift
//  zts portfolio
//
//  Created by Hubert Leszkiewicz on 19/07/2021.
//

import SwiftUI

struct AwardsView: View {
    static let tag: String? = "Awards"
    
    @EnvironmentObject var dataController: DataController
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 100))]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Award.allAwards) { award in
                        Button {
                            // no action yet
                        } label: {
                            Image(systemName: award.image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .frame( width: 100, height: 100)
                                .foregroundColor(dataController.hasEarned(award: award) ?
                                    Color(award.color) : Color.secondary.opacity(0.5)
                                )
                        }
                    }
                }
            }
            .navigationTitle("Awards")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}