//
//  ContentView.swift
//  ChipSelection
//
//  Created by Paul F on 22/03/25.
//

import SwiftUI

/// Sample Data
let tags: [String] = ["iOS 14", "SwiftUI", "macOS", "watchOS", "tvOS", "Xcode", "macCatalyst", "UIKit", "AppKit", "Cocoa", "Objective-C"]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Usage:")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                
                Text(
                    """
                    **ChipsView(tags: [...]) {**
                        /// Custom View
                    **} didChangeSelection: {**
                        
                    **}**
                    """
                )
                .monospaced()
                .padding(15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray.opacity(0.12), in: .rect(cornerRadius: 20))
                .padding(.bottom, 30)
                
                Text("Select more than two tags:")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                
                ChipsView(tags: tags) { tag, isSelected in
                    /// Your Custom View
                    ChipView(tag, isSelected: isSelected)
                } didChangeSelection: { selection in
                    print(selection)
                }
                .padding(10)
                .background(.gray.opacity(0.12), in: .rect(cornerRadius: 20))
                
                Spacer(minLength: 0)
            }
            .padding(15)
            .navigationTitle("Chips Selection")
        }
        #if os(macOS)
        .frame(minWidth: 250, minHeight: 300)
        #endif
    }
    
    @ViewBuilder
    func ChipView(_ tag: String, isSelected: Bool) -> some View {
        HStack(spacing: 10) {
            Text(tag)
                .font(.callout)
                .foregroundStyle(isSelected ? .white : Color.primary)
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background {
            ZStack {
                Capsule()
                    .fill(.background)
                    .opacity(!isSelected ? 1 : 0)
                
                Capsule()
                    .fill(.green.gradient)
                    .opacity(isSelected ? 1 : 0)
            }
        }
    }
}


#Preview {
    ContentView()
}
