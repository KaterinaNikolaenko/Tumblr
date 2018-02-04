//
// AspectRatioScaledToWidthFilter.swift
// Usage example where a UIImageView spans the screen width:
// let url = NSURL(string:"http://www.yourcompany.com/someimage.jpg")
// let scaleFilter = AspectRatioScaledToWidthFilter(width: UIScreen.mainScreen().bounds.width)
// myImageView.af_setImageWithURL(url, placeholderImage: nil, filter: scaleFilter)
//
// Created by Alankar Misra on 7/29/16.
// Released under MIT License.
//
// Copyright (c) 2016 Alankar Misra <alankarmisra@gmail.com>
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
import AlamofireImage

/// Scales an image to a specified width and proportional height.
public struct AspectRatioScaledToWidthFilter: ImageFilter {
    /// The size of the filter.
    public let width: CGFloat
    
    /**
     Initializes the `AspectRatioScaledToWidthFilter` instance with the given width.
     - parameter width: The width.
     - returns: The new `AspectRatioScaledToWidthFilter` instance.
     */
    public init(width: CGFloat) {
        self.width = width
    }
    
    /// The filter closure used to create the modified representation of the given image.
    public var filter: (Image) -> Image {
        return { image in
            return image.af_imageScaled(to: CGSize(width: self.width, height: self.width * image.size.height / image.size.width))
        }
    }
}
