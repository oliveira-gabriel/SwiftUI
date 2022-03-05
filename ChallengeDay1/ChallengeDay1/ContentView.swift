
import SwiftUI

struct ContentView: View {
    @State private var input = 100.0
    @State private var inputUnit = "Meters"
    @State private var outputUnit = "Kilometers"

    @FocusState private var inputIsFocused: Bool

    let units: [UnitLength]  = [.feet, .kilometers, .meters, .miles, .yards]

    let formatter: MeasurementFormatter

    var result: String {
        var inputToMetersMultiplier: Double
        var metersToOutputMultiplier: Double

        switch inputUnit {
        case "Feet":
            inputToMetersMultiplier = 0.3048
        case "Kilometers":
            inputToMetersMultiplier = 1000
        case "Miles":
            inputToMetersMultiplier = 1609.34
        case "Yards":
            inputToMetersMultiplier = 0.9144
        default:
            inputToMetersMultiplier = 1.0
        }

        switch outputUnit{
        case "Feet":
            metersToOutputMultiplier = 3.28084
        case "Kilometers":
            metersToOutputMultiplier = 0.001
        case "Miles":
            metersToOutputMultiplier = 0.00062
        case "Yards":
            metersToOutputMultiplier = 1.09361
        default:
            metersToOutputMultiplier = 1.0
        }


        let inputInMeters = input * inputToMetersMultiplier
        let output = inputInMeters * metersToOutputMultiplier

        let outputString = output.formatted()
        return "\(outputString) \(outputUnit.lowercased())"
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)

                } header: {
                    Text("Amount to convert")
                }

                Picker("Convert from:", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }

                Picker("Convert to:", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }

                Section {
                    Text(result)
                } header: {
                    Text("Result")
                }
            }

        }
        .navigationTitle("Converter")
        .toolbar{
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    inputIsFocused = false
                }
            }
        }
    }
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
