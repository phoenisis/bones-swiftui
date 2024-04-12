//
//  Shapes.swift
//  
//
//  Created by Quentin PIDOUX on 30/10/2023.
//

import SwiftUI

public struct BonesShieldShape: Shape {
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0, y: 0.0275*height))
    path.addLine(to: CGPoint(x: 0.49356*width, y: 0))
    path.addLine(to: CGPoint(x: 0.98713*width, y: 0.0275*height))
    path.addLine(to: CGPoint(x: 0.98713*width, y: 0.78109*height))
    path.addLine(to: CGPoint(x: 0.49356*width, y: height))
    path.addLine(to: CGPoint(x: 0, y: 0.78109*height))
    path.addLine(to: CGPoint(x: 0, y: 0.0275*height))
    path.closeSubpath()
    return path
  }
}

public struct BonesBubbleDownShape: Shape {
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0, y: 0.08511*height))
    path.addCurve(to: CGPoint(x: 0.08414*width, y: 0), control1: CGPoint(x: 0, y: 0.0381*height), control2: CGPoint(x: 0.03767*width, y: 0))
    path.addLine(to: CGPoint(x: 0.91586*width, y: 0))
    path.addCurve(to: CGPoint(x: width, y: 0.08511*height), control1: CGPoint(x: 0.96233*width, y: 0), control2: CGPoint(x: width, y: 0.0381*height))
    path.addLine(to: CGPoint(x: width, y: 0.82294*height))
    path.addCurve(to: CGPoint(x: 0.91586*width, y: 0.90805*height), control1: CGPoint(x: width, y: 0.86994*height), control2: CGPoint(x: 0.96233*width, y: 0.90805*height))
    path.addLine(to: CGPoint(x: 0.08414*width, y: 0.90805*height))
    path.addCurve(to: CGPoint(x: 0, y: 0.82294*height), control1: CGPoint(x: 0.03767*width, y: 0.90805*height), control2: CGPoint(x: 0, y: 0.86994*height))
    path.addLine(to: CGPoint(x: 0, y: 0.08511*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.5*width, y: height))
    path.addLine(to: CGPoint(x: 0.41143*width, y: 0.84483*height))
    path.addLine(to: CGPoint(x: 0.58857*width, y: 0.84483*height))
    path.addLine(to: CGPoint(x: 0.5*width, y: height))
    path.closeSubpath()
    return path
  }
}

public struct BonesPointsShape: Shape {
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0.08989*width, y: 0.12918*height))
    path.addLine(to: CGPoint(x: 0.90122*width, y: 0.11122*height))
    path.addLine(to: CGPoint(x: 0.90954*width, y: 0.77815*height))
    path.addLine(to: CGPoint(x: 0.09881*width, y: 0.84375*height))
    path.addLine(to: CGPoint(x: 0.08989*width, y: 0.12918*height))
    path.closeSubpath()
    return path
  }
}

public struct BonesObsidianProfileShape: Shape {
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0.90066*width, y: 0.99884*height))
    path.addLine(to: CGPoint(x: 0.03053*width, y: 0.93227*height))
    path.addLine(to: CGPoint(x: 0.00187*width, y: 0.38659*height))
    path.addLine(to: CGPoint(x: 0.08158*width, y: 0.11083*height))
    path.addLine(to: CGPoint(x: 0.96598*width, y: 0.00076*height))
    path.addLine(to: CGPoint(x: 0.99936*width, y: 0.6362*height))
    path.addLine(to: CGPoint(x: 0.90066*width, y: 0.99884*height))
    path.closeSubpath()
    return path
  }
}
