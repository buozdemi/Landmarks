//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Burak Özdemir on 12.12.2023.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

#Preview { // The code you write in the preview only changes what Xcode displays in the canvas.
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
