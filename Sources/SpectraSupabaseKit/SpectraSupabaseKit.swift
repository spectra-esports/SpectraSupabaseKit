// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
/// Now, whenever you import SpectraComposableKit in any module, ComposableArchitecture will also be automatically imported.
@_exported import Supabase

/// Create a single supabase client for interacting with your database
public struct SupabaseClients {
    public static let shared = SupabaseClient(
        supabaseURL: URL(string: "https://jnwgnmgeftbpmgnhtjna.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impud2dubWdlZnRicG1nbmh0am5hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEyNjkwMDUsImV4cCI6MjA2Njg0NTAwNX0.QAlOu-jTNU2KOdn_WaGtaGYtW-HvRiW57uM5BHj2Esk",
        options: SupabaseClientOptions(
            db: SupabaseClientOptions.DatabaseOptions.init(
                encoder: JSONEncoder.supabaseEncoder,
                decoder: JSONDecoder.supabaseDecoder
            )
        )
    )
}

public extension JSONEncoder {
    static var supabaseEncoder: JSONEncoder {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        var encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(formatter)
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
}

public extension JSONDecoder {
    static var supabaseDecoder: JSONDecoder {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        var decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
