#  Coding Assignment

## Potential Improvements
* Create a Localization Dictionary and use the Localization Keys instead of the text directly.
* Instead of validating when tapping on "Registration", Inline Input Field validation can be used, but should take more time to consider the accessibility (VoiceOver) impact.
* In larger projects we could consider building resuable screens (Example: ConfirmationView) and contribute it to a shared UI Library module.
* Instead of using spacing constants directly through out the views, we could define a struct / enum with frequently used spacings e.g., `LayoutConstant.Spacing.medium`.
