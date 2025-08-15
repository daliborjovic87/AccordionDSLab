//  MarkdownText.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 23. 4. 2025..
//

import SwiftUI
import UIKit

struct MarkdownText: UIViewRepresentable {
    // MARK: - PROPERTIES
    
    let attributedText: AttributedString
    
    let baseTextStyle: UIFont.TextStyle
    let baseFontWeight: UIFont.Weight
    let baseFontSize: CGFloat?
    let baseFontColor: UIColor
    
    let padding: CGFloat
    let lineSpacing: CGFloat?
    let letterSpacing: CGFloat?
    let paragraphSpacing: CGFloat?
    let fixedSpaceWidth: CGFloat? // Not used, can be removed or utilized as needed
    let textAlignment: NSTextAlignment

    // MARK: - INITIALIZER
    
    init(attributedText: AttributedString,
         baseTextStyle: UIFont.TextStyle = .body,
         baseFontWeight: UIFont.Weight = .regular,
         baseFontSize: CGFloat? = nil,
         baseFontColor: UIColor = .black,
         padding: CGFloat = 1,
         lineSpacing: CGFloat? = nil,
         letterSpacing: CGFloat? = nil,
         paragraphSpacing: CGFloat? = nil,
         fixedSpaceWidth: CGFloat? = nil,
         textAlignment: NSTextAlignment = .justified) {
             
        self.attributedText = attributedText
        self.baseTextStyle = baseTextStyle
        self.baseFontWeight = baseFontWeight
        self.baseFontSize = baseFontSize
        self.baseFontColor = baseFontColor
        self.padding = padding
        self.lineSpacing = lineSpacing
        self.letterSpacing = letterSpacing
        self.paragraphSpacing = paragraphSpacing
        self.fixedSpaceWidth = fixedSpaceWidth
        self.textAlignment = textAlignment
    }

    // MARK: - UIViewRepresentable PROTOCOL
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = true
        textView.dataDetectorTypes = .all
        
        updateTextView(textView: textView)
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        updateTextView(textView: uiView)
        uiView.textContainerInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    // MARK: - HELPER METHODS
    
    private func updateTextView(textView: UITextView) {
        let finalAttributedText = NSMutableAttributedString(attributedString: NSAttributedString(attributedText))
        let fullRange = NSRange(location: 0, length: finalAttributedText.length)

        // First, apply the color to the entire text
        finalAttributedText.addAttribute(.foregroundColor, value: baseFontColor, range: fullRange)

        // 1. Applying font attributes (System Font and Dynamic Type)
        finalAttributedText.enumerateAttribute(.font, in: fullRange, options: []) { (value, range, stop) in
            var fontToApply: UIFont?

            let baseSystemFont: UIFont
            if let customSize = baseFontSize {
                baseSystemFont = UIFont.systemFont(ofSize: customSize, weight: baseFontWeight)
            } else {
                let preferredFontDescriptor = UIFont.preferredFont(forTextStyle: baseTextStyle).fontDescriptor
                let newDescriptor = preferredFontDescriptor.addingAttributes([
                    .traits: [
                        UIFontDescriptor.TraitKey.weight: baseFontWeight
                    ]
                ])
                baseSystemFont = UIFont(descriptor: newDescriptor, size: preferredFontDescriptor.pointSize)
            }

            if let originalFont = value as? UIFont {
                let fontDescriptor = originalFont.fontDescriptor
                var symbolicTraits = fontDescriptor.symbolicTraits
                
                symbolicTraits.remove(.traitLooseLeading)
                symbolicTraits.remove(.traitTightLeading)
                
                var newDescriptor = baseSystemFont.fontDescriptor
                
                if symbolicTraits.contains(.traitBold) {
                    newDescriptor = newDescriptor.withSymbolicTraits(newDescriptor.symbolicTraits.union(.traitBold)) ?? newDescriptor
                }
                if symbolicTraits.contains(.traitItalic) {
                    newDescriptor = newDescriptor.withSymbolicTraits(newDescriptor.symbolicTraits.union(.traitItalic)) ?? newDescriptor
                }
                
                fontToApply = UIFont(descriptor: newDescriptor, size: baseSystemFont.pointSize)
            } else {
                fontToApply = baseSystemFont
            }

            if let finalFont = fontToApply {
                finalAttributedText.addAttribute(.font, value: finalFont, range: range)
            }
        }

        // Reducing the size of the bullet point (Black Circle \u{25CF})
        let bulletChar = "\u{25CF}" as Character
        let string = finalAttributedText.string as NSString
        var searchRangeForBullet = NSRange(location: 0, length: string.length)
        
        while searchRangeForBullet.location < string.length {
            let foundRange = string.range(of: bulletChar.description, options: [], range: searchRangeForBullet)
            if foundRange.location != NSNotFound {
                if let currentFont = finalAttributedText.attribute(.font, at: foundRange.location, effectiveRange: nil) as? UIFont {
                    let smallerBulletFont = currentFont.withSize(currentFont.pointSize * 0.55)
                    finalAttributedText.addAttribute(.font, value: smallerBulletFont, range: foundRange)
                }
                searchRangeForBullet.location = foundRange.location + foundRange.length
                searchRangeForBullet.length = string.length - searchRangeForBullet.location
            } else {
                break
            }
        }

        // 2. Applying letter spacing
        if let letterSpacing = letterSpacing {
            finalAttributedText.addAttribute(.kern, value: letterSpacing, range: fullRange)
        }
        
        // 3. Robust application of paragraph styles to each line/paragraph (Indentation and alignment)
        var lineStart = 0
        var lineEnd = 0
        var contentsEnd = 0
        
        while lineStart < string.length {
            string.getLineStart(&lineStart, end: &lineEnd, contentsEnd: &contentsEnd, for: NSRange(location: lineStart, length: 1))

            var effectiveRange = NSRange()
            let existingParagraphStyle = (finalAttributedText.attribute(.paragraphStyle, at: lineStart, effectiveRange: &effectiveRange) as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()

            existingParagraphStyle.alignment = textAlignment
            if let lineSpacing = lineSpacing {
                existingParagraphStyle.lineSpacing = lineSpacing
            }
            if let paragraphSpacing = paragraphSpacing {
                existingParagraphStyle.paragraphSpacing = paragraphSpacing
            }
            
            let lineContent = string.substring(with: NSRange(location: lineStart, length: contentsEnd - lineStart))
            let trimmedLineContent = lineContent.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let isBulletList = trimmedLineContent.hasPrefix("\u{25CF}") || trimmedLineContent.hasPrefix("*")
            let isNumberedList = trimmedLineContent.range(of: "^\\d+\\.", options: .regularExpression) != nil

            if isBulletList || isNumberedList {
                let textBlockIndent: CGFloat = 35
                let bulletHangingOffset: CGFloat = 20
                
                existingParagraphStyle.headIndent = textBlockIndent
                existingParagraphStyle.firstLineHeadIndent = textBlockIndent - bulletHangingOffset
                
                let listTab = NSTextTab(textAlignment: .left, location: textBlockIndent, options: [:])
                existingParagraphStyle.tabStops = [listTab]
            }
            
            finalAttributedText.addAttribute(.paragraphStyle, value: existingParagraphStyle, range: NSRange(location: lineStart, length: lineEnd - lineStart))

            lineStart = lineEnd
        }

        textView.attributedText = finalAttributedText
    }

    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UITextView, context: Context) -> CGSize? {
        let targetWidth = proposal.width ?? uiView.frame.width
        let desiredSize = uiView.sizeThatFits(CGSize(width: targetWidth, height: UIView.noIntrinsicMetric))
        return CGSize(width: targetWidth, height: desiredSize.height)
    }
}

// MARK: - PREVIEW
struct MarkdownText_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("MarkdownText with System Font and Advanced Formatting")
                    .font(.headline)
                    .padding(.bottom, 10)

                MarkdownText(
                    attributedText: (try? AttributedString(markdown: """
\u{25CF}\tThe **right-hand manual**, which is located on a special **bracket** and includes **white and black keys** that can be of various shapes.  
\u{25CF}\t**Treble case**.  
\u{25CF}\t**Treble valve plate with air vents**.  
\u{25CF}\t**Tone chambers** in the **right-hand body - resonant chambers** on which sets of **free reeds** are mounted, sealed with special **wax**.  
\u{25CF}\t**Treble action**, which includes **key levers** with **springs** and **pallets**.  
\u{25CF}\t**Right-hand registers** for changing the **timbre** of the **treble**.  
\u{25CF}\t**Treble grille** - the **pallets cover** and protection for the **treble action** of the accordion.  
\u{25CF}\tThe **right-hand hardware**, which includes **straps** for holding the accordion during performance and **buckles** for securing the **bellows** in the closed position.
"""))!,
                    baseTextStyle: .body,
                    baseFontWeight: .regular,
                    baseFontColor: .colorA, // Koristimo novu boju
                    padding: 0,
                    lineSpacing: 0,
                    paragraphSpacing: 10,
                    textAlignment: .justified
                )
                .frame(maxWidth: .infinity)
                .border(Color.gray)
                .padding(.horizontal)

                MarkdownText(
                    attributedText: (try? AttributedString(markdown: "Title in **bold** with *italic* part."))!,
                    baseTextStyle: .title2,
                    baseFontWeight: .bold,
                    baseFontSize: 24,
                    baseFontColor: .blue,
                    padding: 10,
                    textAlignment: .center
                )
                .frame(maxWidth: .infinity)
                .border(Color.blue)
                .padding(.horizontal)
            }
        }
    }
}
