// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localizable {
  internal enum InfoPlist {
    /// Reface would like to access your camera so you can start taking photos and videos and reface them.
    internal static let nsCameraUsageDescription = Localizable.tr("InfoPlist", "NSCameraUsageDescription")
    /// Allow access to gallery to save your photos.
    internal static let nsPhotoLibraryAddUsageDescription = Localizable.tr("InfoPlist", "NSPhotoLibraryAddUsageDescription")
    /// Reface would like to access your photos to make swaps with them.
    internal static let nsPhotoLibraryUsageDescription = Localizable.tr("InfoPlist", "NSPhotoLibraryUsageDescription")
  }
  internal enum Strings {
    /// About
    internal static let about = Localizable.tr("Strings", "About")
    /// Choose Photo
    internal static let addImage = Localizable.tr("Strings", "add_image")
    /// Allow access to Camera to take a selfie and see the magic
    internal static let allowAccessToCamera = Localizable.tr("Strings", "allow_access_to_camera")
    /// Almost ready...
    internal static let almostReady = Localizable.tr("Strings", "almost_ready")
    /// Analyzing...
    internal static let analyzing = Localizable.tr("Strings", "analyzing")
    /// API timeout exceeded
    internal static let apiTimeoutExceeded = Localizable.tr("Strings", "api_timeout_exceeded")
    /// face too small or too large
    internal static let badPhotoQualityError = Localizable.tr("Strings", "bad_photo_quality_error")
    /// Choose Photo
    internal static let choosePhoto = Localizable.tr("Strings", "choose_photo")
    /// Confirm
    internal static let confirm = Localizable.tr("Strings", "confirm")
    /// Converting...
    internal static let converting = Localizable.tr("Strings", "converting")
    /// Copy image
    internal static let copyImage = Localizable.tr("Strings", "copy_image")
    /// Debug settings
    internal static let debugSettings = Localizable.tr("Strings", "debug_settings")
    /// Model context was copied
    internal static let debugSettingsContextCopied = Localizable.tr("Strings", "debug_settings_context_copied")
    /// Can't find valid model context
    internal static let debugSettingsContextNotFound = Localizable.tr("Strings", "debug_settings_context_not_found")
    /// Removed face embeddings
    internal static let debugSettingsDidRemoveFaceEmbeddings = Localizable.tr("Strings", "debug_settings_did_remove_face_embeddings")
    /// Removed model
    internal static let debugSettingsDidRemoveModel = Localizable.tr("Strings", "debug_settings_did_remove_model")
    /// Removed original photo
    internal static let debugSettingsDidRemoveOriginal = Localizable.tr("Strings", "debug_settings_did_remove_original")
    /// Environment safety test
    internal static let debugSettingsEnvSafetyTest = Localizable.tr("Strings", "debug_settings_env_safety_test")
    /// Force expire user public key
    internal static let debugSettingsForceExpireUserPk = Localizable.tr("Strings", "debug_settings_force_expire_user_pk")
    /// IDFA was copied
    internal static let debugSettingsIdfaCopied = Localizable.tr("Strings", "debug_settings_idfa_copied")
    /// Copy IDFA
    internal static let debugSettingsIdfaTitle = Localizable.tr("Strings", "debug_settings_idfa_title")
    /// Copy model context
    internal static let debugSettingsModelContextTitle = Localizable.tr("Strings", "debug_settings_model_context_title")
    /// Proxyman host
    internal static let debugSettingsProxymanHost = Localizable.tr("Strings", "debug_settings_proxyman_host")
    /// Remote config & analytics
    internal static let debugSettingsRcAnalytics = Localizable.tr("Strings", "debug_settings_rc_analytics")
    /// Remove embeddings (serverside)
    internal static let debugSettingsRemoveFaceEmbeddings = Localizable.tr("Strings", "debug_settings_remove_face_embeddings")
    /// Remove model
    internal static let debugSettingsRemoveModel = Localizable.tr("Strings", "debug_settings_remove_model")
    /// Remove original
    internal static let debugSettingsRemoveOriginal = Localizable.tr("Strings", "debug_settings_remove_original")
    /// Something went wrong
    internal static let defaultErrorMessage = Localizable.tr("Strings", "default_error_message")
    /// Oops...
    internal static let defaultErrorTitle = Localizable.tr("Strings", "default_error_title")
    /// Empty data received
    internal static let emptyDataReceived = Localizable.tr("Strings", "empty_data_received")
    /// Erasing...
    internal static let erasing = Localizable.tr("Strings", "erasing")
    /// Failed to export image
    internal static let exportImageError = Localizable.tr("Strings", "export_image_error")
    /// Choose another face or add a new one
    internal static let faceVersionIncompatible = Localizable.tr("Strings", "face_version_incompatible")
    /// News Feed
    internal static let facebookApp = Localizable.tr("Strings", "facebook_app")
    /// Messenger
    internal static let facebookMessenger = Localizable.tr("Strings", "facebook_messenger")
    /// Please install Facebook to share content
    internal static let facebookNotInstalledMessage = Localizable.tr("Strings", "facebook_not_installed_message")
    /// Facebook
    internal static let facebookNotInstalledTitle = Localizable.tr("Strings", "facebook_not_installed_title")
    /// Reels
    internal static let facebookReels = Localizable.tr("Strings", "facebook_reels")
    /// Stories
    internal static let facebookStories = Localizable.tr("Strings", "facebook_stories")
    /// Copied
    internal static let imageCopied = Localizable.tr("Strings", "image_copied")
    /// Instagram post
    internal static let instaPost = Localizable.tr("Strings", "insta_post")
    /// Instagram reels
    internal static let instaReels = Localizable.tr("Strings", "insta_reels")
    /// Instagram stories
    internal static let instaStories = Localizable.tr("Strings", "insta_stories")
    /// Instagram
    internal static let instagram = Localizable.tr("Strings", "instagram")
    /// Please install Instagram to share posts
    internal static let instagramNotInstalledMessage = Localizable.tr("Strings", "instagram_not_installed_message")
    /// Instagram
    internal static let instagramNotInstalledTitle = Localizable.tr("Strings", "instagram_not_installed_title")
    /// and
    internal static let introAnd = Localizable.tr("Strings", "intro_and")
    /// Get Started
    internal static let introGetStarted = Localizable.tr("Strings", "intro_get_started")
    /// Privacy Notice
    internal static let introPrivacyNotice = Localizable.tr("Strings", "intro_privacy_notice")
    /// By getting started I agree with
    internal static let introPromoteSelfieFooter = Localizable.tr("Strings", "intro_promote_selfie_footer")
    /// I agree with
    internal static let introPromoteSelfieFooterPolicy = Localizable.tr("Strings", "intro_promote_selfie_footer_policy")
    /// Just One Selfie and\nYou're a Star
    internal static let introPromoteSelfieTitle = Localizable.tr("Strings", "intro_promote_selfie_title")
    /// ,
    internal static let introSeparator = Localizable.tr("Strings", "intro_separator")
    /// This is sad because we can’t reface without your face. Will you give us a chance? We promise not to store your photos.
    internal static let introSkippingSelfieDescription = Localizable.tr("Strings", "intro_skipping_selfie_description")
    /// Skipping selfie?
    internal static let introSkippingSelfieTitle = Localizable.tr("Strings", "intro_skipping_selfie_title")
    /// Subscription Policy
    internal static let introSubscriptionPolicy = Localizable.tr("Strings", "intro_subscription_policy")
    /// Try not to smile. Do not close your eyes.\nFind good lighting.
    internal static let introTakeSelfieDescription = Localizable.tr("Strings", "intro_take_selfie_description")
    /// Dont worry, we don’t store any photos on our servers.
    internal static let introTakeSelfieDontWorry = Localizable.tr("Strings", "intro_take_selfie_dont_worry")
    /// See how it works.
    internal static let introTakeSelfieSeeHowItWorks = Localizable.tr("Strings", "intro_take_selfie_see_how_it_works")
    /// Take a Selfie
    internal static let introTakeSelfieTakeSelfieButton = Localizable.tr("Strings", "intro_take_selfie_take_selfie_button")
    /// Take a Classic Portrait Selfie
    internal static let introTakeSelfieTitle = Localizable.tr("Strings", "intro_take_selfie_title")
    /// Upload from Photos
    internal static let introTakeSelfieUploadFromPhotos = Localizable.tr("Strings", "intro_take_selfie_upload_from_photos")
    /// Terms of Use
    internal static let introTermsOfUse = Localizable.tr("Strings", "intro_terms_of_use")
    /// The network connection is unstable. Reconnect
    internal static let malformedSecurityHeader = Localizable.tr("Strings", "malformed_security_header")
    /// Message
    internal static let messages = Localizable.tr("Strings", "messages")
    /// More
    internal static let more = Localizable.tr("Strings", "more")
    /// please check your internet connection and try again
    internal static let networkErrorMessage = Localizable.tr("Strings", "network_error_message")
    /// Next reface will be available in
    internal static let nextRefaceIn = Localizable.tr("Strings", "next_reface_in")
    /// 
    internal static let noFaceDetectedErrorDescription = Localizable.tr("Strings", "no_face_detected_error_description")
    /// Could not detect faces on this image
    internal static let noFaceDetectedErrorTitle = Localizable.tr("Strings", "no_face_detected_error_title")
    /// No faces were found
    internal static let noFacesFound = Localizable.tr("Strings", "no_faces_found")
    /// Open Settings
    internal static let openSettings = Localizable.tr("Strings", "open_settings")
    /// You’ve hit the limit of free refaces. Please wait a bit so that others can also enjoy reface magic in action.
    internal static let outOfRefacesSubtitle = Localizable.tr("Strings", "out_of_refaces_subtitle")
    /// Out of refaces
    internal static let outOfRefacesTitle = Localizable.tr("Strings", "out_of_refaces_title")
    /// You have not granted access to the photo gallery for the application.
    internal static let photosPermissionsNotGranted = Localizable.tr("Strings", "photos_permissions_not_granted")
    /// We used to store only face embeddings (encrypted face data) on our servers. \n\nNow we erased all your face data from our servers to meet the GDPR compliance.\n\nAll your original face photos are stored only locally on your device.
    internal static let popupOldFacesRemovedMessage = Localizable.tr("Strings", "popup_old_faces_removed_message")
    /// We had to delete some of your faces from the app
    internal static let popupOldFacesRemovedTitle = Localizable.tr("Strings", "popup_old_faces_removed_title")
    /// Try out face swap on the latest videos and amaze your friends.
    internal static let pushSwapLimitUnlockedBody = Localizable.tr("Strings", "push_swap_limit_unlocked_body")
    /// You’ve got FREE refaces 🎁
    internal static let pushSwapLimitUnlockedTitle = Localizable.tr("Strings", "push_swap_limit_unlocked_title")
    /// Receipt status invalid
    internal static let receiptStatusInvalid = Localizable.tr("Strings", "receipt_status_invalid")
    /// Demo
    internal static let reenactmentPickPhotoDemoTitle = Localizable.tr("Strings", "reenactment_pick_photo_demo_title")
    /// Photos
    internal static let reenactmentPickPhotoItemsTitle = Localizable.tr("Strings", "reenactment_pick_photo_items_title")
    /// Refacing...
    internal static let refacing = Localizable.tr("Strings", "refacing")
    /// Remove Watermark
    internal static let removeWatermark = Localizable.tr("Strings", "remove_watermark")
    /// Report
    internal static let report = Localizable.tr("Strings", "report")
    /// Feel free to report this content if you think it’s inappropriate.
    internal static let reportContentDescription = Localizable.tr("Strings", "report_content_description")
    /// Restoring...
    internal static let restoring = Localizable.tr("Strings", "restoring")
    /// Wrong file type (%@)
    internal static func saveToGalleryWrongFileType(_ p1: Any) -> String {
      return Localizable.tr("Strings", "save_to_gallery_wrong_file_type", String(describing: p1))
    }
    /// Settings
    internal static let settings = Localizable.tr("Strings", "Settings")
    /// Share
    internal static let share = Localizable.tr("Strings", "share")
    /// Thanks for using #reface hashtag
    internal static let shareRefaceResultSubtitle = Localizable.tr("Strings", "share_reface_result_subtitle")
    /// Share Result
    internal static let shareRefaceResultTitle = Localizable.tr("Strings", "share_reface_result_title")
    /// Skip
    internal static let skip = Localizable.tr("Strings", "skip")
    /// Snapchat
    internal static let snapchat = Localizable.tr("Strings", "snapchat")
    /// Subscription is auto-renewable. You can cancel your subscription at any time.
    internal static let subscriptionCompareAnnualPlusPriceNonTrialDescription = Localizable.tr("Strings", "subscription_compare_annual_plus_price_non_trial_description")
    /// After the trial period you’ll be charged %@ per %@ unless you cancel before the trial expires.
    internal static func subscriptionFooterTrialDescription(_ p1: Any, _ p2: Any) -> String {
      return Localizable.tr("Strings", "subscription_footer_trial_description", String(describing: p1), String(describing: p2))
    }
    /// day
    internal static let subscriptionPeriodDay = Localizable.tr("Strings", "subscription_period_day")
    /// days
    internal static let subscriptionPeriodDayPlural = Localizable.tr("Strings", "subscription_period_day_plural")
    /// month
    internal static let subscriptionPeriodMonth = Localizable.tr("Strings", "subscription_period_month")
    /// months
    internal static let subscriptionPeriodMonthPlural = Localizable.tr("Strings", "subscription_period_month_plural")
    /// week
    internal static let subscriptionPeriodWeek = Localizable.tr("Strings", "subscription_period_week")
    /// weeks
    internal static let subscriptionPeriodWeekPlural = Localizable.tr("Strings", "subscription_period_week_plural")
    /// year
    internal static let subscriptionPeriodYear = Localizable.tr("Strings", "subscription_period_year")
    /// years
    internal static let subscriptionPeriodYearPlural = Localizable.tr("Strings", "subscription_period_year_plural")
    /// Thanks for using #reface hashtag
    internal static let subtitleSavedToPhotosHashtag = Localizable.tr("Strings", "subtitle_saved_to_photos_hashtag")
    /// There was a problem with your purchase. Please contact our support.
    internal static let suspiciousSubscriptionAttemptMessage = Localizable.tr("Strings", "suspicious_subscription_attempt_message")
    /// Sorry, we had to delete some of your faces. Please take a selfie or upload a new one from Photos.
    internal static let swapCantReuploadFaceMessage = Localizable.tr("Strings", "swap_cant_reupload_face_message")
    /// Unsupported faces
    internal static let swapCantReuploadFaceTitle = Localizable.tr("Strings", "swap_cant_reupload_face_title")
    /// You exceeded number of face swaps
    internal static let swapLimitExceeded = Localizable.tr("Strings", "swap_limit_exceeded")
    /// Taking longer than usual...
    internal static let takingLongerThenUsual = Localizable.tr("Strings", "taking_longer_then_usual")
    /// TikTok
    internal static let tikTok = Localizable.tr("Strings", "tikTok")
    /// Timeout exceeded
    internal static let timeoutExceeded = Localizable.tr("Strings", "timeout_exceeded")
    /// AD
    internal static let titleAd = Localizable.tr("Strings", "title_ad")
    /// PRO
    internal static let titlePro = Localizable.tr("Strings", "title_pro")
    /// Share Result
    internal static let titleShareResult = Localizable.tr("Strings", "title_share_result")
    /// more than one face was\ndetected
    internal static let tooManyFacesError = Localizable.tr("Strings", "too_many_faces_error")
    /// Too many persons in frame
    internal static let tooManyPersonsError = Localizable.tr("Strings", "too_many_persons_error")
    /// Twitter
    internal static let twitter = Localizable.tr("Strings", "twitter")
    /// Unknown error
    internal static let unknownError = Localizable.tr("Strings", "unknown_error")
    /// Update required
    internal static let updateRequiredError = Localizable.tr("Strings", "update_required_error")
    /// Can't create image
    internal static let uploaderCantCreateImage = Localizable.tr("Strings", "uploader_cant_create_image")
    /// User keypair not acceptable
    internal static let userKeypairNotAcceptable = Localizable.tr("Strings", "user_keypair_not_acceptable")
    /// This video does not exist in the database
    internal static let videoDoesNotExistError = Localizable.tr("Strings", "video_does_not_exist_error")
    /// Could not detect faces
    internal static let videoPersonsEmptyMessage = Localizable.tr("Strings", "video_persons_empty_message")
    /// The video is too large
    internal static let videoTooLargeError = Localizable.tr("Strings", "video_too_large_error")
    /// The video is too long
    internal static let videoTooLongError = Localizable.tr("Strings", "video_too_long_error")
    /// The video is too short
    internal static let videoTooShortError = Localizable.tr("Strings", "video_too_short_error")
    /// Watch ad to reface
    internal static let watchAdsToReface = Localizable.tr("Strings", "watch_ads_to_reface")
    /// WhatsApp
    internal static let whatsapp = Localizable.tr("Strings", "whatsapp")
    internal enum Aitools {
      internal enum Abtest {
        internal enum Overlay {
          /// PRO
          internal static let badge = Localizable.tr("Strings", "aitools.abtest.overlay.badge")
          /// Get PRO
          internal static let button = Localizable.tr("Strings", "aitools.abtest.overlay.button")
          /// Swap face video or photo from your gallery
          internal static let tabTitle = Localizable.tr("Strings", "aitools.abtest.overlay.tabTitle")
          /// Swap face or lipsync animate video or photo from your gallery
          internal static let title = Localizable.tr("Strings", "aitools.abtest.overlay.title")
        }
      }
      internal enum Animate {
        internal enum ReviveAlert {
          /// Try It Now
          internal static let actionTitle = Localizable.tr("Strings", "aitools.animate.revive_alert.action_title")
          /// Try this new tool for animating photo
          internal static let subtitle = Localizable.tr("Strings", "aitools.animate.revive_alert.subtitle")
          /// Revive your photo
          internal static let title = Localizable.tr("Strings", "aitools.animate.revive_alert.title")
        }
      }
      internal enum BannerTitle {
        /// Animate Face
        internal static let animateFace = Localizable.tr("Strings", "aitools.bannerTitle.animateFace")
        /// Swap Faces
        internal static let faceSwap = Localizable.tr("Strings", "aitools.bannerTitle.faceSwap")
        /// Revoice
        internal static let revoice = Localizable.tr("Strings", "aitools.bannerTitle.revoice")
      }
      internal enum NewFeature {
        /// NEW FEATURE
        internal static let title = Localizable.tr("Strings", "aitools.newFeature.title")
      }
    }
    internal enum Animate {
      internal enum Carousel {
        internal enum GalleryHeader {
          /// Gallery
          internal static let galleryButton = Localizable.tr("Strings", "animate.carousel.galleryHeader.galleryButton")
          /// Photos
          internal static let libraryType = Localizable.tr("Strings", "animate.carousel.galleryHeader.libraryType")
          /// Choose photo with face to animate
          internal static let title = Localizable.tr("Strings", "animate.carousel.galleryHeader.title")
        }
      }
      internal enum FaceSelect {
        /// Animate
        internal static let action = Localizable.tr("Strings", "animate.face_select.action")
        /// Choose Faces to Animate
        internal static let title = Localizable.tr("Strings", "animate.face_select.title")
      }
    }
    internal enum App {
      internal enum Spotlight {
        /// ex-Doublicat app
        internal static let desription = Localizable.tr("Strings", "app.spotlight.desription")
        /// Reface: face swap videos
        internal static let title = Localizable.tr("Strings", "app.spotlight.title")
      }
    }
    internal enum Camera {
      /// Retake
      internal static let retake = Localizable.tr("Strings", "camera.retake")
      internal enum Failure {
        internal enum CameraNotAvailable {
          /// The device does not have a camera.
          internal static let subtitle = Localizable.tr("Strings", "camera.failure.cameraNotAvailable.subtitle")
          /// Camera unavailable
          internal static let title = Localizable.tr("Strings", "camera.failure.cameraNotAvailable.title")
        }
        internal enum DeviceSetup {
          /// Device setup error occured
          internal static let title = Localizable.tr("Strings", "camera.failure.deviceSetup.title")
        }
        internal enum NoAccess {
          /// You need to go to settings app and grant acces to the camera device to use it.
          internal static let subtitle = Localizable.tr("Strings", "camera.failure.noAccess.subtitle")
          /// Camera access denied
          internal static let title = Localizable.tr("Strings", "camera.failure.noAccess.title")
        }
        internal enum NoPreset {
          /// Preset not supported
          internal static let title = Localizable.tr("Strings", "camera.failure.noPreset.title")
        }
        internal enum Setup {
          /// I can't take any picture
          internal static let subtitle = Localizable.tr("Strings", "camera.failure.setup.subtitle")
          /// No capture session setup
          internal static let title = Localizable.tr("Strings", "camera.failure.setup.title")
        }
        internal enum VideoNotAvailable {
          /// I can take only picture
          internal static let subtitle = Localizable.tr("Strings", "camera.failure.videoNotAvailable.subtitle")
          /// Capture session output still image
          internal static let title = Localizable.tr("Strings", "camera.failure.videoNotAvailable.title")
        }
      }
      internal enum ImageUploadError {
        internal enum NsfwDetected {
          /// Possible inappropriate content detected
          internal static let title = Localizable.tr("Strings", "camera.image_upload_error.nsfw_detected.title")
        }
      }
    }
    internal enum Common {
      /// Camera
      internal static let camera = Localizable.tr("Strings", "common.camera")
      /// Cancel
      internal static let cancel = Localizable.tr("Strings", "common.cancel")
      /// Continue
      internal static let `continue` = Localizable.tr("Strings", "common.continue")
      /// Done
      internal static let done = Localizable.tr("Strings", "common.done")
      /// Error
      internal static let error = Localizable.tr("Strings", "common.error")
      /// Explore
      internal static let explore = Localizable.tr("Strings", "common.explore")
      /// Faces
      internal static let faces = Localizable.tr("Strings", "common.faces")
      /// Got it!
      internal static let gotIt = Localizable.tr("Strings", "common.got_it")
      /// loading...
      internal static let loading = Localizable.tr("Strings", "common.loading")
      /// Oops.. Couldn’t load\nthe data.
      internal static let loadingError = Localizable.tr("Strings", "common.loading_error")
      /// New
      internal static let new = Localizable.tr("Strings", "common.new")
      /// Next
      internal static let next = Localizable.tr("Strings", "common.next")
      /// Off
      internal static let off = Localizable.tr("Strings", "common.off")
      /// OK
      internal static let ok = Localizable.tr("Strings", "common.ok")
      /// Opening...
      internal static let opening = Localizable.tr("Strings", "common.opening")
      /// Original
      internal static let original = Localizable.tr("Strings", "common.original")
      /// Parameters
      internal static let parameters = Localizable.tr("Strings", "common.parameters")
      /// Photos
      internal static let photos = Localizable.tr("Strings", "common.photos")
      /// Reported
      internal static let reported = Localizable.tr("Strings", "common.reported")
      /// retake photo
      internal static let retakePhoto = Localizable.tr("Strings", "common.retake_photo")
      /// Save
      internal static let save = Localizable.tr("Strings", "common.save")
      /// Save %@%
      internal static func savePercentage(_ p1: Any) -> String {
        return Localizable.tr("Strings", "common.save_percentage", String(describing: p1))
      }
      /// Saved
      internal static let saved = Localizable.tr("Strings", "common.saved")
      /// Sorry
      internal static let sorry = Localizable.tr("Strings", "common.sorry")
      /// try again
      internal static let tryAgain = Localizable.tr("Strings", "common.try_again")
      /// Try Again
      internal static let tryAgainTitle = Localizable.tr("Strings", "common.try_again_title")
      /// Yaaaay!
      internal static let yaay = Localizable.tr("Strings", "common.yaay")
    }
    internal enum CommonGallery {
      /// Recent
      internal static let recents = Localizable.tr("Strings", "common_gallery.recents")
      /// Choose Media
      internal static let title = Localizable.tr("Strings", "common_gallery.title")
      /// Swap Face From Photos
      internal static let titleViewText = Localizable.tr("Strings", "common_gallery.title_view_text")
      /// View All
      internal static let viewAll = Localizable.tr("Strings", "common_gallery.view_all")
      internal enum AllowAccessButton {
        /// Allow Access
        internal static let title = Localizable.tr("Strings", "common_gallery.allow_access_button.title")
      }
      internal enum Camera {
        internal enum CancelButton {
          /// Cancel
          internal static let title = Localizable.tr("Strings", "common_gallery.camera.cancel_button.title")
        }
        internal enum ContinueButton {
          /// Choose
          internal static let title = Localizable.tr("Strings", "common_gallery.camera.continue_button.title")
        }
        internal enum Error {
          /// Something went wrong using your camera. Please, try again.
          internal static let description = Localizable.tr("Strings", "common_gallery.camera.error.description")
          /// Oops
          internal static let title = Localizable.tr("Strings", "common_gallery.camera.error.title")
        }
      }
      internal enum CameraPermissions {
        internal enum Error {
          /// You haven't given permissions to camera.
          internal static let description = Localizable.tr("Strings", "common_gallery.camera_permissions.error.description")
          /// Allow access to camera
          internal static let title = Localizable.tr("Strings", "common_gallery.camera_permissions.error.title")
        }
        internal enum GoToSettings {
          /// Go to Settings
          internal static let title = Localizable.tr("Strings", "common_gallery.camera_permissions.go_to_settings.title")
        }
      }
      internal enum ChangeSettings {
        /// Change Settings
        internal static let title = Localizable.tr("Strings", "common_gallery.change_settings.title")
      }
      internal enum GalleryPermissionsAlert {
        /// To access all of your photos in Reface, allow access to your full library in device settings.
        internal static let description = Localizable.tr("Strings", "common_gallery.gallery_permissions_alert.description")
      }
      internal enum ManagePermission {
        /// You’ve given Reface access to a selected\nnumber of files
        internal static let description = Localizable.tr("Strings", "common_gallery.manage_permission.description")
      }
      internal enum ManagePermissionButton {
        /// Manage
        internal static let title = Localizable.tr("Strings", "common_gallery.manage_permission_button.title")
      }
      internal enum PermissionsDescription {
        /// Allow Reface to access your photo\nlibrary to add from your photos
        internal static let title = Localizable.tr("Strings", "common_gallery.permissions_description.title")
      }
      internal enum SegmentedControl {
        internal enum Gallery {
          /// Gallery
          internal static let title = Localizable.tr("Strings", "common_gallery.segmented_control.gallery.title")
        }
        internal enum Popular {
          /// Popular
          internal static let title = Localizable.tr("Strings", "common_gallery.segmented_control.popular.title")
        }
      }
      internal enum SelectMorePhotos {
        /// Select More Photos
        internal static let title = Localizable.tr("Strings", "common_gallery.select_more_photos.title")
      }
      internal enum UploadError {
        internal enum General {
          /// We are having little issues at the moment, sorry
          internal static let description = Localizable.tr("Strings", "common_gallery.upload_error.general.description")
          /// Oops
          internal static let title = Localizable.tr("Strings", "common_gallery.upload_error.general.title")
        }
        internal enum LoadImageFromGallery {
          /// Your image could not be uploaded
          internal static let description = Localizable.tr("Strings", "common_gallery.upload_error.load_image_from_gallery.description")
          /// Oops
          internal static let title = Localizable.tr("Strings", "common_gallery.upload_error.load_image_from_gallery.title")
        }
        internal enum NoFaces {
          /// Could not detect faces on this image
          internal static let title = Localizable.tr("Strings", "common_gallery.upload_error.no_faces.title")
        }
        internal enum NsfwAccountBlocked {
          /// Sorry to inform you we’ve blocked your account due to numerous instances of possible inappropriate content detection. Contact us if you think we made a mistake.
          internal static let message = Localizable.tr("Strings", "common_gallery.upload_error.nsfw_account_blocked.message")
          /// Account blocked
          internal static let title = Localizable.tr("Strings", "common_gallery.upload_error.nsfw_account_blocked.title")
        }
        internal enum NsfwBlocked {
          /// We restrict inappropriate content to protect our community (check section 6 of the Terms of use). In case of more violations, we may have to block your ability to reface your own content. Contact us if you think we made a mistake.
          internal static let description = Localizable.tr("Strings", "common_gallery.upload_error.nsfw_blocked.description")
          /// Possible inappropriate content blocked
          internal static let title = Localizable.tr("Strings", "common_gallery.upload_error.nsfw_blocked.title")
        }
        internal enum NsfwDetected {
          /// Please be aware that we restrict inappropriate content to protect our community (check section 6 of the Terms of use).
          internal static let description = Localizable.tr("Strings", "common_gallery.upload_error.nsfw_detected.description")
          /// Possible inappropriate content detected
          internal static let title = Localizable.tr("Strings", "common_gallery.upload_error.nsfw_detected.title")
        }
      }
    }
    internal enum Content {
      internal enum AssetFailed {
        /// Unable to select this Asset
        internal static let description = Localizable.tr("Strings", "content.asset_failed.description")
        /// Failed with Asset
        internal static let title = Localizable.tr("Strings", "content.asset_failed.title")
      }
      internal enum UnknownMedia {
        /// Please, select video, picture media type
        internal static let description = Localizable.tr("Strings", "content.unknown_media.description")
        /// Unknown media format
        internal static let title = Localizable.tr("Strings", "content.unknown_media.title")
      }
      internal enum Validation {
        internal enum ImageNoFaceDetected {
          /// 
          internal static let description = Localizable.tr("Strings", "content.validation.image_no_face_detected.description")
          /// Could not detect faces on this image
          internal static let title = Localizable.tr("Strings", "content.validation.image_no_face_detected.title")
        }
        internal enum ResctrictedContentBlocked {
          /// We restrict inappropriate content to protect our community (check section 6 of the Terms of use). In case of more violations, we may have to block your ability to use Reface editor.
          internal static let description = Localizable.tr("Strings", "content.validation.resctricted_content_blocked.description")
          /// Possible inappropriate content blocked
          internal static let title = Localizable.tr("Strings", "content.validation.resctricted_content_blocked.title")
        }
        internal enum ResctrictedContentDetected {
          /// Please be aware that we restrict inappropriate content to protect our community (check section 6 of the Terms of use).
          internal static let description = Localizable.tr("Strings", "content.validation.resctricted_content_detected.description")
          /// Possible inappropriate content detected
          internal static let title = Localizable.tr("Strings", "content.validation.resctricted_content_detected.title")
        }
        internal enum VideoNoFaceDetected {
          /// 
          internal static let description = Localizable.tr("Strings", "content.validation.video_no_face_detected.description")
          /// Could not detect faces on this video
          internal static let title = Localizable.tr("Strings", "content.validation.video_no_face_detected.title")
        }
      }
    }
    internal enum ContentPicker {
      internal enum Permission {
        /// Allow Reface to access your photo\nlibrary to choose from your photos or videos
        internal static let description = Localizable.tr("Strings", "content_picker.permission.description")
        /// Allow access to Gallery
        internal static let title = Localizable.tr("Strings", "content_picker.permission.title")
      }
    }
    internal enum ContentUpload {
      internal enum Image {
        internal enum Error {
          internal enum NoFaces {
            /// Could not detect faces on this image
            internal static let title = Localizable.tr("Strings", "content_upload.image.error.no_faces.title")
          }
        }
      }
      internal enum Video {
        internal enum Error {
          internal enum NoFaces {
            /// Could not detect faces on this video
            internal static let title = Localizable.tr("Strings", "content_upload.video.error.no_faces.title")
          }
        }
      }
    }
    internal enum Date {
      /// Annual
      internal static let annual = Localizable.tr("Strings", "date.annual")
      /// %d month
      internal static func monthSingular(_ p1: Int) -> String {
        return Localizable.tr("Strings", "date.month_singular", p1)
      }
      /// Monthly
      internal static let monthly = Localizable.tr("Strings", "date.monthly")
      /// Weekly
      internal static let weekly = Localizable.tr("Strings", "date.weekly")
    }
    internal enum DebugSettings {
      internal enum CorruptAuthToken {
        /// Auth token is corrupted
        internal static let alert = Localizable.tr("Strings", "debug_settings.corrupt_auth_token.alert")
        /// Corrupt auth token
        internal static let title = Localizable.tr("Strings", "debug_settings.corrupt_auth_token.title")
      }
      internal enum Logout {
        /// Logout
        internal static let title = Localizable.tr("Strings", "debug_settings.logout.title")
        internal enum LoggedIn {
          /// logged in
          internal static let title = Localizable.tr("Strings", "debug_settings.logout.logged_in.title")
        }
        internal enum LoggedOut {
          /// logged out
          internal static let title = Localizable.tr("Strings", "debug_settings.logout.logged_out.title")
        }
      }
      internal enum RemoteConfig {
        /// Remote config
        internal static let title = Localizable.tr("Strings", "debug_settings.remote_config.title")
        internal enum SearchBar {
          /// Filter
          internal static let title = Localizable.tr("Strings", "debug_settings.remote_config.search_bar.title")
        }
      }
    }
    internal enum Diffusion {
      internal enum Gallery {
        /// Select %@ photos
        internal static func shortTitle(_ p1: Any) -> String {
          return Localizable.tr("Strings", "diffusion.gallery.short_title", String(describing: p1))
        }
        /// Step 1 - Choose Your %@ Photos
        internal static func title(_ p1: Any) -> String {
          return Localizable.tr("Strings", "diffusion.gallery.title", String(describing: p1))
        }
        internal enum ContinueButton {
          /// Select Photos
          internal static let disabledTitle = Localizable.tr("Strings", "diffusion.gallery.continueButton.disabledTitle")
          /// Continue
          internal static let enabledTitle = Localizable.tr("Strings", "diffusion.gallery.continueButton.enabledTitle")
        }
        internal enum OneShot {
          /// Upload 1 Portrait Photo
          internal static let title = Localizable.tr("Strings", "diffusion.gallery.one_shot.title")
          internal enum Subtitle {
            /// Full-face, neutral photo; Face clearly\nvisible; No glasses; Single person only
            internal static let body = Localizable.tr("Strings", "diffusion.gallery.one_shot.subtitle.body")
            /// Tips for better results:\n
            internal static let header = Localizable.tr("Strings", "diffusion.gallery.one_shot.subtitle.header")
          }
        }
        internal enum Picker {
          /// Gallery
          internal static let galleryButton = Localizable.tr("Strings", "diffusion.gallery.picker.galleryButton")
          /// Recent Photos
          internal static let title = Localizable.tr("Strings", "diffusion.gallery.picker.title")
          /// View All
          internal static let viewAll = Localizable.tr("Strings", "diffusion.gallery.picker.view_all")
          internal enum LimitedAccess {
            /// Manage
            internal static let action = Localizable.tr("Strings", "diffusion.gallery.picker.limited_access.action")
            /// You’ve given Reface access to a selected number of photos
            internal static let title = Localizable.tr("Strings", "diffusion.gallery.picker.limited_access.title")
          }
        }
        internal enum SelectedPhotos {
          /// Choose %@ portrait photos of same person (different poses, emotions, clothing, backgrounds)
          internal static func title(_ p1: Any) -> String {
            return Localizable.tr("Strings", "diffusion.gallery.selectedPhotos.title", String(describing: p1))
          }
          /// To change a photo:\nRemove the current photo and replace it
          internal static let tooltip = Localizable.tr("Strings", "diffusion.gallery.selectedPhotos.tooltip")
        }
      }
      internal enum Gender {
        /// 👩 Female
        internal static let female = Localizable.tr("Strings", "diffusion.gender.female")
        /// 👨 Male
        internal static let male = Localizable.tr("Strings", "diffusion.gender.male")
        /// Not available for this style
        internal static let notAvailable = Localizable.tr("Strings", "diffusion.gender.not_available")
        /// 🧑 Other
        internal static let other = Localizable.tr("Strings", "diffusion.gender.other")
        /// 🐶 Pet
        internal static let pet = Localizable.tr("Strings", "diffusion.gender.pet")
        /// Step 1 of 2
        internal static let step = Localizable.tr("Strings", "diffusion.gender.step")
        internal enum NotAvailableAlert {
          /// Try to choose another style
          internal static let subtitle = Localizable.tr("Strings", "diffusion.gender.not_available_alert.subtitle")
          /// Gender from your recently used photos is not available for this style.
          internal static let title = Localizable.tr("Strings", "diffusion.gender.not_available_alert.title")
        }
        internal enum Photos {
          /// Who is on photos?
          internal static let title = Localizable.tr("Strings", "diffusion.gender.photos.title")
        }
        internal enum Style {
          /// Choose gender
          internal static let title = Localizable.tr("Strings", "diffusion.gender.style.title")
        }
      }
      internal enum NewTips {
        /// Select 6 photos
        internal static let action = Localizable.tr("Strings", "diffusion.new_tips.action")
        /// Do not select duplicate photos, group photos, full body photos or photos with hands near face.
        internal static let subtitle = Localizable.tr("Strings", "diffusion.new_tips.subtitle")
        /// Add 6 Photos of a Person With This Tips
        internal static let title = Localizable.tr("Strings", "diffusion.new_tips.title")
        internal enum Features {
          /// Varied face angles
          internal static let angle = Localizable.tr("Strings", "diffusion.new_tips.features.angle")
          /// Different backgrounds
          internal static let background = Localizable.tr("Strings", "diffusion.new_tips.features.background")
          /// Various lighting
          internal static let lightning = Localizable.tr("Strings", "diffusion.new_tips.features.lightning")
        }
      }
      internal enum Paywall {
        /// Generate Avatars
        internal static let generatePack = Localizable.tr("Strings", "diffusion.paywall.generate_pack")
        /// Generate for
        internal static let mainButton = Localizable.tr("Strings", "diffusion.paywall.mainButton")
        /// Privacy Policy
        internal static let privacyPolicy = Localizable.tr("Strings", "diffusion.paywall.privacy_policy")
        /// Terms of Use
        internal static let termsOfUse = Localizable.tr("Strings", "diffusion.paywall.terms_of_use")
        /// Generate 48 Avatars
        internal static let title = Localizable.tr("Strings", "diffusion.paywall.title")
      }
      internal enum PhotosUpload {
        /// Creating diffusion
        internal static let creatingDiffusion = Localizable.tr("Strings", "diffusion.photosUpload.creating_diffusion")
        /// Importing your photos...
        internal static let description = Localizable.tr("Strings", "diffusion.photosUpload.description")
        internal enum Failure {
          /// Change Photos
          internal static let changePhotos = Localizable.tr("Strings", "diffusion.photosUpload.failure.changePhotos")
          /// Some of selected photos can’t be imported. Please select another photos and try again.
          internal static let description = Localizable.tr("Strings", "diffusion.photosUpload.failure.description")
          /// Failed to import photo
          internal static let title = Localizable.tr("Strings", "diffusion.photosUpload.failure.title")
          /// Try Again
          internal static let tryAgain = Localizable.tr("Strings", "diffusion.photosUpload.failure.tryAgain")
        }
      }
      internal enum Preview {
        /// Style Packs
        internal static let chooseStyle = Localizable.tr("Strings", "diffusion.preview.choose_style")
        /// Theme Packs
        internal static let chooseThemepack = Localizable.tr("Strings", "diffusion.preview.choose_themepack")
        /// One pack - many styles
        internal static let chooseThemepackHeader = Localizable.tr("Strings", "diffusion.preview.choose_themepack_header")
        /// Generate your neural avatars\njust in a few steps
        internal static let description = Localizable.tr("Strings", "diffusion.preview.description")
        /// %@ Purchased
        internal static func free(_ p1: Any) -> String {
          return Localizable.tr("Strings", "diffusion.preview.free", String(describing: p1))
        }
        /// NEW
        internal static let headerNew = Localizable.tr("Strings", "diffusion.preview.header_new")
        /// See All
        internal static let seeAll = Localizable.tr("Strings", "diffusion.preview.see_all")
        /// Generate 48 avatars with your face and see yourself as never before
        internal static let subtitle = Localizable.tr("Strings", "diffusion.preview.subtitle")
        /// AI Avatar
        internal static let title = Localizable.tr("Strings", "diffusion.preview.title")
        /// How it Works?
        internal static let tooltip = Localizable.tr("Strings", "diffusion.preview.tooltip")
        /// Recently generated
        internal static let userCollections = Localizable.tr("Strings", "diffusion.preview.user_collections")
      }
      internal enum Processing {
        /// Almost ready
        internal static let almostReady = Localizable.tr("Strings", "diffusion.processing.almost_ready")
        /// Analyzing photos
        internal static let analyzingPhotos = Localizable.tr("Strings", "diffusion.processing.analyzing_photos")
        /// Applying art style
        internal static let applyingStyle = Localizable.tr("Strings", "diffusion.processing.applying_style")
        /// Contact Support
        internal static let contactSupport = Localizable.tr("Strings", "diffusion.processing.contact_support")
        /// Something went wrong while generating avatars. Contact support to resolve the issue.
        internal static let failedSubtitle = Localizable.tr("Strings", "diffusion.processing.failed_subtitle")
        /// Generation failed 😞
        internal static let failedTitle = Localizable.tr("Strings", "diffusion.processing.failed_title")
        /// Generating your AI model
        internal static let generatingModel = Localizable.tr("Strings", "diffusion.processing.generating_model")
        /// Next attempts will be way faster 😌️
        internal static let nextAttempts = Localizable.tr("Strings", "diffusion.processing.next_attempts")
        /// Notify Me When It's Ready
        internal static let notifyWhenReady = Localizable.tr("Strings", "diffusion.processing.notify_when_ready")
        /// Preparing your avatars
        internal static let preparingAvatars = Localizable.tr("Strings", "diffusion.processing.preparing_avatars")
        /// Congrats 🎉\nYour avatars are ready!
        internal static let resultReady = Localizable.tr("Strings", "diffusion.processing.result_ready")
        /// View Result
        internal static let viewResult = Localizable.tr("Strings", "diffusion.processing.view_result")
        /// We'll notify you when it's ready
        internal static let weWillNotifyYou = Localizable.tr("Strings", "diffusion.processing.we_will_notify_you")
        /// Your pack is ready in about:
        internal static let yourPackIsReadyIn = Localizable.tr("Strings", "diffusion.processing.your_pack_is_ready_in")
      }
      internal enum ProcessingPreview {
        /// My Avatars
        internal static let avatars = Localizable.tr("Strings", "diffusion.processing_preview.avatars")
        /// Choose from the options below!
        internal static let chooseStyles = Localizable.tr("Strings", "diffusion.processing_preview.choose_styles")
        /// Got it
        internal static let gotIt = Localizable.tr("Strings", "diffusion.processing_preview.gotIt")
        /// %@ packs
        internal static func packMultiple(_ p1: Any) -> String {
          return Localizable.tr("Strings", "diffusion.processing_preview.pack_multiple", String(describing: p1))
        }
        /// %@ pack
        internal static func packSingle(_ p1: Any) -> String {
          return Localizable.tr("Strings", "diffusion.processing_preview.pack_single", String(describing: p1))
        }
        /// You have purchased
        internal static let purchasesLeft = Localizable.tr("Strings", "diffusion.processing_preview.purchases_left")
        /// Support
        internal static let support = Localizable.tr("Strings", "diffusion.processing_preview.support")
        /// Theme
        internal static let theme = Localizable.tr("Strings", "diffusion.processing_preview.theme")
        /// %.0f min
        internal static func timeRemaining(_ p1: Float) -> String {
          return Localizable.tr("Strings", "diffusion.processing_preview.time_remaining", p1)
        }
        /// View
        internal static let view = Localizable.tr("Strings", "diffusion.processing_preview.view")
        /// View All
        internal static let viewAll = Localizable.tr("Strings", "diffusion.processing_preview.view_all")
      }
      internal enum Regenerate {
        /// What photos should be used to generate avatars?
        internal static let subtitle = Localizable.tr("Strings", "diffusion.regenerate.subtitle")
        /// Choose Photos
        internal static let title = Localizable.tr("Strings", "diffusion.regenerate.title")
        internal enum Button {
          /// Estimated generation time: ~%@m
          internal static func estimation(_ p1: Any) -> String {
            return Localizable.tr("Strings", "diffusion.regenerate.button.estimation", String(describing: p1))
          }
          /// expire %@
          internal static func expire(_ p1: Any) -> String {
            return Localizable.tr("Strings", "diffusion.regenerate.button.expire", String(describing: p1))
          }
          internal enum New {
            /// Add New Photos
            internal static let title = Localizable.tr("Strings", "diffusion.regenerate.button.new.title")
          }
          internal enum Recent {
            /// Use Recent Photos
            internal static let title = Localizable.tr("Strings", "diffusion.regenerate.button.recent.title")
          }
        }
      }
      internal enum ResultOverview {
        ///   Download
        internal static let download = Localizable.tr("Strings", "diffusion.result_overview.download")
        /// Save All
        internal static let downloadAll = Localizable.tr("Strings", "diffusion.result_overview.download_all")
        /// Save Avatars (%@)
        internal static func downloadSelected(_ p1: Any) -> String {
          return Localizable.tr("Strings", "diffusion.result_overview.download_selected", String(describing: p1))
        }
        /// Saving Avatars
        internal static let downloading = Localizable.tr("Strings", "diffusion.result_overview.downloading")
        /// You Might Also Like These Styles
        internal static let moreStyles = Localizable.tr("Strings", "diffusion.result_overview.more_styles")
        /// Select
        internal static let selectionEnable = Localizable.tr("Strings", "diffusion.result_overview.selection_enable")
        /// Select Avatars
        internal static let selectionEnabled = Localizable.tr("Strings", "diffusion.result_overview.selection_enabled")
        /// Stay here to see the results
        internal static let stayHere = Localizable.tr("Strings", "diffusion.result_overview.stay_here")
        /// Theme Pack
        internal static let themePacksTitle = Localizable.tr("Strings", "diffusion.result_overview.theme_packs_title")
        internal enum Available {
          /// Avatars will be available till %@ \nMake sure to download them
          internal static func title(_ p1: Any) -> String {
            return Localizable.tr("Strings", "diffusion.result_overview.available.title", String(describing: p1))
          }
        }
      }
      internal enum ResultPreview {
        internal enum Download {
          /// All %@ Selected
          internal static func all(_ p1: Any) -> String {
            return Localizable.tr("Strings", "diffusion.result_preview.download.all", String(describing: p1))
          }
          /// Only This One
          internal static let single = Localizable.tr("Strings", "diffusion.result_preview.download.single")
          /// Save Avatars?
          internal static let title = Localizable.tr("Strings", "diffusion.result_preview.download.title")
        }
      }
      internal enum SaveSuccess {
        /// %@ images saved to Photos
        internal static func multiple(_ p1: Any) -> String {
          return Localizable.tr("Strings", "diffusion.save_success.multiple", String(describing: p1))
        }
        /// Saved to Photos
        internal static let single = Localizable.tr("Strings", "diffusion.save_success.single")
      }
      internal enum Tips {
        /// Ignoring these tips may provide weird and bad results
        internal static let bottomDescription = Localizable.tr("Strings", "diffusion.tips.bottomDescription")
        /// Add Photos
        internal static let buttonTitle = Localizable.tr("Strings", "diffusion.tips.buttonTitle")
        /// Tips For Best Results
        internal static let navigationTitle = Localizable.tr("Strings", "diffusion.tips.navigationTitle")
        /// With shoulders, different backgrounds, clothing, emotions, head angles
        internal static let tipOneSubtitle = Localizable.tr("Strings", "diffusion.tips.tipOneSubtitle")
        /// Pick %@ photos of same person
        internal static func tipOneTitle(_ p1: Any) -> String {
          return Localizable.tr("Strings", "diffusion.tips.tipOneTitle", String(describing: p1))
        }
        /// No similar photos, nudes, full body, group photos, with pets, head accessories
        internal static let tipThreeSubtitle = Localizable.tr("Strings", "diffusion.tips.tipThreeSubtitle")
        /// Not these types of photo
        internal static let tipThreeTitle = Localizable.tr("Strings", "diffusion.tips.tipThreeTitle")
        /// Different head poses for better result
        internal static let tipTwoSubtitle = Localizable.tr("Strings", "diffusion.tips.tipTwoSubtitle")
        /// Take %@ selfies of same person
        internal static func tipTwoTitle(_ p1: Any) -> String {
          return Localizable.tr("Strings", "diffusion.tips.tipTwoTitle", String(describing: p1))
        }
      }
      internal enum UserCollections {
        /// Recently generated
        internal static let title = Localizable.tr("Strings", "diffusion.user_collections.title")
      }
    }
    internal enum EmbeddingsUpdate {
      internal enum AcceptSwitch {
        /// I've read and agree with the above
        internal static let title = Localizable.tr("Strings", "embeddings_update.accept_switch.title")
      }
      internal enum DescriptionText {
        /// Hi.;Why?;Your data helps:;For how long?;We value your privacy!;Keep Refacing!;
        internal static let highlightedWords = Localizable.tr("Strings", "embeddings_update.description_text.highlighted_words")
      }
      internal enum DescriptionTextView {
        /// Hi. Please, be so kind as to give NeoCortext, Inc. permission to collect your biometric data contained in a photo by clicking “I've read and agree with the above”.\n\nWhy? Biometric data helps us become a better version of ourselves for you.\n\nYour data helps:\n\n  • Identify your facial geometry for mapping your face onto another face or generating unique content with AI algorithms;\n  • Enhance the safety and security of users of our app and services;\n  • Improve our app and services;\n  • Provide you with an effective customer support.\n\nFor how long? We’ll keep your data for three (3) years since the date you provide it.\n\nWe do not transfer biometric information to anyone other than our service providers, unless we are required to do so by applicable laws, rules, regulations, ordinances, court or regulator orders or pursuant to a valid warrant or subpoena, and we do not sell any of your biometric information.\n\nWe value your privacy!\n\nCheck out our Privacy Notice for more details about our data practices.\n\nThank you! Keep Refacing!
        internal static let text = Localizable.tr("Strings", "embeddings_update.description_text_view.text")
      }
      internal enum TitleLabel {
        /// We gather your data,\nbut it’s okay
        internal static let title = Localizable.tr("Strings", "embeddings_update.title_label.title")
      }
    }
    internal enum Error {
      /// 😭
      internal static let alertTitle = Localizable.tr("Strings", "error.alert_title")
      internal enum ImageUpload {
        internal enum TooManyFaces {
          /// Please, choose image with one face.
          internal static let description = Localizable.tr("Strings", "error.image_upload.too_many_faces.description")
          /// There are too many faces on the image
          internal static let title = Localizable.tr("Strings", "error.image_upload.too_many_faces.title")
        }
      }
      internal enum PhotoUpload {
        internal enum TooManyFaces {
          /// Please, make photo with one face.
          internal static let description = Localizable.tr("Strings", "error.photo_upload.too_many_faces.description")
          /// There are too many faces on the photo
          internal static let title = Localizable.tr("Strings", "error.photo_upload.too_many_faces.title")
        }
      }
      internal enum Swap {
        /// Face original image not found
        internal static let faceOriginalNotFound = Localizable.tr("Strings", "error.swap.face_original_not_found")
        /// No faces found
        internal static let noFacesOnUploadedImage = Localizable.tr("Strings", "error.swap.no_faces_on_uploaded_image")
        /// Sorry, we had to delete some of your faces. Please take a selfie or upload a new one from Photos.
        internal static let oldFacesRemoved = Localizable.tr("Strings", "error.swap.old_faces_removed")
      }
      internal enum Upload {
        /// Downloaded file url is nil; no error returned from Alamofire.
        internal static let unknownError = Localizable.tr("Strings", "error.upload.unknown_error")
      }
    }
    internal enum FacePlacement {
      internal enum ActionButton {
        /// Place Face
        internal static let title = Localizable.tr("Strings", "face_placement.action_button.title")
      }
      internal enum AddFaceTooltip {
        /// Add a face to place it on image
        internal static let title = Localizable.tr("Strings", "face_placement.add_face_tooltip.title")
      }
      internal enum Assets {
        /// Choose Image
        internal static let navigationTitle = Localizable.tr("Strings", "face_placement.assets.navigation_title")
      }
      internal enum Editor {
        /// Change Position
        internal static let navigationTitle = Localizable.tr("Strings", "face_placement.editor.navigation_title")
        /// Next
        internal static let next = Localizable.tr("Strings", "face_placement.editor.next")
      }
      internal enum Error {
        internal enum UnableProcessTempImage {
          /// Unable process temp image
          internal static let description = Localizable.tr("Strings", "face_placement.error.unable_process_temp_image.description")
        }
      }
      internal enum MoveAndRotateTooltip {
        /// Drag to move\nUse two fingers to scale or rotate
        internal static let title = Localizable.tr("Strings", "face_placement.move_and_rotate_tooltip.title")
      }
      internal enum Processing {
        /// Placing Face...
        internal static let title = Localizable.tr("Strings", "face_placement.processing.title")
      }
    }
    internal enum FaceSwap {
      internal enum Result {
        /// Result
        internal static let title = Localizable.tr("Strings", "face_swap.result.title")
      }
    }
    internal enum FaceTag {
      /// Brother
      internal static let brother = Localizable.tr("Strings", "face_tag.brother")
      /// Colleague
      internal static let colleague = Localizable.tr("Strings", "face_tag.colleague")
      /// Dad
      internal static let dad = Localizable.tr("Strings", "face_tag.dad")
      /// Friend
      internal static let friend = Localizable.tr("Strings", "face_tag.friend")
      /// Kid
      internal static let kid = Localizable.tr("Strings", "face_tag.kid")
      /// Me
      internal static let me = Localizable.tr("Strings", "face_tag.me")
      /// Mom
      internal static let mom = Localizable.tr("Strings", "face_tag.mom")
      /// Other
      internal static let other = Localizable.tr("Strings", "face_tag.other")
      /// Partner
      internal static let partner = Localizable.tr("Strings", "face_tag.partner")
      /// Sister
      internal static let sister = Localizable.tr("Strings", "face_tag.sister")
    }
    internal enum Facepicker {
      /// Add Face
      internal static let addFace = Localizable.tr("Strings", "facepicker.add_face")
      /// Are you sure you want to delete this face?
      internal static let deletionPopup = Localizable.tr("Strings", "facepicker.deletion_popup")
      /// Face Deleted
      internal static let deletionToast = Localizable.tr("Strings", "facepicker.deletion_toast")
      /// No Title
      internal static let noTag = Localizable.tr("Strings", "facepicker.no_tag")
      /// Original
      internal static let originalFace = Localizable.tr("Strings", "facepicker.original_face")
      internal enum Button {
        /// Done
        internal static let done = Localizable.tr("Strings", "facepicker.button.done")
        /// Edit faces
        internal static let edit = Localizable.tr("Strings", "facepicker.button.edit")
      }
      internal enum Menu {
        /// Delete
        internal static let delete = Localizable.tr("Strings", "facepicker.menu.delete")
        /// Edit Title
        internal static let edit = Localizable.tr("Strings", "facepicker.menu.edit")
      }
      internal enum TagSelector {
        /// Brother’s
        internal static let brothers = Localizable.tr("Strings", "facepicker.tag_selector.brothers")
        /// Colleague’s
        internal static let colleagues = Localizable.tr("Strings", "facepicker.tag_selector.colleagues")
        /// Dad’s
        internal static let dads = Localizable.tr("Strings", "facepicker.tag_selector.dads")
        /// This will help us to recommend more relevant content to you.
        internal static let description = Localizable.tr("Strings", "facepicker.tag_selector.description")
        /// Friend’s
        internal static let friends = Localizable.tr("Strings", "facepicker.tag_selector.friends")
        /// Kid’s
        internal static let kids = Localizable.tr("Strings", "facepicker.tag_selector.kids")
        /// Mom’s
        internal static let moms = Localizable.tr("Strings", "facepicker.tag_selector.moms")
        /// My
        internal static let my = Localizable.tr("Strings", "facepicker.tag_selector.my")
        /// Other’s
        internal static let others = Localizable.tr("Strings", "facepicker.tag_selector.others")
        /// Partner’s
        internal static let parents = Localizable.tr("Strings", "facepicker.tag_selector.parents")
        /// Sister’s
        internal static let sisters = Localizable.tr("Strings", "facepicker.tag_selector.sisters")
        /// Choose whose face it is
        internal static let title = Localizable.tr("Strings", "facepicker.tag_selector.title")
      }
      internal enum Title {
        /// Choose face
        internal static let `default` = Localizable.tr("Strings", "facepicker.title.default")
        /// Choose face to edit
        internal static let edit = Localizable.tr("Strings", "facepicker.title.edit")
        /// Faces
        internal static let settings = Localizable.tr("Strings", "facepicker.title.settings")
      }
    }
    internal enum ForbiddenRegion {
      /// Contact Support
      internal static let contactSupport = Localizable.tr("Strings", "forbiddenRegion.contactSupport")
      /// Download App
      internal static let downloadApp = Localizable.tr("Strings", "forbiddenRegion.downloadApp")
      /// Region Unavailable
      internal static let headerSubtitle = Localizable.tr("Strings", "forbiddenRegion.headerSubtitle")
      /// Sorry, this app isn't available in your region
      internal static let headerTitle = Localizable.tr("Strings", "forbiddenRegion.headerTitle")
      /// Explore more AI possibilities for content creation like never before!
      internal static let subtitleFree = Localizable.tr("Strings", "forbiddenRegion.subtitleFree")
      /// or reach out to support team for other options
      internal static let subtitlePro = Localizable.tr("Strings", "forbiddenRegion.subtitlePro")
      /// Try our new app Restyle
      internal static let titleFree = Localizable.tr("Strings", "forbiddenRegion.titleFree")
      /// Get promo code for our new app Restyle
      internal static let titlePro = Localizable.tr("Strings", "forbiddenRegion.titlePro")
    }
    internal enum ForceUpdate {
      /// No, thanks
      internal static let cancel = Localizable.tr("Strings", "force_update.cancel")
      /// Get updates
      internal static let getUpdates = Localizable.tr("Strings", "force_update.get_updates")
      /// Get more content and new features with our last update
      internal static let subtitle = Localizable.tr("Strings", "force_update.subtitle")
      /// Update available
      internal static let title = Localizable.tr("Strings", "force_update.title")
    }
    internal enum Gallery {
      /// Gallery
      internal static let galleryButton = Localizable.tr("Strings", "gallery.gallery_button")
      internal enum AllowPermission {
        internal enum Photo {
          /// Allow Reface to access your photo\nlibrary to choose from your photos
          internal static let description = Localizable.tr("Strings", "gallery.allow_permission.photo.description")
        }
      }
      internal enum GrantAccess {
        /// Allow Access
        internal static let button = Localizable.tr("Strings", "gallery.grantAccess.button")
        /// Allow Reface to access your photo library to choose from photos
        internal static let title = Localizable.tr("Strings", "gallery.grantAccess.title")
      }
    }
    internal enum GifConvert {
      /// Use As Photo
      internal static let action = Localizable.tr("Strings", "gif_convert.action")
      /// Your GIF needs to be changed into a picture to continue
      internal static let subtitle = Localizable.tr("Strings", "gif_convert.subtitle")
      /// Change GIF to Photo?
      internal static let title = Localizable.tr("Strings", "gif_convert.title")
    }
    internal enum Home {
      /// PRO
      internal static let pro = Localizable.tr("Strings", "home.pro")
      /// reface
      internal static let title = Localizable.tr("Strings", "home.title")
      internal enum AnimateFace {
        /// Use
        internal static let use = Localizable.tr("Strings", "home.animateFace.use")
      }
      internal enum Main {
        internal enum InvalidContent {
          /// Can't open this content
          internal static let title = Localizable.tr("Strings", "home.main.invalid_content.title")
        }
      }
      internal enum ReviveBanner {
        /// Choose a song to animate your photo
        internal static let subtitle = Localizable.tr("Strings", "home.revive_banner.subtitle")
        /// Make your photo sing!
        internal static let title = Localizable.tr("Strings", "home.revive_banner.title")
      }
      internal enum Section {
        /// Swap Face
        internal static let swapFace = Localizable.tr("Strings", "home.section.swap_face")
      }
      internal enum SectionHeader {
        internal enum First {
          /// For You
          internal static let title = Localizable.tr("Strings", "home.section_header.first.title")
        }
        internal enum SeeAll {
          /// See All
          internal static let title = Localizable.tr("Strings", "home.section_header.see_all.title")
        }
      }
    }
    internal enum IntroNew {
      /// Welcome to Reface
      internal static let welcome = Localizable.tr("Strings", "intro_new.welcome")
    }
    internal enum LipSync {
      internal enum ActionButton {
        /// Sync Lips
        internal static let title = Localizable.tr("Strings", "lip_sync.action_button.title")
      }
      internal enum Error {
        /// Oops, something went wrong. Please try again.
        internal static let message = Localizable.tr("Strings", "lip_sync.error.message")
        /// Error
        internal static let title = Localizable.tr("Strings", "lip_sync.error.title")
      }
      internal enum FacePicker {
        internal enum BottomControls {
          /// See All
          internal static let seeAll = Localizable.tr("Strings", "lip_sync.face_picker.bottom_controls.see_all")
          /// Choose or record phrase
          internal static let title = Localizable.tr("Strings", "lip_sync.face_picker.bottom_controls.title")
          internal enum DeleteButton {
            /// Delete
            internal static let title = Localizable.tr("Strings", "lip_sync.face_picker.bottom_controls.delete_button.title")
          }
        }
        internal enum NavigationBar {
          /// Record Voice
          internal static let title = Localizable.tr("Strings", "lip_sync.face_picker.navigation_bar.title")
        }
        internal enum SeeAll {
          /// Choose Phrase
          internal static let title = Localizable.tr("Strings", "lip_sync.face_picker.see_all.title")
          internal enum Failed {
            internal enum CouldNotLoad {
              /// Couldn’t load more phrase
              internal static let title = Localizable.tr("Strings", "lip_sync.face_picker.see_all.failed.could_not_load.title")
            }
          }
        }
        internal enum UnableToStartPlaybackError {
          /// Some playback problem has occured. Record the audio again
          internal static let message = Localizable.tr("Strings", "lip_sync.face_picker.unable_to_start_playback_error.message")
          /// Error
          internal static let title = Localizable.tr("Strings", "lip_sync.face_picker.unable_to_start_playback_error.title")
        }
        internal enum UnableToStartRecordingError {
          /// Some recording problem has occured. Record the audio again
          internal static let message = Localizable.tr("Strings", "lip_sync.face_picker.unable_to_start_recording_error.message")
          /// Error
          internal static let title = Localizable.tr("Strings", "lip_sync.face_picker.unable_to_start_recording_error.title")
        }
      }
      internal enum Loading {
        /// Loading...
        internal static let title = Localizable.tr("Strings", "lip_sync.loading.title")
      }
      internal enum PermissionSettingsPopup {
        /// Reface would like to access your microphone to record your voice and sync it with the lips on content.
        internal static let message = Localizable.tr("Strings", "lip_sync.permission_settings_popup.message")
        /// “Reface” Would Like to Access the Microphone
        internal static let title = Localizable.tr("Strings", "lip_sync.permission_settings_popup.title")
      }
      internal enum Processing {
        /// Syncing Lips...
        internal static let title = Localizable.tr("Strings", "lip_sync.processing.title")
      }
      internal enum Result {
        /// Result
        internal static let title = Localizable.tr("Strings", "lip_sync.result.title")
      }
      internal enum Search {
        internal enum NavigationBar {
          /// Choose Content
          internal static let title = Localizable.tr("Strings", "lip_sync.search.navigation_bar.title")
        }
      }
    }
    internal enum NewRefaceResult {
      internal enum Action {
        /// Change
        internal static let changeFace = Localizable.tr("Strings", "new_reface_result.action.change_face")
        /// Watermark
        internal static let removeWatermark = Localizable.tr("Strings", "new_reface_result.action.remove_watermark")
      }
    }
    internal enum Onboarding {
      internal enum LipSync {
        /// Continue
        internal static let buttonTitle = Localizable.tr("Strings", "onboarding.lip_sync.button_title")
        /// ✨ New Feature
        internal static let subtitle = Localizable.tr("Strings", "onboarding.lip_sync.subtitle")
        /// Make Faces Talk With\nYour Voice
        internal static let title = Localizable.tr("Strings", "onboarding.lip_sync.title")
      }
    }
    internal enum OnboardingInterests {
      /// Get personalized recommendations
      internal static let description = Localizable.tr("Strings", "onboarding_interests.description")
      /// Choose your\ninterests
      internal static let header = Localizable.tr("Strings", "onboarding_interests.header")
      internal enum Button {
        /// Next
        internal static let next = Localizable.tr("Strings", "onboarding_interests.button.next")
        /// Skip
        internal static let skip = Localizable.tr("Strings", "onboarding_interests.button.skip")
      }
    }
    internal enum Playback {
      /// Delayed
      internal static let delayed = Localizable.tr("Strings", "playback.delayed")
      /// Failed
      internal static let failed = Localizable.tr("Strings", "playback.failed")
      /// Paused
      internal static let paused = Localizable.tr("Strings", "playback.paused")
      /// Playing
      internal static let playing = Localizable.tr("Strings", "playback.playing")
      /// Ready
      internal static let ready = Localizable.tr("Strings", "playback.ready")
      /// Stopped
      internal static let stopped = Localizable.tr("Strings", "playback.stopped")
      /// Unknown
      internal static let unknown = Localizable.tr("Strings", "playback.unknown")
    }
    internal enum PushNotifications {
      /// Never miss content daily picked for you
      internal static let description = Localizable.tr("Strings", "pushNotifications.description")
      /// Get notified about\ntop trending content
      internal static let title = Localizable.tr("Strings", "pushNotifications.title")
      internal enum Button {
        /// Allow Notifications
        internal static let allow = Localizable.tr("Strings", "pushNotifications.button.allow")
        /// Maybe Later
        internal static let later = Localizable.tr("Strings", "pushNotifications.button.later")
      }
    }
    internal enum RateApp {
      internal enum Reply {
        /// Your feedback helps us grow.
        internal static let subtitle = Localizable.tr("Strings", "rate_app.reply.subtitle")
        /// Thanks for your rating!
        internal static let title = Localizable.tr("Strings", "rate_app.reply.title")
      }
      internal enum Stars {
        /// Let us know what you think
        internal static let subtitle = Localizable.tr("Strings", "rate_app.stars.subtitle")
        /// Enjoying Reface?
        internal static let title = Localizable.tr("Strings", "rate_app.stars.title")
      }
    }
    internal enum Reeanctment {
      internal enum AnimateButton {
        /// Animate Face
        internal static let title = Localizable.tr("Strings", "reeanctment.animate_button.title")
      }
    }
    internal enum Reenactment {
      /// Maximum faces selected. Unselect one of them to select another.
      internal static let faceLimitDescription = Localizable.tr("Strings", "reenactment.face_limit_description")
      internal enum AnalyzingFaces {
        /// Analyzing for faces
        internal static let title = Localizable.tr("Strings", "reenactment.analyzing_faces.title")
      }
      internal enum AnimateImageResultButton {
        /// Animate
        internal static let title = Localizable.tr("Strings", "reenactment.animate_image_result_button.title")
      }
      internal enum Camera {
        internal enum CancelButton {
          /// Cancel
          internal static let title = Localizable.tr("Strings", "reenactment.camera.cancel_button.title")
        }
        internal enum ContinueButton {
          /// Choose
          internal static let title = Localizable.tr("Strings", "reenactment.camera.continue_button.title")
        }
        internal enum Error {
          /// Something went wrong using your camera. Please, try again.
          internal static let description = Localizable.tr("Strings", "reenactment.camera.error.description")
          /// Oops
          internal static let title = Localizable.tr("Strings", "reenactment.camera.error.title")
        }
      }
      internal enum CameraPermissions {
        internal enum Error {
          /// You haven't given permissions to camera.
          internal static let description = Localizable.tr("Strings", "reenactment.camera_permissions.error.description")
          /// Allow access to camera
          internal static let title = Localizable.tr("Strings", "reenactment.camera_permissions.error.title")
        }
        internal enum GoToSettings {
          /// Go to Settings
          internal static let title = Localizable.tr("Strings", "reenactment.camera_permissions.go_to_settings.title")
        }
      }
      internal enum FacePicker {
        /// Choose Lipsync Animation
        internal static let chooseAnimation = Localizable.tr("Strings", "reenactment.face_picker.choose_animation")
        /// Animate Face
        internal static let `continue` = Localizable.tr("Strings", "reenactment.face_picker.continue")
        /// None
        internal static let noneAnimation = Localizable.tr("Strings", "reenactment.face_picker.none_animation")
        /// See All
        internal static let seeAll = Localizable.tr("Strings", "reenactment.face_picker.see_all")
        /// Lipsync Animate
        internal static let title = Localizable.tr("Strings", "reenactment.face_picker.title")
        internal enum LoadingFailed {
          /// Try Again
          internal static let retry = Localizable.tr("Strings", "reenactment.face_picker.loading_failed.retry")
          /// Couldn’t load the data
          internal static let title = Localizable.tr("Strings", "reenactment.face_picker.loading_failed.title")
        }
      }
      internal enum Gallery {
        internal enum ChangeSettings {
          /// Change Settings
          internal static let title = Localizable.tr("Strings", "reenactment.gallery.change_settings.title")
        }
        internal enum ManagePermission {
          /// You’ve given Reface access to a selected\nnumber of photos
          internal static let description = Localizable.tr("Strings", "reenactment.gallery.manage_permission.description")
        }
        internal enum ManagePermissionButton {
          /// Manage
          internal static let title = Localizable.tr("Strings", "reenactment.gallery.manage_permission_button.title")
        }
        internal enum SelectMorePhotos {
          /// Select More Photos
          internal static let title = Localizable.tr("Strings", "reenactment.gallery.select_more_photos.title")
        }
      }
      internal enum GalleryPermissionsAlert {
        /// To access all of your photos in Reface, allow access to your full library in device settings.
        internal static let description = Localizable.tr("Strings", "reenactment.gallery_permissions_alert.description")
      }
      internal enum ImageUploadError {
        internal enum General {
          /// We are having little issues at the moment, sorry
          internal static let description = Localizable.tr("Strings", "reenactment.image_upload_error.general.description")
          /// Oops
          internal static let title = Localizable.tr("Strings", "reenactment.image_upload_error.general.title")
        }
        internal enum LoadImageFromGallery {
          /// Your image could not be uploaded
          internal static let description = Localizable.tr("Strings", "reenactment.image_upload_error.load_image_from_gallery.description")
          /// Oops
          internal static let title = Localizable.tr("Strings", "reenactment.image_upload_error.load_image_from_gallery.title")
        }
        internal enum NoFaces {
          /// Could not detect faces on this image
          internal static let title = Localizable.tr("Strings", "reenactment.image_upload_error.no_faces.title")
        }
        internal enum NsfwAccountBlocked {
          /// Sorry to inform you we’ve blocked your account due to numerous instances of possible inappropriate content detection. Contact us if you think we made a mistake.
          internal static let message = Localizable.tr("Strings", "reenactment.image_upload_error.nsfw_account_blocked.message")
          /// Account blocked
          internal static let title = Localizable.tr("Strings", "reenactment.image_upload_error.nsfw_account_blocked.title")
        }
        internal enum NsfwBlocked {
          /// We restrict inappropriate content to protect our community (check section 6 of the Terms of use). In case of more violations, we may have to block your ability to reface your own images. Contact us if you think we made a mistake.
          internal static let description = Localizable.tr("Strings", "reenactment.image_upload_error.nsfw_blocked.description")
          /// Possible inappropriate content blocked
          internal static let title = Localizable.tr("Strings", "reenactment.image_upload_error.nsfw_blocked.title")
        }
        internal enum NsfwDetected {
          /// Please be aware that we restrict inappropriate content to protect our community (check section 6 of the Terms of use).
          internal static let description = Localizable.tr("Strings", "reenactment.image_upload_error.nsfw_detected.description")
          /// Possible inappropriate content detected
          internal static let title = Localizable.tr("Strings", "reenactment.image_upload_error.nsfw_detected.title")
        }
      }
      internal enum LowQualityPopup {
        /// Some of the selected faces are too close. For better results, select faces that are farther away from each other.
        internal static let description = Localizable.tr("Strings", "reenactment.low_quality_popup.description")
        /// Low quality result possible
        internal static let title = Localizable.tr("Strings", "reenactment.low_quality_popup.title")
      }
      internal enum Motions {
        /// Done
        internal static let chooseButton = Localizable.tr("Strings", "reenactment.motions.choose_button")
        /// Choose Animation
        internal static let title = Localizable.tr("Strings", "reenactment.motions.title")
        internal enum Failed {
          /// Couldn’t load the data
          internal static let title = Localizable.tr("Strings", "reenactment.motions.failed.title")
          /// Try again
          internal static let tryAgain = Localizable.tr("Strings", "reenactment.motions.failed.try_again")
          internal enum CouldNotLoad {
            /// Couldn’t load more animations
            internal static let title = Localizable.tr("Strings", "reenactment.motions.failed.could_not_load.title")
          }
        }
      }
      internal enum Processing {
        /// Animating Face...
        internal static let title = Localizable.tr("Strings", "reenactment.processing.title")
      }
      internal enum PromoBanner {
        /// New Feature
        internal static let newFeature = Localizable.tr("Strings", "reenactment.promo_banner.new_feature")
        /// Animate Multiple\nFaces on the Photo
        internal static let title = Localizable.tr("Strings", "reenactment.promo_banner.title")
      }
      internal enum Result {
        /// Result
        internal static let title = Localizable.tr("Strings", "reenactment.result.title")
      }
    }
    internal enum RefaceResult {
      /// Link copied to clipboard
      internal static let linkCopied = Localizable.tr("Strings", "reface_result.link_copied")
      /// Result
      internal static let title = Localizable.tr("Strings", "reface_result.title")
      internal enum EditFaces {
        /// Tap to edit faces
        internal static let title = Localizable.tr("Strings", "reface_result.edit_faces.title")
      }
      internal enum RecommendedContent {
        internal enum FailedLoading {
          /// Try Again
          internal static let retryButton = Localizable.tr("Strings", "reface_result.recommended_content.failed_loading.retry_button")
          /// Couldn’t load the data
          internal static let title = Localizable.tr("Strings", "reface_result.recommended_content.failed_loading.title")
        }
        internal enum Popular {
          /// Popular
          internal static let title = Localizable.tr("Strings", "reface_result.recommended_content.popular.title")
        }
        internal enum PopularNow {
          /// Popular Now
          internal static let title = Localizable.tr("Strings", "reface_result.recommended_content.popularNow.title")
        }
        internal enum Similar {
          /// More like this
          internal static let title = Localizable.tr("Strings", "reface_result.recommended_content.similar.title")
        }
      }
      internal enum SavedToPhotos {
        /// Saved to Photos
        internal static let title = Localizable.tr("Strings", "reface_result.saved_to_photos.title")
      }
    }
    internal enum Report {
      /// Why are you reporting this?
      internal static let whyReport = Localizable.tr("Strings", "report.why_report")
      internal enum Content {
        /// Delete content (you’ve uploaded it)
        internal static let delete = Localizable.tr("Strings", "report.content.delete")
        internal enum Fail {
          /// Face swap inaccurate
          internal static let description = Localizable.tr("Strings", "report.content.fail.description")
        }
        internal enum Hate {
          /// Hateful or abusive
          internal static let description = Localizable.tr("Strings", "report.content.hate.description")
        }
        internal enum Nudity {
          /// Nudity or sexual
          internal static let description = Localizable.tr("Strings", "report.content.nudity.description")
        }
        internal enum Politic {
          /// Political issue
          internal static let description = Localizable.tr("Strings", "report.content.politic.description")
        }
        internal enum Rights {
          /// Alleged Copyright Infringement
          internal static let description = Localizable.tr("Strings", "report.content.rights.description")
        }
        internal enum Violence {
          /// Violence scene
          internal static let description = Localizable.tr("Strings", "report.content.violence.description")
        }
      }
    }
    internal enum RewardedAdsForAnimations {
      /// Get for Free
      internal static let getForFree = Localizable.tr("Strings", "rewarded_ads_for_animations.get_for_free")
      /// Watch an ad or upgrade to PRO to use this animation
      internal static let tryExclusiveAnimationsSubtitle = Localizable.tr("Strings", "rewarded_ads_for_animations.try_exclusive_animations_subtitle")
      /// Try exclusive animations
      internal static let tryExclusiveAnimationsTitle = Localizable.tr("Strings", "rewarded_ads_for_animations.try_exclusive_animations_title")
      /// Upgrade to PRO
      internal static let upgradeToPro = Localizable.tr("Strings", "rewarded_ads_for_animations.upgrade_to_pro")
    }
    internal enum RewardedAdsToRemoveWatermark {
      /// Get for Free
      internal static let getForFree = Localizable.tr("Strings", "rewarded_ads_to-remove-watermark.get_for_free")
      /// Watch an ad or upgrade to PRO to remove watermark
      internal static let subtitle = Localizable.tr("Strings", "rewarded_ads_to-remove-watermark.subtitle")
      /// Remove watermark
      internal static let title = Localizable.tr("Strings", "rewarded_ads_to-remove-watermark.title")
      /// Upgrade to PRO
      internal static let upgradeToPro = Localizable.tr("Strings", "rewarded_ads_to-remove-watermark.upgrade_to_pro")
    }
    internal enum SaveShare {
      /// Save result
      internal static let saveTitle = Localizable.tr("Strings", "save_share.save_title")
      /// Share result to
      internal static let title = Localizable.tr("Strings", "save_share.title")
    }
    internal enum SaveShareExitPopup {
      /// Don't save
      internal static let buttonDontSave = Localizable.tr("Strings", "save_share_exit_popup.button_dont_save")
      /// Save & Exit
      internal static let buttonSave = Localizable.tr("Strings", "save_share_exit_popup.button_save")
      /// You have made great job! Would you like to save or share your result?
      internal static let descriptionLabel = Localizable.tr("Strings", "save_share_exit_popup.description_label")
      /// Exit without saving?
      internal static let title = Localizable.tr("Strings", "save_share_exit_popup.title")
    }
    internal enum SaveShareLimitsPopup {
      /// Upgrade to PRO
      internal static let buttonProTitle = Localizable.tr("Strings", "save_share_limits_popup.button_pro_title")
      /// Watch ad to save
      internal static let buttonWatchAd = Localizable.tr("Strings", "save_share_limits_popup.button_watch_ad")
      /// You’ve hit the limit of free saves. Wait, upgrade account or watch an ad to get a free save
      internal static let subtitle = Localizable.tr("Strings", "save_share_limits_popup.subtitle")
      /// Next free save will be available in
      internal static let timerTitle = Localizable.tr("Strings", "save_share_limits_popup.timer_title")
      /// Out of free saves
      internal static let title = Localizable.tr("Strings", "save_share_limits_popup.title")
    }
    internal enum Search {
      /// Trending Searches
      internal static let trendingSearches = Localizable.tr("Strings", "search.trendingSearches")
      internal enum Categories {
        /// Categories
        internal static let title = Localizable.tr("Strings", "search.categories.title")
      }
      internal enum Header {
        /// Search Videos & Images
        internal static let fieldPlaceholder = Localizable.tr("Strings", "search.header.field_placeholder")
      }
      internal enum Home {
        /// Search Videos & Images
        internal static let placeholder = Localizable.tr("Strings", "search.home.placeholder")
      }
      internal enum MostPopular {
        /// Most Popular Now
        internal static let title = Localizable.tr("Strings", "search.mostPopular.title")
        internal enum Error {
          /// Try again
          internal static let retryButton = Localizable.tr("Strings", "search.mostPopular.error.retry_button")
          /// Couldn’t load the data
          internal static let subtitle = Localizable.tr("Strings", "search.mostPopular.error.subtitle")
          /// 😵
          internal static let title = Localizable.tr("Strings", "search.mostPopular.error.title")
        }
      }
      internal enum RecentSearches {
        /// Clear All
        internal static let clearAll = Localizable.tr("Strings", "search.recent_searches.clear_all")
        /// No recent searches
        internal static let empty = Localizable.tr("Strings", "search.recent_searches.empty")
        /// Recent Searches
        internal static let searches = Localizable.tr("Strings", "search.recent_searches.searches")
      }
      internal enum Results {
        internal enum Categories {
          /// Images
          internal static let images = Localizable.tr("Strings", "search.results.categories.images")
          /// Templates
          internal static let templates = Localizable.tr("Strings", "search.results.categories.templates")
          /// Videos
          internal static let videos = Localizable.tr("Strings", "search.results.categories.videos")
        }
        internal enum Empty {
          /// Can’t find any images
          internal static let images = Localizable.tr("Strings", "search.results.empty.images")
          /// 🙈
          internal static let title = Localizable.tr("Strings", "search.results.empty.title")
          /// Can’t find any results
          internal static let top = Localizable.tr("Strings", "search.results.empty.top")
          /// Can’t find any videos
          internal static let videos = Localizable.tr("Strings", "search.results.empty.videos")
          internal enum All {
            /// Can’t find anything
            internal static let subtitle = Localizable.tr("Strings", "search.results.empty.all.subtitle")
          }
          internal enum Images {
            /// Can’t find images
            internal static let subtitle = Localizable.tr("Strings", "search.results.empty.images.subtitle")
          }
          internal enum Videos {
            /// Can’t find videos
            internal static let subtitle = Localizable.tr("Strings", "search.results.empty.videos.subtitle")
          }
        }
        internal enum Error {
          /// Couldn’t load the data
          internal static let description = Localizable.tr("Strings", "search.results.error.description")
          /// Try Again
          internal static let retryButton = Localizable.tr("Strings", "search.results.error.retry_button")
          /// 😵
          internal static let title = Localizable.tr("Strings", "search.results.error.title")
        }
        internal enum Tabs {
          /// All
          internal static let all = Localizable.tr("Strings", "search.results.tabs.all")
          /// Images
          internal static let images = Localizable.tr("Strings", "search.results.tabs.images")
          /// See All
          internal static let seeAll = Localizable.tr("Strings", "search.results.tabs.see_all")
          /// Templates
          internal static let templates = Localizable.tr("Strings", "search.results.tabs.templates")
          /// Top
          internal static let top = Localizable.tr("Strings", "search.results.tabs.top")
          /// Videos
          internal static let videos = Localizable.tr("Strings", "search.results.tabs.videos")
        }
      }
      internal enum Suggestions {
        internal enum Error {
          /// Try again
          internal static let retryButton = Localizable.tr("Strings", "search.suggestions.error.retry_button")
          /// Couldn’t load the data
          internal static let subtitle = Localizable.tr("Strings", "search.suggestions.error.subtitle")
          /// 😵
          internal static let title = Localizable.tr("Strings", "search.suggestions.error.title")
        }
        internal enum ExtraTag {
          /// Search for ”%@”
          internal static func format(_ p1: Any) -> String {
            return Localizable.tr("Strings", "search.suggestions.extra_tag.format", String(describing: p1))
          }
        }
      }
    }
    internal enum SeeAll {
      internal enum Error {
        /// Couldn’t load the data
        internal static let title = Localizable.tr("Strings", "see_all.error.title")
        internal enum RetryButton {
          /// Try Again
          internal static let title = Localizable.tr("Strings", "see_all.error.retry_button.title")
        }
      }
    }
    internal enum SelectFace {
      /// Add face
      internal static let addFace = Localizable.tr("Strings", "select_face.add_face")
      /// Choose face
      internal static let chooseFace = Localizable.tr("Strings", "select_face.choose_face")
    }
    internal enum Settings {
      /// About Reface
      internal static let about = Localizable.tr("Strings", "settings.about")
      /// Account ID copied
      internal static let accountIdCopied = Localizable.tr("Strings", "settings.account_id_copied")
      /// Copy Account ID
      internal static let accountIdCopy = Localizable.tr("Strings", "settings.account_id_copy")
      /// App Version
      internal static let appVersion = Localizable.tr("Strings", "settings.app_version")
      /// Сommunity Guidelines
      internal static let communityGuidelines = Localizable.tr("Strings", "settings.community_guidelines")
      /// Contact Support
      internal static let contactSupport = Localizable.tr("Strings", "settings.contact_support")
      /// Preview Quality
      internal static let dataSavingMode = Localizable.tr("Strings", "settings.data_saving_mode")
      /// Debug Settings
      internal static let debugSettings = Localizable.tr("Strings", "settings.debug_settings")
      /// Erase My Personal Data
      internal static let eraseMyData = Localizable.tr("Strings", "settings.erase_my_data")
      /// How to Cancel Subscription
      internal static let howToCancelSubscription = Localizable.tr("Strings", "settings.how_to_cancel_subscription")
      /// Privacy Notice
      internal static let privacyPolicy = Localizable.tr("Strings", "settings.privacy_policy")
      /// Restore Subscription
      internal static let restoreSubscription = Localizable.tr("Strings", "settings.restore_subscription")
      /// Subscription Policy
      internal static let subscriptionPolicy = Localizable.tr("Strings", "settings.subscription_policy")
      /// Swaps count
      internal static let swapsCount = Localizable.tr("Strings", "settings.swaps_count")
      /// Terms of Use
      internal static let termsOfUse = Localizable.tr("Strings", "settings.terms_of_use")
      /// 🤘 You are a PRO User
      internal static let youArePro = Localizable.tr("Strings", "settings.you_are_pro")
      internal enum EraseMyData {
        /// Erase
        internal static let eraseAction = Localizable.tr("Strings", "settings.erase_my_data.erase_action")
        internal enum Alert {
          /// All your data in the app will be erased immediately. Data in our databases will be erased within next 48 hours.
          internal static let description = Localizable.tr("Strings", "settings.erase_my_data.alert.description")
          /// Do you want to erase all your personal data?
          internal static let title = Localizable.tr("Strings", "settings.erase_my_data.alert.title")
        }
        internal enum Error {
          /// An error occured, please try again later.
          internal static let description = Localizable.tr("Strings", "settings.erase_my_data.error.description")
          /// Oops, something went wrong
          internal static let title = Localizable.tr("Strings", "settings.erase_my_data.error.title")
        }
        internal enum Success {
          /// Data in our databases will be erased witin next 48 hours.
          internal static let description = Localizable.tr("Strings", "settings.erase_my_data.success.description")
          /// Your data in the app was erased successfully
          internal static let title = Localizable.tr("Strings", "settings.erase_my_data.success.title")
        }
      }
      internal enum GetPro {
        /// Get PRO
        internal static let button = Localizable.tr("Strings", "settings.get_pro.button")
        /// No ads. Unlimited access.
        internal static let subtitle = Localizable.tr("Strings", "settings.get_pro.subtitle")
        /// 🤘 Get Reface PRO
        internal static let title = Localizable.tr("Strings", "settings.get_pro.title")
      }
      internal enum Restore {
        internal enum NoSubscriptions {
          /// It seems that you haven’t got any active subscriptions
          internal static let message = Localizable.tr("Strings", "settings.restore.no_subscriptions.message")
          /// No subscription found
          internal static let title = Localizable.tr("Strings", "settings.restore.no_subscriptions.title")
        }
      }
      internal enum SocialNetworks {
        /// Join The Community
        internal static let title = Localizable.tr("Strings", "settings.social_networks.title")
      }
    }
    internal enum Subscription {
      internal enum Advantage {
        /// Best value
        internal static let annual = Localizable.tr("Strings", "subscription.advantage.annual")
        /// Most popular
        internal static let monthly = Localizable.tr("Strings", "subscription.advantage.monthly")
        /// Most flexible
        internal static let weekly = Localizable.tr("Strings", "subscription.advantage.weekly")
      }
      internal enum Config {
        internal enum AnnualDiscounted {
          /// Reface PRO With No Limits
          internal static let subtitle = Localizable.tr("Strings", "subscription.config.annual_discounted.subtitle")
          /// Limited Time Offer
          internal static let title = Localizable.tr("Strings", "subscription.config.annual_discounted.title")
        }
      }
      internal enum Footer {
        /// Privacy Notice
        internal static let privacy = Localizable.tr("Strings", "subscription.footer.privacy")
        /// Restore
        internal static let restore = Localizable.tr("Strings", "subscription.footer.restore")
        /// Terms of Use
        internal static let terms = Localizable.tr("Strings", "subscription.footer.terms")
      }
      internal enum Period {
        /// %@ free trial
        internal static func freeTrial(_ p1: Any) -> String {
          return Localizable.tr("Strings", "subscription.period.free_trial", String(describing: p1))
        }
      }
      internal enum Purchase {
        /// Purchase failed
        internal static let fail = Localizable.tr("Strings", "subscription.purchase.fail")
        /// Unable to connect to AppStore
        internal static let noAppstoreConnection = Localizable.tr("Strings", "subscription.purchase.no_appstore_connection")
        internal enum Restore {
          /// All your previous transactions restored.
          internal static let subtitle = Localizable.tr("Strings", "subscription.purchase.restore.subtitle")
          /// Purchases restored! 🍾
          internal static let title = Localizable.tr("Strings", "subscription.purchase.restore.title")
        }
      }
      internal enum ThanksForSubscribing {
        /// Welcome on board! Enjoy refacing with premium features.
        internal static let subtitle = Localizable.tr("Strings", "subscription.thanks_for_subscribing.subtitle")
        /// Thanks for subscribing! 🙌
        internal static let title = Localizable.tr("Strings", "subscription.thanks_for_subscribing.title")
      }
    }
    internal enum Survey {
      /// It will help us make it better ✨
      internal static let subtitle = Localizable.tr("Strings", "survey.subtitle")
      /// Please answer a few questions about Reface
      internal static let title = Localizable.tr("Strings", "survey.title")
      internal enum Button {
        /// OK, GO
        internal static let title = Localizable.tr("Strings", "survey.button.title")
      }
    }
    internal enum SwapContentPreview {
      /// Swap Face
      internal static let screenTitle = Localizable.tr("Strings", "swapContentPreview.screenTitle")
    }
    internal enum SwapFace {
      internal enum ActionButton {
        /// Swap Face
        internal static let title = Localizable.tr("Strings", "swap_face.action_button.title")
      }
      internal enum Processing {
        /// Swapping Face...
        internal static let title = Localizable.tr("Strings", "swap_face.processing.title")
      }
    }
    internal enum SwapResult {
      internal enum NsfwAccountBlocked {
        /// Account blocked
        internal static let title = Localizable.tr("Strings", "swap_result.nsfw_account_blocked.title")
      }
      internal enum NsfwContentBlocked {
        /// Possible inappropriate content blocked
        internal static let title = Localizable.tr("Strings", "swap_result.nsfw_content_blocked.title")
      }
    }
    internal enum Tabbar {
      internal enum AiTools {
        /// AI Tools
        internal static let title = Localizable.tr("Strings", "tabbar.ai_tools.title")
      }
      internal enum Diffusion {
        /// AI Avatar
        internal static let title = Localizable.tr("Strings", "tabbar.diffusion.title")
      }
      internal enum Home {
        /// Discover
        internal static let title = Localizable.tr("Strings", "tabbar.home.title")
      }
      internal enum Upload {
        /// Upload
        internal static let title = Localizable.tr("Strings", "tabbar.upload.title")
      }
    }
    internal enum TermsUpdate {
      internal enum DescriptionTextView {
        /// Hey, we care about your privacy and data. So, please check the updates in our Terms of Use and Privacy Notice
        internal static let text = Localizable.tr("Strings", "terms_update.description_text_view.text")
      }
      internal enum PrivacySwitch {
        /// I give my consent to personal data processing under new Privacy Notice
        internal static let title = Localizable.tr("Strings", "terms_update.privacy_switch.title")
      }
      internal enum TermsSwitch {
        /// I agree on all provisions of new Terms of Use
        internal static let title = Localizable.tr("Strings", "terms_update.terms_switch.title")
      }
      internal enum TitleLabel {
        /// We’ve made a few updates
        internal static let title = Localizable.tr("Strings", "terms_update.title_label.title")
      }
    }
    internal enum ToolTip {
      /// All your faces are\nnow moved to settings
      internal static let facesToSettings = Localizable.tr("Strings", "tool_tip.faces_to_settings")
      /// New Feature ✨
      internal static let newFeature = Localizable.tr("Strings", "tool_tip.new_feature")
      /// Apply features to your videos & images
      internal static let tools = Localizable.tr("Strings", "tool_tip.tools")
    }
    internal enum Upload {
      /// Upload
      internal static let title = Localizable.tr("Strings", "upload.title")
      internal enum Animate {
        /// Upload photo
        internal static let description = Localizable.tr("Strings", "upload.animate.description")
        /// Lipsync\nAnimate Face
        internal static let title = Localizable.tr("Strings", "upload.animate.title")
      }
      internal enum Avatars {
        /// Generate your avatars
        internal static let description = Localizable.tr("Strings", "upload.avatars.description")
        /// AI Avatar
        internal static let title = Localizable.tr("Strings", "upload.avatars.title")
      }
      internal enum FaceSwap {
        /// Upload video or photo
        internal static let description = Localizable.tr("Strings", "upload.faceSwap.description")
        /// Swap Face
        internal static let title = Localizable.tr("Strings", "upload.faceSwap.title")
      }
      internal enum Revoice {
        /// Choose or record phrase
        internal static let description = Localizable.tr("Strings", "upload.revoice.description")
        /// Revoice Video
        internal static let title = Localizable.tr("Strings", "upload.revoice.title")
      }
    }
  }
}

/// Use for localization
typealias L10n = Localizable.Strings // assuming Strings is default value for base text localization

// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizable {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
