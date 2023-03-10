//
//  RecordsView.swift
//  Cryato
//
//  Created by John Melody Me on 08/02/2023.
//

import SwiftUI

struct RecordsView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var records :[DBTransRecords] = [DBTransRecords]()
    
    public var body: some View {
        NavigationView {
            VStack {
                if records.isEmpty {
                    Text("No Records").background(.white)
                }
                else {
                    Form {
                        List (self.records) { record in
                            Section(header: Text("\(record.cryptoCurrencyName)")) {
                                Text("Ori: \(record.originalPrice)")
                                Text("Sell: \(record.sellingPrice)")
                                Text("Earned: \(record.earned)")
                                Text("Date: \(record.dateTime)")
                            }
                        }
                    }.background(Color(UIColor.systemGroupedBackground))
                }
            }
            .onAppear {
                self.records = try! DatabaseManager().getRecords()
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationBarTitle("Records")
            .scrollDismissesKeyboard(.interactively)
            .refreshable {
                // @TODO 
            }
            .toolbar {
                NavigationLink {
                    AddRecordsView()
                } label: {
                    Image(systemName: "doc.badge.plus").foregroundColor(
                        colorScheme.self == .dark ? .white : .black
                    )
                }
            }.background(Color(UIColor.systemGroupedBackground))
        }.background(Color(UIColor.systemGroupedBackground))
    }
}

struct RecordsView_Previews: PreviewProvider {
    public static var previews: some View {
        RecordsView()
    }
}
