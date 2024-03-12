//
//  File.swift
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

public struct BonesArrowShape: Shape {
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: 0.96*width, y: 0))
    path.addLine(to: CGPoint(x: width, y: 0.5*height))
    path.addLine(to: CGPoint(x: 0.96*width, y: height))
    path.addLine(to: CGPoint(x: 0, y: height))
    path.addLine(to: CGPoint(x: 0, y: 0))
    path.closeSubpath()
    return path
  }
}

public struct BonesRightArrowShape: Shape {
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0, y: 0.18182*height))
    path.addCurve(to: CGPoint(x: 0.04893*width, y: 0), control1: CGPoint(x: 0, y: 0.0814*height), control2: CGPoint(x: 0.02191*width, y: 0))
    path.addLine(to: CGPoint(x: 0.91986*width, y: 0))
    path.addCurve(to: CGPoint(x: 0.96584*width, y: 0.11968*height), control1: CGPoint(x: 0.94043*width, y: 0), control2: CGPoint(x: 0.95881*width, y: 0.04783*height))
    path.addLine(to: CGPoint(x: 0.99698*width, y: 0.43786*height))
    path.addCurve(to: CGPoint(x: 0.99698*width, y: 0.56214*height), control1: CGPoint(x: 1.00091*width, y: 0.478*height), control2: CGPoint(x: 1.00091*width, y: 0.522*height))
    path.addLine(to: CGPoint(x: 0.96584*width, y: 0.88032*height))
    path.addCurve(to: CGPoint(x: 0.91986*width, y: height), control1: CGPoint(x: 0.95881*width, y: 0.95217*height), control2: CGPoint(x: 0.94043*width, y: height))
    path.addLine(to: CGPoint(x: 0.04893*width, y: height))
    path.addCurve(to: CGPoint(x: 0, y: 0.81818*height), control1: CGPoint(x: 0.02191*width, y: height), control2: CGPoint(x: 0, y: 0.9186*height))
    path.addLine(to: CGPoint(x: 0, y: 0.18182*height))
    path.closeSubpath()
    return path
  }
}

public struct BonesRightObsidianShape: Shape {
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0.0669*width, y: 0.04171*height))
    path.addLine(to: CGPoint(x: 0.95458*width, y: 0.06282*height))
    path.addLine(to: CGPoint(x: 0.93458*width, y: 0.94343*height))
    path.addLine(to: CGPoint(x: 0.04436*width, y: 0.93854*height))
    path.addLine(to: CGPoint(x: 0.0669*width, y: 0.04171*height))
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
public struct BonesEarnPointShape: Shape {
    // swiftlint:disable:next function_body_length
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.size.width
    let height = rect.size.height
    path.move(to: CGPoint(x: 0.07407*width, y: 0.09459*height))
    path.addLine(to: CGPoint(x: 0.91701*width, y: 0.07563*height))
    path.addLine(to: CGPoint(x: 0.92567*width, y: 0.77973*height))
    path.addLine(to: CGPoint(x: 0.08334*width, y: 0.84898*height))
    path.addLine(to: CGPoint(x: 0.07407*width, y: 0.09459*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.36462*width, y: 0.33726*height))
    path.addCurve(to: CGPoint(x: 0.36134*width, y: 0.32751*height), control1: CGPoint(x: 0.36381*width, y: 0.33363*height), control2: CGPoint(x: 0.36271*width, y: 0.33038*height))
    path.addCurve(to: CGPoint(x: 0.3565*width, y: 0.3201*height), control1: CGPoint(x: 0.35999*width, y: 0.3246*height), control2: CGPoint(x: 0.35838*width, y: 0.32213*height))
    path.addCurve(to: CGPoint(x: 0.35006*width, y: 0.31537*height), control1: CGPoint(x: 0.35462*width, y: 0.31802*height), control2: CGPoint(x: 0.35247*width, y: 0.31645*height))
    path.addCurve(to: CGPoint(x: 0.34219*width, y: 0.31376*height), control1: CGPoint(x: 0.34767*width, y: 0.31429*height), control2: CGPoint(x: 0.34505*width, y: 0.31376*height))
    path.addCurve(to: CGPoint(x: 0.32906*width, y: 0.31908*height), control1: CGPoint(x: 0.33733*width, y: 0.31376*height), control2: CGPoint(x: 0.33296*width, y: 0.31553*height))
    path.addCurve(to: CGPoint(x: 0.3198*width, y: 0.33469*height), control1: CGPoint(x: 0.32516*width, y: 0.32263*height), control2: CGPoint(x: 0.32207*width, y: 0.32783*height))
    path.addCurve(to: CGPoint(x: 0.31643*width, y: 0.35975*height), control1: CGPoint(x: 0.31755*width, y: 0.34151*height), control2: CGPoint(x: 0.31643*width, y: 0.34986*height))
    path.addCurve(to: CGPoint(x: 0.31984*width, y: 0.38493*height), control1: CGPoint(x: 0.31643*width, y: 0.36968*height), control2: CGPoint(x: 0.31757*width, y: 0.37807*height))
    path.addCurve(to: CGPoint(x: 0.32918*width, y: 0.40054*height), control1: CGPoint(x: 0.32211*width, y: 0.39179*height), control2: CGPoint(x: 0.32523*width, y: 0.39699*height))
    path.addCurve(to: CGPoint(x: 0.34269*width, y: 0.40586*height), control1: CGPoint(x: 0.33314*width, y: 0.40409*height), control2: CGPoint(x: 0.33764*width, y: 0.40586*height))
    path.addCurve(to: CGPoint(x: 0.35494*width, y: 0.40179*height), control1: CGPoint(x: 0.34738*width, y: 0.40586*height), control2: CGPoint(x: 0.35146*width, y: 0.40451*height))
    path.addCurve(to: CGPoint(x: 0.36306*width, y: 0.39031*height), control1: CGPoint(x: 0.35845*width, y: 0.39908*height), control2: CGPoint(x: 0.36115*width, y: 0.39525*height))
    path.addCurve(to: CGPoint(x: 0.36597*width, y: 0.37273*height), control1: CGPoint(x: 0.365*width, y: 0.38533*height), control2: CGPoint(x: 0.36597*width, y: 0.37947*height))
    path.addLine(to: CGPoint(x: 0.36933*width, y: 0.37362*height))
    path.addLine(to: CGPoint(x: 0.34467*width, y: 0.37362*height))
    path.addLine(to: CGPoint(x: 0.34467*width, y: 0.35837*height))
    path.addLine(to: CGPoint(x: 0.37855*width, y: 0.35837*height))
    path.addLine(to: CGPoint(x: 0.37855*width, y: 0.37231*height))
    path.addCurve(to: CGPoint(x: 0.37392*width, y: 0.3991*height), control1: CGPoint(x: 0.37855*width, y: 0.3826*height), control2: CGPoint(x: 0.37701*width, y: 0.39153*height))
    path.addCurve(to: CGPoint(x: 0.36121*width, y: 0.41657*height), control1: CGPoint(x: 0.37086*width, y: 0.40664*height), control2: CGPoint(x: 0.36663*width, y: 0.41246*height))
    path.addCurve(to: CGPoint(x: 0.34269*width, y: 0.42273*height), control1: CGPoint(x: 0.35582*width, y: 0.42067*height), control2: CGPoint(x: 0.34965*width, y: 0.42273*height))
    path.addCurve(to: CGPoint(x: 0.32215*width, y: 0.41507*height), control1: CGPoint(x: 0.33489*width, y: 0.42273*height), control2: CGPoint(x: 0.32805*width, y: 0.42018*height))
    path.addCurve(to: CGPoint(x: 0.30843*width, y: 0.39336*height), control1: CGPoint(x: 0.31629*width, y: 0.40997*height), control2: CGPoint(x: 0.31172*width, y: 0.40273*height))
    path.addCurve(to: CGPoint(x: 0.30351*width, y: 0.35987*height), control1: CGPoint(x: 0.30515*width, y: 0.38395*height), control2: CGPoint(x: 0.30351*width, y: 0.37279*height))
    path.addCurve(to: CGPoint(x: 0.30637*width, y: 0.33355*height), control1: CGPoint(x: 0.30351*width, y: 0.3501*height), control2: CGPoint(x: 0.30446*width, y: 0.34133*height))
    path.addCurve(to: CGPoint(x: 0.31441*width, y: 0.31376*height), control1: CGPoint(x: 0.30828*width, y: 0.32578*height), control2: CGPoint(x: 0.31096*width, y: 0.31918*height))
    path.addCurve(to: CGPoint(x: 0.32666*width, y: 0.30126*height), control1: CGPoint(x: 0.31789*width, y: 0.30829*height), control2: CGPoint(x: 0.32197*width, y: 0.30413*height))
    path.addCurve(to: CGPoint(x: 0.3421*width, y: 0.29689*height), control1: CGPoint(x: 0.33137*width, y: 0.29835*height), control2: CGPoint(x: 0.33652*width, y: 0.29689*height))
    path.addCurve(to: CGPoint(x: 0.35511*width, y: 0.29982*height), control1: CGPoint(x: 0.34676*width, y: 0.29689*height), control2: CGPoint(x: 0.3511*width, y: 0.29787*height))
    path.addCurve(to: CGPoint(x: 0.36588*width, y: 0.30813*height), control1: CGPoint(x: 0.35915*width, y: 0.30177*height), control2: CGPoint(x: 0.36274*width, y: 0.30455*height))
    path.addCurve(to: CGPoint(x: 0.37375*width, y: 0.32093*height), control1: CGPoint(x: 0.36905*width, y: 0.31172*height), control2: CGPoint(x: 0.37168*width, y: 0.31599*height))
    path.addCurve(to: CGPoint(x: 0.37796*width, y: 0.33726*height), control1: CGPoint(x: 0.37583*width, y: 0.32584*height), control2: CGPoint(x: 0.37723*width, y: 0.33128*height))
    path.addLine(to: CGPoint(x: 0.36462*width, y: 0.33726*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.39968*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.38587*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.41689*width, y: 0.29856*height))
    path.addLine(to: CGPoint(x: 0.43192*width, y: 0.29856*height))
    path.addLine(to: CGPoint(x: 0.46294*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.44913*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.42476*width, y: 0.32081*height))
    path.addLine(to: CGPoint(x: 0.42409*width, y: 0.32081*height))
    path.addLine(to: CGPoint(x: 0.39968*width, y: 0.42105*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.40199*width, y: 0.37309*height))
    path.addLine(to: CGPoint(x: 0.44677*width, y: 0.37309*height))
    path.addLine(to: CGPoint(x: 0.44677*width, y: 0.38864*height))
    path.addLine(to: CGPoint(x: 0.40199*width, y: 0.38864*height))
    path.addLine(to: CGPoint(x: 0.40199*width, y: 0.37309*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.52967*width, y: 0.33726*height))
    path.addCurve(to: CGPoint(x: 0.52638*width, y: 0.32751*height), control1: CGPoint(x: 0.52885*width, y: 0.33363*height), control2: CGPoint(x: 0.52776*width, y: 0.33038*height))
    path.addCurve(to: CGPoint(x: 0.52154*width, y: 0.3201*height), control1: CGPoint(x: 0.52504*width, y: 0.3246*height), control2: CGPoint(x: 0.52342*width, y: 0.32213*height))
    path.addCurve(to: CGPoint(x: 0.5151*width, y: 0.31537*height), control1: CGPoint(x: 0.51966*width, y: 0.31802*height), control2: CGPoint(x: 0.51752*width, y: 0.31645*height))
    path.addCurve(to: CGPoint(x: 0.50723*width, y: 0.31376*height), control1: CGPoint(x: 0.51272*width, y: 0.31429*height), control2: CGPoint(x: 0.5101*width, y: 0.31376*height))
    path.addCurve(to: CGPoint(x: 0.4941*width, y: 0.31908*height), control1: CGPoint(x: 0.50238*width, y: 0.31376*height), control2: CGPoint(x: 0.498*width, y: 0.31553*height))
    path.addCurve(to: CGPoint(x: 0.48484*width, y: 0.33469*height), control1: CGPoint(x: 0.4902*width, y: 0.32263*height), control2: CGPoint(x: 0.48712*width, y: 0.32783*height))
    path.addCurve(to: CGPoint(x: 0.48148*width, y: 0.35975*height), control1: CGPoint(x: 0.4826*width, y: 0.34151*height), control2: CGPoint(x: 0.48148*width, y: 0.34986*height))
    path.addCurve(to: CGPoint(x: 0.48489*width, y: 0.38493*height), control1: CGPoint(x: 0.48148*width, y: 0.36968*height), control2: CGPoint(x: 0.48261*width, y: 0.37807*height))
    path.addCurve(to: CGPoint(x: 0.49423*width, y: 0.40054*height), control1: CGPoint(x: 0.48716*width, y: 0.39179*height), control2: CGPoint(x: 0.49027*width, y: 0.39699*height))
    path.addCurve(to: CGPoint(x: 0.50774*width, y: 0.40586*height), control1: CGPoint(x: 0.49819*width, y: 0.40409*height), control2: CGPoint(x: 0.50269*width, y: 0.40586*height))
    path.addCurve(to: CGPoint(x: 0.51999*width, y: 0.40179*height), control1: CGPoint(x: 0.51242*width, y: 0.40586*height), control2: CGPoint(x: 0.51651*width, y: 0.40451*height))
    path.addCurve(to: CGPoint(x: 0.52811*width, y: 0.39031*height), control1: CGPoint(x: 0.52349*width, y: 0.39908*height), control2: CGPoint(x: 0.5262*width, y: 0.39525*height))
    path.addCurve(to: CGPoint(x: 0.53101*width, y: 0.37273*height), control1: CGPoint(x: 0.53005*width, y: 0.38533*height), control2: CGPoint(x: 0.53101*width, y: 0.37947*height))
    path.addLine(to: CGPoint(x: 0.53438*width, y: 0.37362*height))
    path.addLine(to: CGPoint(x: 0.50972*width, y: 0.37362*height))
    path.addLine(to: CGPoint(x: 0.50972*width, y: 0.35837*height))
    path.addLine(to: CGPoint(x: 0.5436*width, y: 0.35837*height))
    path.addLine(to: CGPoint(x: 0.5436*width, y: 0.37231*height))
    path.addCurve(to: CGPoint(x: 0.53897*width, y: 0.3991*height), control1: CGPoint(x: 0.5436*width, y: 0.3826*height), control2: CGPoint(x: 0.54205*width, y: 0.39153*height))
    path.addCurve(to: CGPoint(x: 0.52626*width, y: 0.41657*height), control1: CGPoint(x: 0.53591*width, y: 0.40664*height), control2: CGPoint(x: 0.53167*width, y: 0.41246*height))
    path.addCurve(to: CGPoint(x: 0.50774*width, y: 0.42273*height), control1: CGPoint(x: 0.52087*width, y: 0.42067*height), control2: CGPoint(x: 0.5147*width, y: 0.42273*height))
    path.addCurve(to: CGPoint(x: 0.4872*width, y: 0.41507*height), control1: CGPoint(x: 0.49994*width, y: 0.42273*height), control2: CGPoint(x: 0.49309*width, y: 0.42018*height))
    path.addCurve(to: CGPoint(x: 0.47348*width, y: 0.39336*height), control1: CGPoint(x: 0.48134*width, y: 0.40997*height), control2: CGPoint(x: 0.47676*width, y: 0.40273*height))
    path.addCurve(to: CGPoint(x: 0.46856*width, y: 0.35987*height), control1: CGPoint(x: 0.4702*width, y: 0.38395*height), control2: CGPoint(x: 0.46856*width, y: 0.37279*height))
    path.addCurve(to: CGPoint(x: 0.47142*width, y: 0.33355*height), control1: CGPoint(x: 0.46856*width, y: 0.3501*height), control2: CGPoint(x: 0.46951*width, y: 0.34133*height))
    path.addCurve(to: CGPoint(x: 0.47946*width, y: 0.31376*height), control1: CGPoint(x: 0.47333*width, y: 0.32578*height), control2: CGPoint(x: 0.47601*width, y: 0.31918*height))
    path.addCurve(to: CGPoint(x: 0.4917*width, y: 0.30126*height), control1: CGPoint(x: 0.48294*width, y: 0.30829*height), control2: CGPoint(x: 0.48702*width, y: 0.30413*height))
    path.addCurve(to: CGPoint(x: 0.50715*width, y: 0.29689*height), control1: CGPoint(x: 0.49642*width, y: 0.29835*height), control2: CGPoint(x: 0.50157*width, y: 0.29689*height))
    path.addCurve(to: CGPoint(x: 0.52015*width, y: 0.29982*height), control1: CGPoint(x: 0.51181*width, y: 0.29689*height), control2: CGPoint(x: 0.51614*width, y: 0.29787*height))
    path.addCurve(to: CGPoint(x: 0.53093*width, y: 0.30813*height), control1: CGPoint(x: 0.52419*width, y: 0.30177*height), control2: CGPoint(x: 0.52779*width, y: 0.30455*height))
    path.addCurve(to: CGPoint(x: 0.5388*width, y: 0.32093*height), control1: CGPoint(x: 0.5341*width, y: 0.31172*height), control2: CGPoint(x: 0.53672*width, y: 0.31599*height))
    path.addCurve(to: CGPoint(x: 0.54301*width, y: 0.33726*height), control1: CGPoint(x: 0.54088*width, y: 0.32584*height), control2: CGPoint(x: 0.54228*width, y: 0.33128*height))
    path.addLine(to: CGPoint(x: 0.52967*width, y: 0.33726*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.62968*width, y: 0.29856*height))
    path.addLine(to: CGPoint(x: 0.62968*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.61772*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.57391*width, y: 0.33122*height))
    path.addLine(to: CGPoint(x: 0.57311*width, y: 0.33122*height))
    path.addLine(to: CGPoint(x: 0.57311*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.56011*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.56011*width, y: 0.29856*height))
    path.addLine(to: CGPoint(x: 0.57214*width, y: 0.29856*height))
    path.addLine(to: CGPoint(x: 0.616*width, y: 0.38852*height))
    path.addLine(to: CGPoint(x: 0.6168*width, y: 0.38852*height))
    path.addLine(to: CGPoint(x: 0.6168*width, y: 0.29856*height))
    path.addLine(to: CGPoint(x: 0.62968*width, y: 0.29856*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.64865*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.64865*width, y: 0.29856*height))
    path.addLine(to: CGPoint(x: 0.70269*width, y: 0.29856*height))
    path.addLine(to: CGPoint(x: 0.70269*width, y: 0.31447*height))
    path.addLine(to: CGPoint(x: 0.66165*width, y: 0.31447*height))
    path.addLine(to: CGPoint(x: 0.66165*width, y: 0.35179*height))
    path.addLine(to: CGPoint(x: 0.69987*width, y: 0.35179*height))
    path.addLine(to: CGPoint(x: 0.69987*width, y: 0.36764*height))
    path.addLine(to: CGPoint(x: 0.66165*width, y: 0.36764*height))
    path.addLine(to: CGPoint(x: 0.66165*width, y: 0.40514*height))
    path.addLine(to: CGPoint(x: 0.70319*width, y: 0.40514*height))
    path.addLine(to: CGPoint(x: 0.70319*width, y: 0.42105*height))
    path.addLine(to: CGPoint(x: 0.64865*width, y: 0.42105*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.26622*width, y: 0.59115*height))
    path.addCurve(to: CGPoint(x: 0.24858*width, y: 0.58618*height), control1: CGPoint(x: 0.2596*width, y: 0.59115*height), control2: CGPoint(x: 0.25372*width, y: 0.58949*height))
    path.addCurve(to: CGPoint(x: 0.23651*width, y: 0.57237*height), control1: CGPoint(x: 0.24348*width, y: 0.58283*height), control2: CGPoint(x: 0.23945*width, y: 0.57823*height))
    path.addCurve(to: CGPoint(x: 0.23204*width, y: 0.55215*height), control1: CGPoint(x: 0.23359*width, y: 0.56651*height), control2: CGPoint(x: 0.2321*width, y: 0.55977*height))
    path.addLine(to: CGPoint(x: 0.25477*width, y: 0.55215*height))
    path.addCurve(to: CGPoint(x: 0.25822*width, y: 0.56226*height), control1: CGPoint(x: 0.25486*width, y: 0.55638*height), control2: CGPoint(x: 0.25601*width, y: 0.55975*height))
    path.addCurve(to: CGPoint(x: 0.26622*width, y: 0.56603*height), control1: CGPoint(x: 0.26047*width, y: 0.56477*height), control2: CGPoint(x: 0.26313*width, y: 0.56603*height))
    path.addCurve(to: CGPoint(x: 0.27253*width, y: 0.56388*height), control1: CGPoint(x: 0.2686*width, y: 0.56603*height), control2: CGPoint(x: 0.27071*width, y: 0.56531*height))
    path.addCurve(to: CGPoint(x: 0.27683*width, y: 0.55766*height), control1: CGPoint(x: 0.27436*width, y: 0.5624*height), control2: CGPoint(x: 0.27579*width, y: 0.56033*height))
    path.addCurve(to: CGPoint(x: 0.27834*width, y: 0.54833*height), control1: CGPoint(x: 0.27786*width, y: 0.55498*height), control2: CGPoint(x: 0.27837*width, y: 0.55187*height))
    path.addCurve(to: CGPoint(x: 0.27683*width, y: 0.53899*height), control1: CGPoint(x: 0.27837*width, y: 0.54474*height), control2: CGPoint(x: 0.27786*width, y: 0.54163*height))
    path.addCurve(to: CGPoint(x: 0.27253*width, y: 0.53283*height), control1: CGPoint(x: 0.27579*width, y: 0.53632*height), control2: CGPoint(x: 0.27436*width, y: 0.53427*height))
    path.addCurve(to: CGPoint(x: 0.26622*width, y: 0.53062*height), control1: CGPoint(x: 0.27071*width, y: 0.53136*height), control2: CGPoint(x: 0.2686*width, y: 0.53062*height))
    path.addCurve(to: CGPoint(x: 0.25936*width, y: 0.53319*height), control1: CGPoint(x: 0.26375*width, y: 0.53062*height), control2: CGPoint(x: 0.26146*width, y: 0.53148*height))
    path.addCurve(to: CGPoint(x: 0.25477*width, y: 0.54019*height), control1: CGPoint(x: 0.25728*width, y: 0.53487*height), control2: CGPoint(x: 0.25575*width, y: 0.5372*height))
    path.addLine(to: CGPoint(x: 0.23423*width, y: 0.53445*height))
    path.addLine(to: CGPoint(x: 0.2376*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.29551*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.29551*width, y: 0.49354*height))
    path.addLine(to: CGPoint(x: 0.25679*width, y: 0.49354*height))
    path.addLine(to: CGPoint(x: 0.25511*width, y: 0.52057*height))
    path.addLine(to: CGPoint(x: 0.25561*width, y: 0.52057*height))
    path.addCurve(to: CGPoint(x: 0.2626*width, y: 0.51136*height), control1: CGPoint(x: 0.25696*width, y: 0.51687*height), control2: CGPoint(x: 0.25929*width, y: 0.5138*height))
    path.addCurve(to: CGPoint(x: 0.27413*width, y: 0.50766*height), control1: CGPoint(x: 0.26591*width, y: 0.50889*height), control2: CGPoint(x: 0.26975*width, y: 0.50766*height))
    path.addCurve(to: CGPoint(x: 0.28785*width, y: 0.51274*height), control1: CGPoint(x: 0.27927*width, y: 0.50766*height), control2: CGPoint(x: 0.28384*width, y: 0.50935*height))
    path.addCurve(to: CGPoint(x: 0.29741*width, y: 0.52679*height), control1: CGPoint(x: 0.29189*width, y: 0.51613*height), control2: CGPoint(x: 0.29508*width, y: 0.52081*height))
    path.addCurve(to: CGPoint(x: 0.3009*width, y: 0.54737*height), control1: CGPoint(x: 0.29976*width, y: 0.53273*height), control2: CGPoint(x: 0.30093*width, y: 0.53959*height))
    path.addCurve(to: CGPoint(x: 0.29661*width, y: 0.5701*height), control1: CGPoint(x: 0.30093*width, y: 0.5559*height), control2: CGPoint(x: 0.2995*width, y: 0.56348*height))
    path.addCurve(to: CGPoint(x: 0.28453*width, y: 0.58559*height), control1: CGPoint(x: 0.29374*width, y: 0.57667*height), control2: CGPoint(x: 0.28972*width, y: 0.58184*height))
    path.addCurve(to: CGPoint(x: 0.26622*width, y: 0.59115*height), control1: CGPoint(x: 0.27934*width, y: 0.58929*height), control2: CGPoint(x: 0.27323*width, y: 0.59115*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.33443*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.33443*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.37164*width, y: 0.46699*height))
    path.addCurve(to: CGPoint(x: 0.38843*width, y: 0.47237*height), control1: CGPoint(x: 0.37804*width, y: 0.46699*height), control2: CGPoint(x: 0.38363*width, y: 0.46878*height))
    path.addCurve(to: CGPoint(x: 0.39963*width, y: 0.4875*height), control1: CGPoint(x: 0.39323*width, y: 0.47596*height), control2: CGPoint(x: 0.39696*width, y: 0.481*height))
    path.addCurve(to: CGPoint(x: 0.40362*width, y: 0.51029*height), control1: CGPoint(x: 0.40229*width, y: 0.494*height), control2: CGPoint(x: 0.40362*width, y: 0.50159*height))
    path.addCurve(to: CGPoint(x: 0.3995*width, y: 0.53307*height), control1: CGPoint(x: 0.40362*width, y: 0.51906*height), control2: CGPoint(x: 0.40225*width, y: 0.52665*height))
    path.addCurve(to: CGPoint(x: 0.38801*width, y: 0.54791*height), control1: CGPoint(x: 0.39678*width, y: 0.53949*height), control2: CGPoint(x: 0.39295*width, y: 0.54444*height))
    path.addCurve(to: CGPoint(x: 0.3708*width, y: 0.55311*height), control1: CGPoint(x: 0.3831*width, y: 0.55138*height), control2: CGPoint(x: 0.37736*width, y: 0.55311*height))
    path.addLine(to: CGPoint(x: 0.34857*width, y: 0.55311*height))
    path.addLine(to: CGPoint(x: 0.34857*width, y: 0.52727*height))
    path.addLine(to: CGPoint(x: 0.36608*width, y: 0.52727*height))
    path.addCurve(to: CGPoint(x: 0.37311*width, y: 0.52524*height), control1: CGPoint(x: 0.36883*width, y: 0.52727*height), control2: CGPoint(x: 0.37118*width, y: 0.52659*height))
    path.addCurve(to: CGPoint(x: 0.37761*width, y: 0.51932*height), control1: CGPoint(x: 0.37508*width, y: 0.52384*height), control2: CGPoint(x: 0.37658*width, y: 0.52187*height))
    path.addCurve(to: CGPoint(x: 0.37921*width, y: 0.51029*height), control1: CGPoint(x: 0.37868*width, y: 0.51677*height), control2: CGPoint(x: 0.37921*width, y: 0.51376*height))
    path.addCurve(to: CGPoint(x: 0.37761*width, y: 0.50132*height), control1: CGPoint(x: 0.37921*width, y: 0.50678*height), control2: CGPoint(x: 0.37868*width, y: 0.50379*height))
    path.addCurve(to: CGPoint(x: 0.37311*width, y: 0.49557*height), control1: CGPoint(x: 0.37658*width, y: 0.4988*height), control2: CGPoint(x: 0.37508*width, y: 0.49689*height))
    path.addCurve(to: CGPoint(x: 0.36608*width, y: 0.49354*height), control1: CGPoint(x: 0.37118*width, y: 0.49422*height), control2: CGPoint(x: 0.36883*width, y: 0.49354*height))
    path.addLine(to: CGPoint(x: 0.35783*width, y: 0.49354*height))
    path.addLine(to: CGPoint(x: 0.35783*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.33443*width, y: 0.58947*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.49571*width, y: 0.52823*height))
    path.addCurve(to: CGPoint(x: 0.49011*width, y: 0.56274*height), control1: CGPoint(x: 0.49571*width, y: 0.54187*height), control2: CGPoint(x: 0.49385*width, y: 0.55337*height))
    path.addCurve(to: CGPoint(x: 0.47501*width, y: 0.58397*height), control1: CGPoint(x: 0.48638*width, y: 0.57207*height), control2: CGPoint(x: 0.48135*width, y: 0.57915*height))
    path.addCurve(to: CGPoint(x: 0.45379*width, y: 0.59115*height), control1: CGPoint(x: 0.46866*width, y: 0.58876*height), control2: CGPoint(x: 0.46159*width, y: 0.59115*height))
    path.addCurve(to: CGPoint(x: 0.4325*width, y: 0.58391*height), control1: CGPoint(x: 0.44594*width, y: 0.59115*height), control2: CGPoint(x: 0.43884*width, y: 0.58874*height))
    path.addCurve(to: CGPoint(x: 0.41743*width, y: 0.56262*height), control1: CGPoint(x: 0.42618*width, y: 0.57905*height), control2: CGPoint(x: 0.42116*width, y: 0.57195*height))
    path.addCurve(to: CGPoint(x: 0.41187*width, y: 0.52823*height), control1: CGPoint(x: 0.41373*width, y: 0.55325*height), control2: CGPoint(x: 0.41187*width, y: 0.54179*height))
    path.addCurve(to: CGPoint(x: 0.41743*width, y: 0.49378*height), control1: CGPoint(x: 0.41187*width, y: 0.51459*height), control2: CGPoint(x: 0.41373*width, y: 0.50311*height))
    path.addCurve(to: CGPoint(x: 0.4325*width, y: 0.47255*height), control1: CGPoint(x: 0.42116*width, y: 0.48441*height), control2: CGPoint(x: 0.42618*width, y: 0.47733*height))
    path.addCurve(to: CGPoint(x: 0.45379*width, y: 0.46531*height), control1: CGPoint(x: 0.43884*width, y: 0.46772*height), control2: CGPoint(x: 0.44594*width, y: 0.46531*height))
    path.addCurve(to: CGPoint(x: 0.47501*width, y: 0.47255*height), control1: CGPoint(x: 0.46159*width, y: 0.46531*height), control2: CGPoint(x: 0.46866*width, y: 0.46772*height))
    path.addCurve(to: CGPoint(x: 0.49011*width, y: 0.49378*height), control1: CGPoint(x: 0.48135*width, y: 0.47733*height), control2: CGPoint(x: 0.48638*width, y: 0.48441*height))
    path.addCurve(to: CGPoint(x: 0.49571*width, y: 0.52823*height), control1: CGPoint(x: 0.49385*width, y: 0.50311*height), control2: CGPoint(x: 0.49571*width, y: 0.51459*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.47164*width, y: 0.52823*height))
    path.addCurve(to: CGPoint(x: 0.46958*width, y: 0.50969*height), control1: CGPoint(x: 0.47164*width, y: 0.52089*height), control2: CGPoint(x: 0.47095*width, y: 0.51471*height))
    path.addCurve(to: CGPoint(x: 0.46356*width, y: 0.49821*height), control1: CGPoint(x: 0.46823*width, y: 0.50463*height), control2: CGPoint(x: 0.46622*width, y: 0.5008*height))
    path.addCurve(to: CGPoint(x: 0.45379*width, y: 0.49426*height), control1: CGPoint(x: 0.46092*width, y: 0.49557*height), control2: CGPoint(x: 0.45767*width, y: 0.49426*height))
    path.addCurve(to: CGPoint(x: 0.44399*width, y: 0.49821*height), control1: CGPoint(x: 0.44992*width, y: 0.49426*height), control2: CGPoint(x: 0.44665*width, y: 0.49557*height))
    path.addCurve(to: CGPoint(x: 0.43797*width, y: 0.50969*height), control1: CGPoint(x: 0.44135*width, y: 0.5008*height), control2: CGPoint(x: 0.43934*width, y: 0.50463*height))
    path.addCurve(to: CGPoint(x: 0.43595*width, y: 0.52823*height), control1: CGPoint(x: 0.43662*width, y: 0.51471*height), control2: CGPoint(x: 0.43595*width, y: 0.52089*height))
    path.addCurve(to: CGPoint(x: 0.43797*width, y: 0.54683*height), control1: CGPoint(x: 0.43595*width, y: 0.53557*height), control2: CGPoint(x: 0.43662*width, y: 0.54177*height))
    path.addCurve(to: CGPoint(x: 0.44399*width, y: 0.55831*height), control1: CGPoint(x: 0.43934*width, y: 0.55185*height), control2: CGPoint(x: 0.44135*width, y: 0.55568*height))
    path.addCurve(to: CGPoint(x: 0.45379*width, y: 0.5622*height), control1: CGPoint(x: 0.44665*width, y: 0.56091*height), control2: CGPoint(x: 0.44992*width, y: 0.5622*height))
    path.addCurve(to: CGPoint(x: 0.46356*width, y: 0.55831*height), control1: CGPoint(x: 0.45767*width, y: 0.5622*height), control2: CGPoint(x: 0.46092*width, y: 0.56091*height))
    path.addCurve(to: CGPoint(x: 0.46958*width, y: 0.54683*height), control1: CGPoint(x: 0.46622*width, y: 0.55568*height), control2: CGPoint(x: 0.46823*width, y: 0.55185*height))
    path.addCurve(to: CGPoint(x: 0.47164*width, y: 0.52823*height), control1: CGPoint(x: 0.47095*width, y: 0.54177*height), control2: CGPoint(x: 0.47164*width, y: 0.53557*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.52994*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.52994*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.50654*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.50654*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.52994*width, y: 0.46699*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.61561*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.61561*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.59608*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.56494*width, y: 0.52512*height))
    path.addLine(to: CGPoint(x: 0.56443*width, y: 0.52512*height))
    path.addLine(to: CGPoint(x: 0.56443*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.54103*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.54103*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.5609*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.59153*width, y: 0.5311*height))
    path.addLine(to: CGPoint(x: 0.59221*width, y: 0.5311*height))
    path.addLine(to: CGPoint(x: 0.59221*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.61561*width, y: 0.46699*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.62432*width, y: 0.49378*height))
    path.addLine(to: CGPoint(x: 0.62432*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.69924*width, y: 0.46699*height))
    path.addLine(to: CGPoint(x: 0.69924*width, y: 0.49378*height))
    path.addLine(to: CGPoint(x: 0.67331*width, y: 0.49378*height))
    path.addLine(to: CGPoint(x: 0.67331*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.65025*width, y: 0.58947*height))
    path.addLine(to: CGPoint(x: 0.65025*width, y: 0.49378*height))
    path.addLine(to: CGPoint(x: 0.62432*width, y: 0.49378*height))
    path.closeSubpath()
    path.move(to: CGPoint(x: 0.75451*width, y: 0.50526*height))
    path.addCurve(to: CGPoint(x: 0.75136*width, y: 0.49593*height), control1: CGPoint(x: 0.75428*width, y: 0.50128*height), control2: CGPoint(x: 0.75323*width, y: 0.49817*height))
    path.addCurve(to: CGPoint(x: 0.74289*width, y: 0.49258*height), control1: CGPoint(x: 0.7495*width, y: 0.4937*height), control2: CGPoint(x: 0.74668*width, y: 0.49258*height))
    path.addCurve(to: CGPoint(x: 0.73696*width, y: 0.49384*height), control1: CGPoint(x: 0.74048*width, y: 0.49258*height), control2: CGPoint(x: 0.7385*width, y: 0.493*height))
    path.addCurve(to: CGPoint(x: 0.73359*width, y: 0.49713*height), control1: CGPoint(x: 0.73544*width, y: 0.49464*height), control2: CGPoint(x: 0.73432*width, y: 0.49573*height))
    path.addCurve(to: CGPoint(x: 0.73245*width, y: 0.50191*height), control1: CGPoint(x: 0.73286*width, y: 0.49852*height), control2: CGPoint(x: 0.73248*width, y: 0.50012*height))
    path.addCurve(to: CGPoint(x: 0.733*width, y: 0.50592*height), control1: CGPoint(x: 0.7324*width, y: 0.50339*height), control2: CGPoint(x: 0.73258*width, y: 0.50473*height))
    path.addCurve(to: CGPoint(x: 0.73511*width, y: 0.50909*height), control1: CGPoint(x: 0.73345*width, y: 0.50708*height), control2: CGPoint(x: 0.73415*width, y: 0.50813*height))
    path.addCurve(to: CGPoint(x: 0.73877*width, y: 0.5116*height), control1: CGPoint(x: 0.73606*width, y: 0.51001*height), control2: CGPoint(x: 0.73728*width, y: 0.51085*height))
    path.addCurve(to: CGPoint(x: 0.74407*width, y: 0.51364*height), control1: CGPoint(x: 0.74025*width, y: 0.51236*height), control2: CGPoint(x: 0.74202*width, y: 0.51304*height))
    path.addLine(to: CGPoint(x: 0.75114*width, y: 0.51579*height))
    path.addCurve(to: CGPoint(x: 0.76339*width, y: 0.52147*height), control1: CGPoint(x: 0.75591*width, y: 0.51723*height), control2: CGPoint(x: 0.75999*width, y: 0.51912*height))
    path.addCurve(to: CGPoint(x: 0.77173*width, y: 0.52978*height), control1: CGPoint(x: 0.76679*width, y: 0.52382*height), control2: CGPoint(x: 0.76956*width, y: 0.52659*height))
    path.addCurve(to: CGPoint(x: 0.77648*width, y: 0.54043*height), control1: CGPoint(x: 0.77388*width, y: 0.53293*height), control2: CGPoint(x: 0.77547*width, y: 0.53648*height))
    path.addCurve(to: CGPoint(x: 0.77807*width, y: 0.55335*height), control1: CGPoint(x: 0.77752*width, y: 0.54438*height), control2: CGPoint(x: 0.77805*width, y: 0.54868*height))
    path.addCurve(to: CGPoint(x: 0.77383*width, y: 0.5738*height), control1: CGPoint(x: 0.77805*width, y: 0.5614*height), control2: CGPoint(x: 0.77663*width, y: 0.56822*height))
    path.addCurve(to: CGPoint(x: 0.76179*width, y: 0.58654*height), control1: CGPoint(x: 0.77102*width, y: 0.57939*height), control2: CGPoint(x: 0.76701*width, y: 0.58363*height))
    path.addCurve(to: CGPoint(x: 0.74306*width, y: 0.59091*height), control1: CGPoint(x: 0.7566*width, y: 0.58945*height), control2: CGPoint(x: 0.75036*width, y: 0.59091*height))
    path.addCurve(to: CGPoint(x: 0.72345*width, y: 0.58618*height), control1: CGPoint(x: 0.73557*width, y: 0.59091*height), control2: CGPoint(x: 0.72903*width, y: 0.58933*height))
    path.addCurve(to: CGPoint(x: 0.71049*width, y: 0.57165*height), control1: CGPoint(x: 0.71789*width, y: 0.58303*height), control2: CGPoint(x: 0.71357*width, y: 0.57819*height))
    path.addCurve(to: CGPoint(x: 0.70586*width, y: 0.54641*height), control1: CGPoint(x: 0.70743*width, y: 0.56507*height), control2: CGPoint(x: 0.70588*width, y: 0.55666*height))
    path.addLine(to: CGPoint(x: 0.72808*width, y: 0.54641*height))
    path.addCurve(to: CGPoint(x: 0.73006*width, y: 0.55586*height), control1: CGPoint(x: 0.72822*width, y: 0.55016*height), control2: CGPoint(x: 0.72888*width, y: 0.55331*height))
    path.addCurve(to: CGPoint(x: 0.73502*width, y: 0.56166*height), control1: CGPoint(x: 0.73123*width, y: 0.55841*height), control2: CGPoint(x: 0.73289*width, y: 0.56035*height))
    path.addCurve(to: CGPoint(x: 0.74273*width, y: 0.56364*height), control1: CGPoint(x: 0.73718*width, y: 0.56298*height), control2: CGPoint(x: 0.73975*width, y: 0.56364*height))
    path.addCurve(to: CGPoint(x: 0.74899*width, y: 0.56232*height), control1: CGPoint(x: 0.74522*width, y: 0.56364*height), control2: CGPoint(x: 0.74731*width, y: 0.5632*height))
    path.addCurve(to: CGPoint(x: 0.75282*width, y: 0.55867*height), control1: CGPoint(x: 0.75068*width, y: 0.56144*height), control2: CGPoint(x: 0.75196*width, y: 0.56023*height))
    path.addCurve(to: CGPoint(x: 0.75417*width, y: 0.55335*height), control1: CGPoint(x: 0.7537*width, y: 0.55712*height), control2: CGPoint(x: 0.75414*width, y: 0.55534*height))
    path.addCurve(to: CGPoint(x: 0.75287*width, y: 0.54845*height), control1: CGPoint(x: 0.75414*width, y: 0.55148*height), control2: CGPoint(x: 0.75371*width, y: 0.54984*height))
    path.addCurve(to: CGPoint(x: 0.74883*width, y: 0.54462*height), control1: CGPoint(x: 0.75205*width, y: 0.54701*height), control2: CGPoint(x: 0.7507*width, y: 0.54573*height))
    path.addCurve(to: CGPoint(x: 0.74121*width, y: 0.54139*height), control1: CGPoint(x: 0.74695*width, y: 0.54346*height), control2: CGPoint(x: 0.74441*width, y: 0.54238*height))
    path.addLine(to: CGPoint(x: 0.73262*width, y: 0.53876*height))
    path.addCurve(to: CGPoint(x: 0.71457*width, y: 0.52697*height), control1: CGPoint(x: 0.72499*width, y: 0.5364*height), control2: CGPoint(x: 0.71897*width, y: 0.53248*height))
    path.addCurve(to: CGPoint(x: 0.70804*width, y: 0.50431*height), control1: CGPoint(x: 0.71019*width, y: 0.52143*height), control2: CGPoint(x: 0.70802*width, y: 0.51388*height))
    path.addCurve(to: CGPoint(x: 0.71242*width, y: 0.48391*height), control1: CGPoint(x: 0.70802*width, y: 0.49653*height), control2: CGPoint(x: 0.70947*width, y: 0.48973*height))
    path.addCurve(to: CGPoint(x: 0.72475*width, y: 0.47022*height), control1: CGPoint(x: 0.7154*width, y: 0.47805*height), control2: CGPoint(x: 0.71951*width, y: 0.47349*height))
    path.addCurve(to: CGPoint(x: 0.74289*width, y: 0.46531*height), control1: CGPoint(x: 0.73003*width, y: 0.46695*height), control2: CGPoint(x: 0.73607*width, y: 0.46531*height))
    path.addCurve(to: CGPoint(x: 0.76095*width, y: 0.47027*height), control1: CGPoint(x: 0.74985*width, y: 0.46531*height), control2: CGPoint(x: 0.75587*width, y: 0.46697*height))
    path.addCurve(to: CGPoint(x: 0.77269*width, y: 0.48427*height), control1: CGPoint(x: 0.76603*width, y: 0.47358*height), control2: CGPoint(x: 0.76994*width, y: 0.47825*height))
    path.addCurve(to: CGPoint(x: 0.7769*width, y: 0.50526*height), control1: CGPoint(x: 0.77547*width, y: 0.49025*height), control2: CGPoint(x: 0.77687*width, y: 0.49725*height))
    path.addLine(to: CGPoint(x: 0.75451*width, y: 0.50526*height))
    path.closeSubpath()
    return path
  }
}


struct Previews_ShapeStyles : View {
  var body: some View {
    List {
      Section {
        BonesShieldShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(width: 50, height: 50)
      } header: {
        Text("Shield")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }      
      Section {
        BonesBubbleDownShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(width: 50, height: 50)
      } header: {
        Text("Bubble down")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }     

      Section {
        BonesPointsShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(height: 50)
          .frame(maxWidth: .infinity)
      } header: {
        Text("Bones Points")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }
      Section {
        BonesArrowShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(height: 50)
          .frame(maxWidth: .infinity)
      } header: {
        Text("Arrow")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        BonesRightArrowShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(height: 50)
          .frame(maxWidth: .infinity)
      } header: {
        Text("Right Arrow")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        BonesRightObsidianShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(height: 100)
          .frame(maxWidth: .infinity)
      } header: {
        Text("Right Obsidian")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        BonesObsidianProfileShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(height: 100)
          .frame(maxWidth: .infinity)
      } header: {
        Text("Obsidian Profile")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        BonesEarnPointShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(height: 100)
          .frame(maxWidth: .infinity)
      } header: {
        Text("Obsidian Profile")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }
    }
  }
}

#Preview {
  Previews_ShapeStyles()
}
