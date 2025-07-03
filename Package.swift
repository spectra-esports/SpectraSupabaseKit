// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpectraSupabaseKit",
    platforms: [.iOS(.v18)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SpectraSupabaseKit",
            targets: ["SpectraSupabaseKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/supabase/supabase-swift.git", exact: "2.29.3"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SpectraSupabaseKit",
            dependencies: [
                .product(name: "Supabase", package: "supabase-swift")
            ],
        ),
        .testTarget(
            name: "SpectraSupabaseKitTests",
            dependencies: ["SpectraSupabaseKit"]
        ),
    ]
)
