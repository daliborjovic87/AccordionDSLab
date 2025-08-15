//
//  AudioController.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 24. 7. 2025..
//

import AVFoundation

// MARK: - AUDIO CONTROLLER
/// A singleton class that manages the audio graph, buffers, and note playback.
class AudioController: ObservableObject {
    // MARK: - SHARED INSTANCE
    static let shared = AudioController()
    
    // MARK: - AUDIO PROPERTIES
    private let engine = AVAudioEngine()
    private let mainMixer = AVAudioMixerNode()
    private let reverbNode = AVAudioUnitReverb()
    private let delayNode = AVAudioUnitDelay()
    
    // MARK: - CACHE & STATE
    // A cache for audio buffers—this is a key change.
    // [Base Register: [Key: AVAudioPCMBuffer]]
    private var audioBuffers: [Register: [Key: AVAudioPCMBuffer]] = [:]
    
    // A dictionary for all AVAudioPlayerNodes.
    // [Base Register: [Key: AVAudioPlayerNode]]
    private var playerNodes: [Register: [Key: AVAudioPlayerNode]] = [:]
    
    // The currently active register for playback.
    @Published var currentRegister: Register = .clarinet
    
    // MARK: - INITIALIZATION
    /// A private initializer for the singleton pattern.
    private init() {
        // Set up the audio session.
        self.setupAudioSession()
        
        // Connect the nodes in the audio graph: mainMixer -> reverb -> delay -> output.
        engine.attach(mainMixer)
        engine.attach(reverbNode)
        engine.attach(delayNode)
        engine.connect(mainMixer, to: reverbNode, format: nil)
        engine.connect(reverbNode, to: delayNode, format: nil)
        engine.connect(delayNode, to: engine.outputNode, format: nil)
        
        // Set up initial effect values.
        self.setupInitialEffects()
        
        // Load ALL samples into memory at startup.
        self.loadAllSamples()
    }
    
    // MARK: - HELPER METHODS
    
    /// Configures the app's audio session.
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set audio session category. Error: \(error.localizedDescription)")
        }
    }
    
    /// Sets the initial values for the effects.
    private func setupInitialEffects() {
        reverbNode.loadFactoryPreset(.mediumHall)
        reverbNode.wetDryMix = 0.0
        delayNode.delayTime = 0.0
        delayNode.feedback = 0.0
        delayNode.wetDryMix = 0.0
        delayNode.lowPassCutoff = 0.0
        print("Initial effects setup complete.")
    }

    // MARK: - ENGINE CONTROL
    
    /// Starts the audio engine.
    func startEngine() {
        if !engine.isRunning {
            do {
                try engine.start()
                print("AVAudioEngine started.")
            } catch {
                print("Error starting AVAudioEngine: \(error.localizedDescription)")
            }
        }
    }
    
    /// Stops the audio engine.
    func stopEngine() {
        if engine.isRunning {
            engine.stop()
            print("AVAudioEngine stopped.")
        }
    }
    
    // MARK: - EFFECTS CONTROL
    
    func setReverbWetDryMix(_ wetDryMix: Float) { reverbNode.wetDryMix = wetDryMix }
    func setReverbPreset(_ preset: AVAudioUnitReverbPreset) { reverbNode.loadFactoryPreset(preset) }
    func setDelayWetDryMix(_ wetDryMix: Float) { delayNode.wetDryMix = wetDryMix }
    func setDelayTime(_ delayTime: TimeInterval) { delayNode.delayTime = delayTime }
    func setDelayFeedback(_ feedback: Float) { delayNode.feedback = feedback }
    func setDelayLowPassCutoff(_ lowPassCutoff: Float) { delayNode.lowPassCutoff = lowPassCutoff }
    
    // MARK: - SAMPLE LOADING
    
    /// Loads all audio files into memory as buffers.
    private func loadAllSamples() {
        for register in Register.allCases.filter({ $0.soundCombination.count == 1 }) {
            var registerBuffers: [Key: AVAudioPCMBuffer] = [:]
            var registerPlayerNodes: [Key: AVAudioPlayerNode] = [:]
            
            for key in Key.allCases {
                let fileName = key.audioFileName(for: register)
                guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else {
                    print("Warning: Could not find \(fileName).wav in bundle.")
                    continue
                }
                
                do {
                    let audioFile = try AVAudioFile(forReading: url)
                    let audioFormat = audioFile.processingFormat
                    let audioFrameCount = UInt32(audioFile.length)
                    
                    guard let audioBuffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: audioFrameCount) else {
                        print("Error creating audio buffer for \(fileName).")
                        continue
                    }
                    
                    try audioFile.read(into: audioBuffer)
                    
                    registerBuffers[key] = audioBuffer
                    
                    let playerNode = AVAudioPlayerNode()
                    engine.attach(playerNode)
                    engine.connect(playerNode, to: mainMixer, format: audioFormat)
                    registerPlayerNodes[key] = playerNode
                    
                } catch {
                    print("Error loading or converting audio file \(fileName): \(error.localizedDescription)")
                }
            }
            
            audioBuffers[register] = registerBuffers
            playerNodes[register] = registerPlayerNodes
        }
        print("All base samples loaded as buffers and attached to players.")
    }

    // MARK: - PLAYBACK CONTROL
    
    /// Plays a note for the currently selected register using cached buffers with a fade-in effect.
        func playNote(key: Key) {
            for baseRegister in currentRegister.soundCombination {
                guard let playerNode = playerNodes[baseRegister]?[key],
                      let audioBuffer = audioBuffers[baseRegister]?[key] else {
                    print("Error: Player node or audio buffer not found for \(baseRegister.rawValue) and \(key.rawValue)")
                    continue
                }
                
                // Important: Stop the player and set the volume to 0.0 for fade-in`
                playerNode.stop()
                playerNode.volume = 0.0
                
                playerNode.scheduleBuffer(audioBuffer, at: nil)
                playerNode.play()
                
                let fadeInDuration: TimeInterval = 0
                let numberOfSteps = 10
                let timeInterval = fadeInDuration / TimeInterval(numberOfSteps)
                let volumeStep = 1.0 / Float(numberOfSteps)
                
                var currentStep = 0
                
                func fadeIn() {
                    if currentStep < numberOfSteps {
                        playerNode.volume += volumeStep
                        currentStep += 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
                            fadeIn()
                        }
                    } else {
                        playerNode.volume = 1.0
                    }
                }
                
                fadeIn()
            }
        }

    /// Stops playing a note for the currently selected register with a fade-out effect.
        func stopNote(key: Key) {
            for baseRegister in currentRegister.soundCombination {
                guard let playerNode = playerNodes[baseRegister]?[key] else {
                    continue
                }
                
                guard playerNode.isPlaying else { return }

                let fadeOutDuration: TimeInterval = 0.04 // 40 m/s
                let numberOfSteps = 10
                let timeInterval = fadeOutDuration / TimeInterval(numberOfSteps)
                let volumeStep = playerNode.volume / Float(numberOfSteps)

                func fadeOut(step: Int) {
                    if step < numberOfSteps {
                        
                        playerNode.volume -= volumeStep
                       
                        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
                            fadeOut(step: step + 1)
                        }
                    } else {
                        playerNode.volume = 0.0
                        playerNode.stop()
                    }
                }
                
                fadeOut(step: 0)
            }
        }
    
    // MARK: - CLEANUP
    
    /// The class deinitializer to release resources and stop the engine.
    deinit {
        stopEngine()
        for (_, keyNodes) in playerNodes {
            for (_, node) in keyNodes {
                engine.detach(node)
            }
        }
        engine.detach(mainMixer)
        engine.detach(reverbNode)
        engine.detach(delayNode)
    }
}
