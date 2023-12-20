import SwiftUI
import AVFoundation

class AudioState: ObservableObject {
    static let shared = AudioState()

    @Published var isMuted = false
    var audioPlayer: AVAudioPlayer?

    func stopAudio() {
        audioPlayer?.stop()
    }
}

struct ContentView: View {
    @StateObject private var audioState = AudioState.shared

    var body: some View {
        NavigationView {
            VStack {
                Image("Image")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

                HStack {
                  

                    Button(action: {
                        // Toggle the mute state
                        audioState.isMuted.toggle()

                        // Update audio player volume based on mute state
                        audioState.audioPlayer?.volume = audioState.isMuted ? 0.0 : 1.0
                    }) {
                        NavigationLink(destination: TriviaView()) {
                            PrimaryButton(text:"Let's Go, Duke!")
                        }
                       
                    }

                }
                
                
            }
            .navigationBarHidden(true)
            .onAppear {
                playAudio()
            }
        }
    }

    func playAudio() {
        if let url = Bundle.main.url(forResource: "Fight", withExtension: "wav") {
            do {
                // Initialize the audio player with the URL
                audioState.audioPlayer = try AVAudioPlayer(contentsOf: url)

                // Set the initial volume based on mute state
                audioState.audioPlayer?.volume = audioState.isMuted ? 0.0 : 1.0

                // Play the audio
                audioState.audioPlayer?.play()
            } catch {
                print("Error initializing audio player: \(error.localizedDescription)")
            }
        } else {
            print("Audio file not found.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
