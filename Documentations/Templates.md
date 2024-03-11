> [!NOTE]
> Main documentation is available [here](../README.md).

# 🧱 Templates
Templates are groups of elements that work together to create a reusable, functional, and specific UI. They are the building blocks of a design system. They are also the most important part of a design system because they are the most reusable and flexible.

## Chips group
Code example:
```swif
ChipGroupView(
  selectedIndex: 0,
  chips: [
    "enim adipisicing",
    "culpa excepteur",
    "nostrud",
    "dolor",
    "sunt"
  ]
)
```

## Avatar group
Code example: 
```swift
AvatarGroupView(
  size: .medium,
  type: .user,
  images: [
    "https://picsum.photos/200",
    "https://picsum.photos/300",
    "https://picsum.photos/400",
    "https://picsum.photos/500",
  ]
)
```

## Social wall action bar
Code example: 
```swift
SocialActionBarView(
    isLiked: false,
    likeCount: 12, // Optional
    commentCount: 12, // Optional
    isSharable: true,
    isPinned: false
) { 
    // like button tapped callback
} shareTapped: {
    // share button tapped callback
}
```

## Social wall image
Code example:
```swift
SocialWallImageView(
    "https://example.com/image.jpg",
    tagName: "#ExampleTag",
    tagPoints: "123 pts"
)
```

## Social wall sender
Code example:
```swift
SocialWallSenderView(
    imageUrl: "https://example.com/image.jpg",
    userName: "Kelvin Rodriguez",
    userTeam: "Générique Bois Voiture",
    createAt: "Le 22/01/2022 à 12h30"
) {
    print("user tapped")
} userTeamTapped: {
    print("user team tapped")
} moreTapped: {
    print("more tapped")
}
```

## Social wall likes by
Code example:
```swift
SocialWallLikesByView(
    images: [
      "https://picsum.photos/200",
      "https://picsum.photos/300",
      "https://picsum.photos/400",
      "https://picsum.photos/500",
    ],
    text: "Veniam velit aliquip culpa non excepteur sit et cupidatat.",
    imageLimites: 3
) { 
    print("likes by tapped")
}
```

## Expending text
Code example: 
```swift 
ExpandingText(
    "Do Lorem elit enim ut occaecat nostrud qui et exercitation officia qui ex ex mollit et. Ea tempor anim excepteur anim commodo in commodo id. Exercitation aute sint veniam ullamco do elit fugiat eu cupidatat sit. Pariatur Lorem labore occaecat qui exercitation aute irure proident anim. Minim tempor esse irure qui aliquip Lorem ad sint. Tempor ea velit proident excepteur culpa deserunt eiusmod ullamco. Velit sit aliquip irure eiusmod ut veniam adipisicing excepteur laboris laborum officia proident.", 
    font: .h1, // Bones font token
    lineNumber: 3, // Default value: 3
    isExpanded: false, // Default value: true
    showMoreText: "Show more" // Default value: "Show more"
)
```

# ♦️ Cards
Cards are surfaces that display content and actions on a single topic. They should be easy to scan for relevant and actionable information. Elements, like text and images, should be placed on them in a way that clearly indicates hierarchy.

In some case Cards are set as button style when the only action is to tap on the card.

## Mobility card
Code example:
```swift
Button("title card") { /* Action to perform on tap */ }
    .buttonStyle(.bones(.card(.mobility(nil))))
Button("title card") { /* Action to perform on tap */ }
    .buttonStyle(.bones(.card(.mobility("https://picsum.photos/300"))))
```