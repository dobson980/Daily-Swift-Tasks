//
//  SampleData.swift
//  Ghibli
//
//  Created by Tom Dobson on 12/15/25.
//

#if DEBUG
import Foundation

/// Container type that mirrors the structure of `sampleData.json` in the Preview Assets bundle.
///
/// By decoding into this type we can reuse real API responses in SwiftUI previews without
/// hitting the network, which keeps iterations snappy and deterministic.
struct SampleData: Decodable {
    let films: [Film]
    let people: [Person]
}
#endif
