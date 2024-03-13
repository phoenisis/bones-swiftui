//
//  MapView.swift
//
//
//  Created by Quentin PIDOUX on 22/01/2024.
//

import MapKit
import SwiftUI

public struct BonesMapView: View {
  @State var mapType: MKMapType = .mutedStandard
  @State private var isMapPresented = false
  @State var isSatellitePresented: Bool = false

  let polyline: String

  public init(polyline: String) {
    self.polyline = polyline
  }

  func didTapOnSatellite() {
    HapticsProvider.sendHapticFeedback(.light(0.5))
    isSatellitePresented = true

    changeMap()
  }


  func didTapOnMap() {
    HapticsProvider.sendHapticFeedback(.light(0.5))
    isSatellitePresented = false

    changeMap()
  }


  func changeMap() {
    mapType =  isSatellitePresented ? .satellite : .mutedStandard
  }

  public var body: some View {
    UIKitMapView(mapType: mapType, polyline: polyline, allowHits: false)
      .onTapGesture(count: 1, perform: {
        HapticsProvider.sendHapticFeedback(.light())
        withAnimation(.spring()) {
          isMapPresented = true
        }
      })
      .aspectRatio(1.5, contentMode: .fit)
      .cornerRadius(.bones(.large))
      .shadow(radius: .bones(.close))
      .opacity(isMapPresented ? 0 : 1)
      .fullScreenCover(isPresented: $isMapPresented) {
        UIKitMapView(mapType: mapType, polyline: polyline, allowHits: true)
          .ignoresSafeArea()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .animation(.default, value: mapType)
          .overlay(
            alignment: .top,
            content: {
              HStack(
                alignment: .top,
                spacing: nil,
                content: {
                  Button("") { isMapPresented = false }
                    .buttonStyle(.bones(.navBar(.icon(.close))))
                  Spacer()

                  VStack(
                    alignment: .center,
                    spacing: .bones(.large),
                    content: {
                      VStack(
                        alignment: .center,
                        spacing: .bones(.small),
                        content: {
                          Button(
                            action: {
                              didTapOnMap()
                            },label: {
                              if isSatellitePresented == false {
                                Image(systemName: "map.fill")
                              } else {
                                Image(systemName: "map")
                              }
                            }
                          )
                          .frame(height: 40)

                          Divider()

                          Button(
                            action: {
                              didTapOnSatellite()
                            },label: {
                              if isSatellitePresented {
                                Image(systemName: "globe.europe.africa.fill")
                              } else {
                                Image(systemName: "globe.europe.africa")
                              }
                            }
                          )
                          .frame(height: 40)
                        }
                      )
                      .tint(.bones(.primary))
                      .foregroundStyle(Color.bones.primary)
                      .background(
                        RoundedRectangle(bonesRadius: .bones(.small))
                          .fill(.ultraThinMaterial)
                      )
                      .frame(width: 40)
                    }
                  )
                }
              )
              .padding(.horizontal, .bones(.large))
            }
          )
          .onDisappear {
            isMapPresented = false
          }
      }
      .transaction({ transaction in
        transaction.disablesAnimations = false
        transaction.animation = .easeIn(duration: 0.3)
      })
  }
}

#Preview {
  VStack {
    BonesMapView(polyline: """
    gmuqH{viaEKBSX_BfEgB~Di@`BWl@{@tCe@jBKv@Gz@Cz@?x@B~A@~AXzDp@~GTlBHv@HxBG\\]b@e@Cs@Ie@DcBKuCc@O@gB?uEOe@Cg@Mg@Ic@Fe@AsBKe@Gc@?e@EkACg@Ee@?_AEc@?_FWe@Ge@FY?oAGc@?c@Ec@Ag@GuBGaAIuCIU@e@EqAAi@GqB?i@Ec@?e@GmAGgAIiA?iAKoACg@GoCMyACmAKc@BiAKw@?oBOo@?a@GsAAq@EqDAmCO_CGgBKu@IgA[a@[]e@E}@DyALsBLmEAoDIyAKs@C{@I{@UsBUoAOmAK{@E{@g@eDi@}EYuBc@oDM_BOy@UyBWwC_BmKIw@[uBSqBYwBMuB]oBWqBEw@q@qEg@yESkAa@wDUiASoAOmBYwCE{@Ay@DcB?{@DwBLqD@}@D}@H}@F}BTgERaFDsBBGD{@?}@LwBj@iPRyDHoDHiBDoD@wBHqDIiEA}BMqDIyD?y@SoHAcCUcGEwBEwGIkASiLKwBEuBIu@e@KmA@}AAg@CeHCkDCkBHoAGmA?mAEuCAiAGkADgEKqBBg@CsBCmD@qBKmA?mDHmFZiFRg@DmABiATwADmBPmABg@AqBFkBLmA@qBNsG\\mADYBg@CkAHwABc@Be@FsGVaEXBE~Ea@vAIvA?tBQb@GjH_@FBh@BzEYr@GtBGd@EjDSfDElAKf@IxFQb@G~@E~AMxCI|AMbEKnBCpADtA@r@Ed@F`FDrBH`CAvBDd@Ad@C|D?tBFd@Af@DtEEdHFvFAn@U~@d@lAVd@NdCrAXRrAnAzAlA`BxAvCbCbFnDd@VbA`@jBTjADf@F|ABjAF|CDf@@d@DnBDnAL~@@jADlCTlAAh@BxBRhAFpBBb@@\\Fd@AvBDjAHzADbE\\|CLrDBf@HlAAhAL~GRd@BxBXhAFNBRp@B|@?x@QxHEvDObEInD?tBEtDAlFCvBK~CFtBEzCMnGIL?hCWlP@vBOnH@z@IrECfAGnD@~@IzB?pBSxKClDBnJGx@MpLIvBIpFCtFQpGAxBGpBCpDKxH@rBMbDA`CC|B@rDAfJYrGIbHIrBAv@B|@Ev@@|@KvBEtB?jBPv@d@RnAFpCVnA?lAFb@H`BFjANlAGd@BjDZh@Cj@D~@Eb@@d@DtADTDd@BVJ^Bb@ORe@C{@o@mFu@yISmD?}CB{@XsC`AmETs@jDwI
    """)
  }
}

struct UIKitMapView: UIViewRepresentable {
  private let mapType  : MKMapType
  private let polyline : String?
  private let mapView = MKMapView()
  private let allowHits: Bool

  public init(mapType: MKMapType, polyline: String?, allowHits: Bool) {
    self.mapType  = mapType
    self.polyline = polyline
    self.allowHits = allowHits
  }

  public func makeUIView(context: Context) -> MKMapView {
    mapView.mapType         = mapType
    mapView.isRotateEnabled = true
    mapView.isZoomEnabled   = true
    mapView.isPitchEnabled  = true
    mapView.delegate        = context.coordinator

    guard let polyline else { return mapView }

    let locations: [CLLocationCoordinate2D] = Polyline(encodedPolyline: polyline).coordinates ?? []

    mapView.addOverlay(MKPolyline(coordinates: locations, count: locations.count))

    mapView.setVisibleMapRectToFitAllAnnotations(animated: false,
                                                 shouldIncludeUserAccuracyRange: false,
                                                 shouldIncludeOverlays: true)
    mapView.isUserInteractionEnabled = allowHits

    return mapView
  }

  public func snap() -> UIImage? {
    mapView.screenshot
  }

  public func updateUIView(_ mapView: MKMapView, context: Context) {
    mapView.mapType = mapType
  }

  public func makeCoordinator() -> MapCoordinator {
    MapCoordinator(self)
  }

  public final class MapCoordinator: NSObject, MKMapViewDelegate {
    var parent: UIKitMapView

    init(_ parent: UIKitMapView) {
      self.parent = parent
    }

    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
      mapView.themeMap(rendererFor: overlay)
    }
  }
}

fileprivate extension MKMapView {
  func setVisibleMapRectToFitAllAnnotations(animated: Bool = true,
                                            shouldIncludeUserAccuracyRange: Bool = true,
                                            shouldIncludeOverlays: Bool = true,
                                            edgePadding: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)) {
    var mapOverlays = overlays

    if shouldIncludeUserAccuracyRange, let userLocation = userLocation.location {
      let userAccuracyRangeCircle = MKCircle(center: userLocation.coordinate, radius: userLocation.horizontalAccuracy)
      mapOverlays.append(MKOverlayRenderer(overlay: userAccuracyRangeCircle).overlay)
    }

    if shouldIncludeOverlays {
      let annotations = self.annotations.filter { !($0 is MKUserLocation) }
      for annotation in annotations {
        let circle = MKCircle(center: annotation.coordinate, radius: 1)
        mapOverlays.append(circle)
      }
    }

    let zoomRect = MKMapRect(bounding: mapOverlays)

    setVisibleMapRect(zoomRect, edgePadding: edgePadding, animated: animated)
  }
}

fileprivate extension MKMapRect {
  init(bounding overlays: [MKOverlay]) {
    self = .null
    for overlay in overlays {
      let rect: MKMapRect = overlay.boundingMapRect
      self = self.union(rect)
    }
  }
}


extension MKMapView {
  public func themeMap(rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    let color: UIColor = UIColor(.bones.primary)
    let foregroundColor: UIColor = UIColor(.bones.primaryForeground)

    if let overlay = overlay as? MKPolyline {
      let gradientColors = [
        color,
        color.lighten(),
        color,
        color.darken(),
        color,
        color.lighten(),
        color]
      let polylineRenderer = GradientPathRenderer(polyline: overlay, colors: gradientColors)

      polylineRenderer.lineWidth = 7
      polylineRenderer.showsBorder = true
      polylineRenderer.borderColor = foregroundColor

      return polylineRenderer
    }

    return MKOverlayRenderer()
  }
}


fileprivate extension UIColor {
  /// SwifterSwift: Lighten a color.
  ///
  ///     let color = Color(red: r, green: g, blue: b, alpha: a)
  ///     let lighterColor: Color = color.lighten(by: 0.2)
  ///
  /// - Parameter percentage: Percentage by which to lighten the color.
  /// - Returns: A lightened color.
  func lighten(by percentage: CGFloat = 0.2) -> UIColor {
    // https://stackoverflow.com/questions/38435308/swift-get-lighter-and-darker-color-variations-for-a-given-uicolor
    var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
    getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return UIColor(red: min(red + percentage, 1.0),
                   green: min(green + percentage, 1.0),
                   blue: min(blue + percentage, 1.0),
                   alpha: alpha)
  }

  /// SwifterSwift: Darken a color.
  ///
  ///     let color = Color(red: r, green: g, blue: b, alpha: a)
  ///     let darkerColor: Color = color.darken(by: 0.2)
  ///
  /// - Parameter percentage: Percentage by which to darken the color.
  /// - Returns: A darkened color.
  func darken(by percentage: CGFloat = 0.2) -> UIColor {
    // https://stackoverflow.com/questions/38435308/swift-get-lighter-and-darker-color-variations-for-a-given-uicolor
    var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
    getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return UIColor(red: max(red - percentage, 0),
                   green: max(green - percentage, 0),
                   blue: max(blue - percentage, 0),
                   alpha: alpha)
  }
}

/// Draws a given polyline with a gradient fill, use in place of a MKOverlayPathRenderer
open class GradientPathRenderer: MKOverlayPathRenderer {

  /// The polyline to render
  var polyline: MKPolyline
  /// The colors used to draw the gradient
  var colors: [UIColor]
  /// If a border should be rendered to make the line more visible
  public var showsBorder: Bool = false
  /// The color of tne border, if showsBorder is true
  public var borderColor: UIColor?

  /// Convenience to get an array of CGcolours from UIColors
  private var cgColors: [CGColor] {
    return colors.map({ (color) -> CGColor in
      return color.cgColor
    })
  }

  // MARK: Initializers
  /// Initializes a new Gradient Path Renderer from a given polyline and an array of colors
  ///
  /// - Parameters:
  ///   - polyline: The polyline to render
  ///   - colors: The colours the gardient should contain
  public init(polyline: MKPolyline, colors: [UIColor]) {
    self.polyline = polyline
    self.colors = colors

    super.init(overlay: polyline)
  }

  /// Initializes a new Gradient Path Renderer from a given polyline and an array of colors, with a border with a defined colour
  ///
  /// - Parameters:
  ///   - polyline: The polyline to render
  ///   - colors: The colours the gardient should contain
  ///   - showsBorder: If the polyline should have a border
  ///   - borderColor: The colour of the border
  init(polyline: MKPolyline, colors: [UIColor], showsBorder: Bool, borderColor: UIColor) {
    self.polyline = polyline
    self.colors = colors
    self.showsBorder = showsBorder
    self.borderColor = borderColor

    super.init(overlay: polyline)
  }

  // MARK: Override methods
  open override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {

    /*
     Set path width relative to map zoom scale
     */
    let baseWidth: CGFloat = self.lineWidth / zoomScale

    if self.showsBorder {
      context.setLineWidth(baseWidth * 2)
      context.setLineJoin(CGLineJoin.round)
      context.setLineCap(CGLineCap.round)
      context.addPath(self.path)
      context.setStrokeColor(self.borderColor?.cgColor ?? UIColor.white.cgColor)
      context.strokePath()
    }

    /*
     Create a gradient from the colors provided with evenly spaced stops
     */
    let colorspace = CGColorSpaceCreateDeviceRGB()
    let stopValues = calculateNumberOfStops()
    let locations: [CGFloat] = stopValues
    let gradient = CGGradient(colorsSpace: colorspace, colors: cgColors as CFArray, locations: locations)

    /*
     Define path properties and add it to context
     */
    context.setLineWidth(baseWidth)
    context.setLineJoin(CGLineJoin.round)
    context.setLineCap(CGLineCap.round)

    context.addPath(self.path)

    /*
     Replace path with stroked version so we can clip
     */
    context.saveGState()

    context.replacePathWithStrokedPath()
    context.clip()

    /*
     Create bounding box around path and get top and bottom points
     */
    let boundingBox = self.path.boundingBoxOfPath
    let gradientStart = boundingBox.origin
    let gradientEnd   = CGPoint(x:boundingBox.maxX, y:boundingBox.maxY)

    /*
     Draw the gradient in the clipped context of the path
     */
    if let gradient {
      context.drawLinearGradient(gradient, start: gradientStart, end: gradientEnd, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
    }

    context.restoreGState()

    super.draw(mapRect, zoomScale: zoomScale, in: context)
  }

  /*
   Create path from polyline
   Thanks to Adrian Schoenig
   (http://adrian.schoenig.me/blog/2013/02/21/drawing-multi-coloured-lines-on-an-mkmapview/ )
   */
  open override func createPath() {
    let path: CGMutablePath  = CGMutablePath()
    var pathIsEmpty: Bool = true

    for i in 0...self.polyline.pointCount-1 {

      let point: CGPoint = self.point(for: self.polyline.points()[i])
      if pathIsEmpty {
        path.move(to: point)
        pathIsEmpty = false
      } else {
        path.addLine(to: point)
      }
    }
    self.path = path
  }

  // MARK: Helper Methods
  private func calculateNumberOfStops() -> [CGFloat] {

    let stopDifference = (1 / Double(cgColors.count))

    return Array(stride(from: 0, to: 1+stopDifference, by: stopDifference))
      .map { (value) -> CGFloat in
        return CGFloat(value)
      }
  }
}
