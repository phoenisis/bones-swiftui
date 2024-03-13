//
//  Buttons.swift
//  
//
//  Created by Quentin PIDOUX on 03/10/2023.
//

import SwiftUI

/// `BonesButtonStyles` is an enumeration representing various styles that can be applied to buttons.
public enum BonesButtonStyles { case bones(BonesButtonStyleToken) }

/// `BonesButtonStyleToken` is an enumeration of specific button styles.
///
/// This includes styles such as text buttons, home play buttons, small buttons,
/// medium buttons, large buttons, and chip buttons.
public enum BonesButtonStyleToken {
  public enum BonesTracker {
    case round(_ type: BonesTrackerRoundButton.ButtonType)
  }
  
  public enum BonesCardToken {
    case mobility(_ imageUrl: String?)
  }
  
  public enum BonesNavBarStyleToken {
    case icon(_ icon: Image.BonesImage)
    case text
  }
  
  public enum BonesButtonShapeToken {
    case rectangle(CGFloat.BonesRadius, fillColor: Color.BonesColorToken, shadow: ShadowStyle.BonesShadowToken)
  }
  
  case text(icon: Image.BonesImage?)
  case homePlay
  case small(_ variant: SmallToken)
  case select(_ variant: SmallToken)
  case medium(_ variant: MediumToken)
  case large(_ variant: LargeToken)
  case chip(selected: Bool?)
  case boost(startAt: Date?, endAt: Date?)
  
  case tracker(_ variant: BonesTracker)
  case card(_ variant: BonesCardToken)
  
  case navBar(_ variant: BonesNavBarStyleToken)
  
  case navigation
  
  case quiz(style: QuizButton.ButtonStyle, isSelected: Bool, imageUrl: String?)
  
  case shape(_ variant: BonesButtonShapeToken)
  
  case socialTag(availability: String?, remaining: String?, image: String?, description: String?, date: Date?, points: String?)
  
  public enum SmallToken {
    case fill
    case outline
  }
  
  public enum MediumToken {
    case fill(icon: Image.BonesImage?)
    case outline(icon: Image.BonesImage?)
  }
  
  public enum LargeToken {
    case fill(icon: Image.BonesImage?, subtitle: String?)
    case outline(icon: Image.BonesImage?, subtitle: String?)
  }
}
