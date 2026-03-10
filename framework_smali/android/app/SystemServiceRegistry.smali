.class public final Landroid/app/SystemServiceRegistry;
.super Ljava/lang/Object;
.source "SystemServiceRegistry.java"


# annotations
.annotation runtime Landroid/annotation/SystemApi;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/app/SystemServiceRegistry$ServiceFetcher;,
        Landroid/app/SystemServiceRegistry$StaticServiceProducerWithBinder;,
        Landroid/app/SystemServiceRegistry$StaticServiceProducerWithoutBinder;,
        Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithBinder;,
        Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithoutBinder;,
        Landroid/app/SystemServiceRegistry$StaticServiceFetcher;,
        Landroid/app/SystemServiceRegistry$CachedServiceFetcher;
    }
.end annotation


# static fields
.field private static final blacklist PERSISTENT_DATA_BLOCK_PROP:Ljava/lang/String; = "ro.frp.pst"

.field private static final blacklist PERSISTENT_OEM_VENDOR_LOCK:Ljava/lang/String; = "ro.service.oem.vendorlock"

.field private static final blacklist SYSTEM_SERVICE_CLASS_NAMES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final blacklist SYSTEM_SERVICE_FETCHERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/app/SystemServiceRegistry$ServiceFetcher<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final blacklist SYSTEM_SERVICE_NAMES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final blacklist TAG:Ljava/lang/String; = "SystemServiceRegistry"

.field public static blacklist sEnableServiceNotFoundWtf:Z

.field private static volatile blacklist sInitializing:Z

.field static final blacklist sMtkServiceRegistryClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static blacklist sServiceCacheSize:I


# direct methods
.method static bridge synthetic blacklist -$$Nest$sfgetsServiceCacheSize()I
    .registers 1

    sget v0, Landroid/app/SystemServiceRegistry;->sServiceCacheSize:I

    return v0
.end method

.method static bridge synthetic blacklist -$$Nest$sfputsServiceCacheSize(I)V
    .registers 1

    sput p0, Landroid/app/SystemServiceRegistry;->sServiceCacheSize:I

    return-void
.end method

.method static constructor blacklist <clinit>()V
    .registers 8

    .line 283
    const/4 v0, 0x0

    sput-boolean v0, Landroid/app/SystemServiceRegistry;->sEnableServiceNotFoundWtf:Z

    .line 292
    new-instance v1, Landroid/util/ArrayMap;

    invoke-direct {v1}, Landroid/util/ArrayMap;-><init>()V

    sput-object v1, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_NAMES:Ljava/util/Map;

    .line 294
    new-instance v2, Landroid/util/ArrayMap;

    invoke-direct {v2}, Landroid/util/ArrayMap;-><init>()V

    sput-object v2, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_FETCHERS:Ljava/util/Map;

    .line 296
    new-instance v2, Landroid/util/ArrayMap;

    invoke-direct {v2}, Landroid/util/ArrayMap;-><init>()V

    sput-object v2, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_CLASS_NAMES:Ljava/util/Map;

    .line 311
    const-class v2, Landroid/view/accessibility/AccessibilityManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$1;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$1;-><init>()V

    const-string v4, "accessibility"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 318
    const-class v2, Landroid/view/accessibility/CaptioningManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$2;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$2;-><init>()V

    const-string v4, "captioning"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 325
    const-class v2, Landroid/accounts/AccountManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$3;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$3;-><init>()V

    const-string v4, "account"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 334
    const-class v2, Landroid/app/ActivityManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$4;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$4;-><init>()V

    const-string v4, "activity"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 341
    const-class v2, Landroid/app/ActivityTaskManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$5;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$5;-><init>()V

    const-string v4, "activity_task"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 348
    const-class v2, Landroid/app/UriGrantsManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$6;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$6;-><init>()V

    const-string/jumbo v4, "uri_grants"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 356
    const-class v2, Landroid/app/AlarmManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$7;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$7;-><init>()V

    const-string v4, "alarm"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 365
    const-class v2, Landroid/media/AudioManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$8;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$8;-><init>()V

    const-string v4, "audio"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 372
    const-class v2, Landroid/media/AudioDeviceVolumeManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$9;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$9;-><init>()V

    const-string v4, "audio_device_volume"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 379
    const-class v2, Landroid/media/MediaRouter;

    new-instance v3, Landroid/app/SystemServiceRegistry$10;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$10;-><init>()V

    const-string/jumbo v4, "media_router"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 386
    const-class v2, Landroid/hardware/hdmi/HdmiControlManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$11;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$11;-><init>()V

    const-string v4, "hdmi_control"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 394
    const-class v2, Landroid/view/textclassifier/TextClassificationManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$12;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$12;-><init>()V

    const-string/jumbo v4, "textclassification"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 401
    const-class v2, Landroid/view/selectiontoolbar/SelectionToolbarManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$13;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$13;-><init>()V

    const-string/jumbo v4, "selection_toolbar"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 410
    const-class v2, Landroid/graphics/fonts/FontManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$14;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$14;-><init>()V

    const-string v4, "font"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 418
    const-class v2, Landroid/content/ClipboardManager;

    new-instance v3, Landroid/app/SystemServiceRegistry$15;

    invoke-direct {v3}, Landroid/app/SystemServiceRegistry$15;-><init>()V

    const-string v4, "clipboard"

    invoke-static {v4, v2, v3}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 429
    const-class v2, Landroid/text/ClipboardManager;

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    const-class v1, Landroid/net/PacProxyManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$16;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$16;-><init>()V

    const-string/jumbo v3, "pac_proxy"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 440
    const-class v1, Landroid/os/IBinder;

    new-instance v2, Landroid/app/SystemServiceRegistry$17;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$17;-><init>()V

    const-string/jumbo v3, "netd"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 447
    const-class v1, Landroid/net/TetheringManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$18;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$18;-><init>()V

    const-string/jumbo v3, "tethering"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 455
    const-class v1, Landroid/net/VpnManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$19;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$19;-><init>()V

    const-string/jumbo v3, "vpn_management"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 464
    const-class v1, Landroid/net/vcn/VcnManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$20;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$20;-><init>()V

    const-string/jumbo v3, "vcn_management"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 473
    const-class v1, Landroid/location/CountryDetector;

    new-instance v2, Landroid/app/SystemServiceRegistry$21;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$21;-><init>()V

    const-string v3, "country_detector"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 481
    const-class v1, Landroid/app/admin/DevicePolicyManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$22;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$22;-><init>()V

    const-string v3, "device_policy"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 489
    const-class v1, Landroid/app/DownloadManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$23;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$23;-><init>()V

    const-string v3, "download"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 496
    const-class v1, Landroid/os/BatteryManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$24;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$24;-><init>()V

    const-string v3, "batterymanager"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 507
    const-class v1, Landroid/os/DropBoxManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$25;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$25;-><init>()V

    const-string v3, "dropbox"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 516
    const-class v1, Landroid/transparency/BinaryTransparencyManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$26;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$26;-><init>()V

    const-string/jumbo v3, "transparency"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 528
    const-class v1, Landroid/hardware/input/InputManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$27;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$27;-><init>()V

    const-string v3, "input"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 535
    const-class v1, Landroid/hardware/display/DisplayManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$28;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$28;-><init>()V

    const-string v3, "display"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 542
    const-class v1, Landroid/hardware/display/ColorDisplayManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$29;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$29;-><init>()V

    const-string v3, "color_display"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 554
    const-class v1, Landroid/view/inputmethod/InputMethodManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$30;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$30;-><init>()V

    const-string v3, "input_method"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 561
    const-class v1, Landroid/view/textservice/TextServicesManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$31;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$31;-><init>()V

    const-string/jumbo v3, "textservices"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 569
    const-class v1, Landroid/app/KeyguardManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$32;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$32;-><init>()V

    const-string v3, "keyguard"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 576
    const-class v1, Landroid/view/LayoutInflater;

    new-instance v2, Landroid/app/SystemServiceRegistry$33;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$33;-><init>()V

    const-string v3, "layout_inflater"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 583
    const-class v1, Landroid/location/LocationManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$34;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$34;-><init>()V

    const-string v3, "location"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 591
    const-class v1, Landroid/net/NetworkPolicyManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$35;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$35;-><init>()V

    const-string/jumbo v3, "netpolicy"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 599
    const-class v1, Landroid/app/NotificationManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$36;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$36;-><init>()V

    const-string/jumbo v3, "notification"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 615
    const-class v1, Landroid/app/people/PeopleManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$37;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$37;-><init>()V

    const-string/jumbo v3, "people"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 622
    const-class v1, Landroid/os/PowerManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$38;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$38;-><init>()V

    const-string/jumbo v3, "power"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 634
    const-class v1, Landroid/os/PerformanceHintManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$39;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$39;-><init>()V

    const-string/jumbo v3, "performance_hint"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 642
    const-class v1, Landroid/os/RecoverySystem;

    new-instance v2, Landroid/app/SystemServiceRegistry$40;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$40;-><init>()V

    const-string/jumbo v3, "recovery"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 651
    const-class v1, Landroid/app/SearchManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$41;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$41;-><init>()V

    const-string/jumbo v3, "search"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 659
    const-class v1, Landroid/hardware/SensorManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$42;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$42;-><init>()V

    const-string/jumbo v3, "sensor"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 667
    const-class v1, Landroid/hardware/SensorPrivacyManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$43;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$43;-><init>()V

    const-string/jumbo v3, "sensor_privacy"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 674
    const-class v1, Landroid/app/StatusBarManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$44;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$44;-><init>()V

    const-string/jumbo v3, "statusbar"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 681
    const-class v1, Landroid/os/storage/StorageManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$45;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$45;-><init>()V

    const-string/jumbo v3, "storage"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 688
    const-class v1, Landroid/app/usage/StorageStatsManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$46;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$46;-><init>()V

    const-string/jumbo v3, "storagestats"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 697
    const-class v1, Landroid/os/SystemUpdateManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$47;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$47;-><init>()V

    const-string/jumbo v3, "system_update"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 708
    const-class v1, Landroid/os/SystemConfigManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$48;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$48;-><init>()V

    const-string/jumbo v3, "system_config"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 715
    const-class v1, Landroid/telephony/TelephonyRegistryManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$49;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$49;-><init>()V

    const-string/jumbo v3, "telephony_registry"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 722
    const-class v1, Landroid/telecom/TelecomManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$50;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$50;-><init>()V

    const-string/jumbo v3, "telecom"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 729
    const-class v1, Landroid/telephony/MmsManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$51;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$51;-><init>()V

    const-string/jumbo v3, "mms"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 736
    const-class v1, Landroid/app/UiModeManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$52;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$52;-><init>()V

    const-string/jumbo v3, "uimode"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 743
    const-class v1, Landroid/hardware/usb/UsbManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$53;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$53;-><init>()V

    const-string/jumbo v3, "usb"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 751
    const-class v1, Landroid/debug/AdbManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$54;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$54;-><init>()V

    const-string v3, "adb"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 760
    const-class v1, Landroid/hardware/SerialManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$55;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$55;-><init>()V

    const-string/jumbo v3, "serial"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 768
    const-class v1, Landroid/os/VibratorManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$56;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$56;-><init>()V

    const-string/jumbo v3, "vibrator_manager"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 775
    const-class v1, Landroid/os/Vibrator;

    new-instance v2, Landroid/app/SystemServiceRegistry$57;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$57;-><init>()V

    const-string/jumbo v3, "vibrator"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 782
    const-class v1, Landroid/app/WallpaperManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$58;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$58;-><init>()V

    const-string/jumbo v3, "wallpaper"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 809
    const-class v1, Landroid/net/wifi/nl80211/WifiNl80211Manager;

    new-instance v2, Landroid/app/SystemServiceRegistry$59;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$59;-><init>()V

    const-string/jumbo v3, "wifinl80211"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 817
    const-class v1, Landroid/view/WindowManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$60;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$60;-><init>()V

    const-string/jumbo v3, "window"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 824
    const-class v1, Landroid/os/UserManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$61;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$61;-><init>()V

    const-string/jumbo v3, "user"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 833
    const-class v1, Landroid/app/AppOpsManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$62;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$62;-><init>()V

    const-string v3, "appops"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 842
    const-class v1, Landroid/hardware/camera2/CameraManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$63;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$63;-><init>()V

    const-string v3, "camera"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 849
    const-class v1, Landroid/content/pm/LauncherApps;

    new-instance v2, Landroid/app/SystemServiceRegistry$64;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$64;-><init>()V

    const-string v3, "launcherapps"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 856
    const-class v1, Landroid/content/RestrictionsManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$65;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$65;-><init>()V

    const-string/jumbo v3, "restrictions"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 865
    const-class v1, Landroid/print/PrintManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$66;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$66;-><init>()V

    const-string/jumbo v3, "print"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 880
    const-class v1, Landroid/companion/CompanionDeviceManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$67;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$67;-><init>()V

    const-string v3, "companiondevice"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 895
    const-class v1, Landroid/companion/virtual/VirtualDeviceManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$68;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$68;-><init>()V

    const-string/jumbo v3, "virtualdevice"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 909
    const-class v1, Landroid/hardware/ConsumerIrManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$69;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$69;-><init>()V

    const-string v3, "consumer_ir"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 916
    const-class v1, Landroid/app/trust/TrustManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$70;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$70;-><init>()V

    const-string/jumbo v3, "trust"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 924
    const-class v1, Landroid/hardware/fingerprint/FingerprintManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$71;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$71;-><init>()V

    const-string v3, "fingerprint"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 938
    const-class v1, Landroid/hardware/face/FaceManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$72;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$72;-><init>()V

    const-string v3, "face"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 954
    const-class v1, Landroid/hardware/iris/IrisManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$73;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$73;-><init>()V

    const-string v3, "iris"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 966
    const-class v1, Landroid/hardware/biometrics/BiometricManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$74;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$74;-><init>()V

    const-string v3, "biometric"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 979
    const-class v1, Landroid/media/tv/interactive/TvInteractiveAppManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$75;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$75;-><init>()V

    const-string/jumbo v3, "tv_interactive_app"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 991
    const-class v1, Landroid/media/tv/TvInputManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$76;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$76;-><init>()V

    const-string/jumbo v3, "tv_input"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1000
    const-class v1, Landroid/media/tv/tunerresourcemanager/TunerResourceManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$77;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$77;-><init>()V

    const-string/jumbo v3, "tv_tuner_resource_mgr"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1011
    const-class v1, Landroid/net/NetworkScoreManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$78;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$78;-><init>()V

    const-string/jumbo v3, "network_score"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1018
    const-class v1, Landroid/app/usage/UsageStatsManager;

    new-instance v2, Landroid/app/SystemServiceRegistry$79;

    invoke-direct {v2}, Landroid/app/SystemServiceRegistry$79;-><init>()V

    const-string/jumbo v3, "usagestats"

    invoke-static {v3, v1, v2}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1027
    nop

    .line 1028
    const-string/jumbo v1, "ro.frp.pst"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v3, 0x1

    xor-int/2addr v1, v3

    .line 1031
    .local v1, "hasPdb":Z
    nop

    .line 1032
    const-string/jumbo v4, "ro.service.oem.vendorlock"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    xor-int/2addr v4, v3

    .line 1034
    .local v4, "hasOEMVendorLock":Z
    if-eqz v1, :cond_42b

    .line 1035
    const-class v5, Landroid/service/persistentdata/PersistentDataBlockManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$80;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$80;-><init>()V

    const-string/jumbo v7, "persistent_data_block"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1052
    :cond_42b
    if-nez v1, :cond_42f

    if-eqz v4, :cond_43c

    .line 1053
    :cond_42f
    const-class v5, Landroid/service/oemlock/OemLockManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$81;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$81;-><init>()V

    const-string/jumbo v7, "oem_lock"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1068
    :cond_43c
    const-string/jumbo v5, "ro.carrier"

    invoke-static {v5, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1070
    .local v2, "PayJoyCarrier":Ljava/lang/String;
    const-string/jumbo v5, "openmx"

    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_465

    const-string v5, "altmx"

    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_465

    const-string/jumbo v5, "tefmx"

    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_465

    .line 1071
    const-string v5, "attmx"

    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_472

    .line 1073
    :cond_465
    const-class v5, Lcom/payjoy/service/PayJoyAccessManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$82;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$82;-><init>()V

    const-string/jumbo v7, "payjoy_access_service"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1089
    :cond_472
    const-class v5, Landroid/media/projection/MediaProjectionManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$83;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$83;-><init>()V

    const-string/jumbo v7, "media_projection"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1096
    const-class v5, Landroid/appwidget/AppWidgetManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$84;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$84;-><init>()V

    const-string v7, "appwidget"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1105
    const-class v5, Landroid/media/midi/MidiManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$85;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$85;-><init>()V

    const-string/jumbo v7, "midi"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1113
    const-class v5, Landroid/hardware/radio/RadioManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$86;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$86;-><init>()V

    const-string v7, "broadcastradio"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1120
    const-class v5, Landroid/os/HardwarePropertiesManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$87;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$87;-><init>()V

    const-string v7, "hardware_properties"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1130
    const-class v5, Landroid/media/soundtrigger/SoundTriggerManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$88;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$88;-><init>()V

    const-string/jumbo v7, "soundtrigger"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1138
    const-class v5, Landroid/content/pm/ShortcutManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$89;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$89;-><init>()V

    const-string/jumbo v7, "shortcut"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1146
    const-class v5, Landroid/content/om/OverlayManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$90;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$90;-><init>()V

    const-string/jumbo v7, "overlay"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1157
    const-class v5, Landroid/net/NetworkWatchlistManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$91;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$91;-><init>()V

    const-string/jumbo v7, "network_watchlist"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1168
    const-class v5, Landroid/os/health/SystemHealthManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$92;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$92;-><init>()V

    const-string/jumbo v7, "systemhealth"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1176
    const-class v5, Landroid/hardware/location/ContextHubManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$93;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$93;-><init>()V

    const-string v7, "contexthub"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1184
    const-class v5, Landroid/os/IncidentManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$94;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$94;-><init>()V

    const-string v7, "incident"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1191
    const-class v5, Landroid/os/BugreportManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$95;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$95;-><init>()V

    const-string v7, "bugreport"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1201
    const-class v5, Landroid/view/autofill/AutofillManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$96;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$96;-><init>()V

    const-string v7, "autofill"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1211
    const-class v5, Landroid/credentials/CredentialManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$97;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$97;-><init>()V

    const-string v7, "credential"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1224
    const-class v5, Landroid/media/musicrecognition/MusicRecognitionManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$98;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$98;-><init>()V

    const-string/jumbo v7, "music_recognition"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1235
    const-class v5, Landroid/view/contentcapture/ContentCaptureManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$99;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$99;-><init>()V

    const-string v7, "content_capture"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1258
    const-class v5, Landroid/view/translation/TranslationManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$100;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$100;-><init>()V

    const-string/jumbo v7, "translation"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1272
    const-class v5, Landroid/view/translation/UiTranslationManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$101;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$101;-><init>()V

    const-string/jumbo v7, "ui_translation"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1285
    const-class v5, Landroid/app/search/SearchUiManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$102;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$102;-><init>()V

    const-string/jumbo v7, "search_ui"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1295
    const-class v5, Landroid/app/smartspace/SmartspaceManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$103;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$103;-><init>()V

    const-string/jumbo v7, "smartspace"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1305
    const-class v5, Landroid/app/prediction/AppPredictionManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$104;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$104;-><init>()V

    const-string v7, "app_prediction"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1315
    const-class v5, Landroid/app/contentsuggestions/ContentSuggestionsManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$105;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$105;-><init>()V

    const-string v7, "content_suggestions"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1329
    const-class v5, Landroid/app/wallpapereffectsgeneration/WallpaperEffectsGenerationManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$106;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$106;-><init>()V

    const-string/jumbo v7, "wallpaper_effects_generation"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1343
    const-class v5, Landroid/app/VrManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$107;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$107;-><init>()V

    const-string/jumbo v7, "vrmanager"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1351
    const-class v5, Landroid/content/pm/CrossProfileApps;

    new-instance v6, Landroid/app/SystemServiceRegistry$108;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$108;-><init>()V

    const-string v7, "crossprofileapps"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1363
    const-class v5, Landroid/app/slice/SliceManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$109;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$109;-><init>()V

    const-string/jumbo v7, "slice"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1373
    const-class v5, Landroid/app/timedetector/TimeDetector;

    new-instance v6, Landroid/app/SystemServiceRegistry$110;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$110;-><init>()V

    const-string/jumbo v7, "time_detector"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1381
    const-class v5, Landroid/app/timezonedetector/TimeZoneDetector;

    new-instance v6, Landroid/app/SystemServiceRegistry$111;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$111;-><init>()V

    const-string/jumbo v7, "time_zone_detector"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1389
    const-class v5, Landroid/app/time/TimeManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$112;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$112;-><init>()V

    const-string/jumbo v7, "time_manager"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1397
    const-class v5, Landroid/permission/PermissionManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$113;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$113;-><init>()V

    const-string/jumbo v7, "permission"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1405
    const-class v5, Landroid/permission/LegacyPermissionManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$114;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$114;-><init>()V

    const-string v7, "legacy_permission"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1413
    const-class v5, Landroid/permission/PermissionControllerManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$115;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$115;-><init>()V

    const-string/jumbo v7, "permission_controller"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1421
    const-class v5, Landroid/permission/PermissionCheckerManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$116;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$116;-><init>()V

    const-string/jumbo v7, "permission_checker"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1429
    const-class v5, Landroid/os/PermissionEnforcer;

    new-instance v6, Landroid/app/SystemServiceRegistry$117;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$117;-><init>()V

    const-string/jumbo v7, "permission_enforcer"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1437
    const-class v5, Landroid/os/image/DynamicSystemManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$118;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$118;-><init>()V

    const-string v7, "dynamic_system"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1448
    const-class v5, Landroid/os/BatteryStatsManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$119;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$119;-><init>()V

    const-string v7, "batterystats"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1458
    const-class v5, Landroid/content/pm/DataLoaderManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$120;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$120;-><init>()V

    const-string v7, "dataloader_manager"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1467
    const-class v5, Landroid/hardware/lights/LightsManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$121;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$121;-><init>()V

    const-string v7, "lights"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1474
    const-class v5, Landroid/app/LocaleManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$122;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$122;-><init>()V

    const-string v7, "locale"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1482
    const-class v5, Landroid/os/incremental/IncrementalManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$123;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$123;-><init>()V

    const-string v7, "incremental"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1494
    const-class v5, Landroid/security/FileIntegrityManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$124;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$124;-><init>()V

    const-string v7, "file_integrity"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1505
    const-class v5, Landroid/security/attestationverification/AttestationVerificationManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$125;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$125;-><init>()V

    const-string v7, "attestation_verification"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1518
    const-class v5, Landroid/content/integrity/AppIntegrityManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$126;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$126;-><init>()V

    const-string v7, "app_integrity"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1526
    const-class v5, Landroid/apphibernation/AppHibernationManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$127;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$127;-><init>()V

    const-string v7, "app_hibernation"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1533
    const-class v5, Landroid/app/DreamManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$128;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$128;-><init>()V

    const-string v7, "dream"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1540
    const-class v5, Landroid/hardware/devicestate/DeviceStateManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$129;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$129;-><init>()V

    const-string v7, "device_state"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1547
    const-class v5, Landroid/media/metrics/MediaMetricsManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$130;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$130;-><init>()V

    const-string/jumbo v7, "media_metrics"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1559
    const-class v5, Landroid/app/GameManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$131;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$131;-><init>()V

    const-string v7, "game"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1569
    const-class v5, Landroid/content/pm/verify/domain/DomainVerificationManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$132;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$132;-><init>()V

    const-string v7, "domain_verification"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1582
    const-class v5, Landroid/view/displayhash/DisplayHashManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$133;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$133;-><init>()V

    const-string v7, "display_hash"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1590
    const-class v5, Landroid/app/ambientcontext/AmbientContextManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$134;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$134;-><init>()V

    const-string v7, "ambient_context"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1602
    const-class v5, Landroid/app/wearable/WearableSensingManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$135;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$135;-><init>()V

    const-string/jumbo v7, "wearable_sensing"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1614
    const-class v5, Landroid/app/GrammaticalInflectionManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$136;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$136;-><init>()V

    const-string v7, "grammatical_inflection"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1625
    const-class v5, Landroid/net/wifi/sharedconnectivity/app/SharedConnectivityManager;

    new-instance v6, Landroid/app/SystemServiceRegistry$137;

    invoke-direct {v6}, Landroid/app/SystemServiceRegistry$137;-><init>()V

    const-string/jumbo v7, "shared_connectivity"

    invoke-static {v7, v5, v6}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1633
    sput-boolean v3, Landroid/app/SystemServiceRegistry;->sInitializing:Z

    .line 1637
    :try_start_721
    invoke-static {}, Landroid/net/ConnectivityFrameworkInitializer;->registerServiceWrappers()V

    .line 1638
    invoke-static {}, Landroid/app/job/JobSchedulerFrameworkInitializer;->registerServiceWrappers()V

    .line 1639
    invoke-static {}, Landroid/app/blob/BlobStoreManagerFrameworkInitializer;->initialize()V

    .line 1640
    invoke-static {}, Landroid/bluetooth/BluetoothFrameworkInitializer;->registerServiceWrappers()V

    .line 1641
    invoke-static {}, Landroid/nfc/NfcFrameworkInitializer;->registerServiceWrappers()V

    .line 1642
    invoke-static {}, Landroid/telephony/TelephonyFrameworkInitializer;->registerServiceWrappers()V

    .line 1643
    invoke-static {}, Landroid/app/appsearch/AppSearchManagerFrameworkInitializer;->initialize()V

    .line 1644
    invoke-static {}, Landroid/health/connect/HealthServicesInitializer;->registerServiceWrappers()V

    .line 1645
    invoke-static {}, Landroid/net/wifi/WifiFrameworkInitializer;->registerServiceWrappers()V

    .line 1646
    invoke-static {}, Landroid/os/StatsFrameworkInitializer;->registerServiceWrappers()V

    .line 1647
    invoke-static {}, Landroid/content/rollback/RollbackManagerFrameworkInitializer;->initialize()V

    .line 1648
    invoke-static {}, Landroid/media/MediaFrameworkPlatformInitializer;->registerServiceWrappers()V

    .line 1649
    invoke-static {}, Landroid/media/MediaFrameworkInitializer;->registerServiceWrappers()V

    .line 1650
    invoke-static {}, Landroid/app/role/RoleFrameworkInitializer;->registerServiceWrappers()V

    .line 1651
    invoke-static {}, Landroid/scheduling/SchedulingFrameworkInitializer;->registerServiceWrappers()V

    .line 1652
    invoke-static {}, Landroid/app/sdksandbox/SdkSandboxManagerFrameworkInitializer;->registerServiceWrappers()V

    .line 1653
    invoke-static {}, Landroid/adservices/AdServicesFrameworkInitializer;->registerServiceWrappers()V

    .line 1654
    invoke-static {}, Landroid/uwb/UwbFrameworkInitializer;->registerServiceWrappers()V

    .line 1655
    invoke-static {}, Landroid/safetycenter/SafetyCenterFrameworkInitializer;->registerServiceWrappers()V

    .line 1656
    invoke-static {}, Landroid/net/ConnectivityFrameworkInitializerTiramisu;->registerServiceWrappers()V

    .line 1657
    invoke-static {}, Landroid/nearby/NearbyFrameworkInitializer;->registerServiceWrappers()V

    .line 1658
    invoke-static {}, Landroid/ondevicepersonalization/OnDevicePersonalizationFrameworkInitializer;->registerServiceWrappers()V

    .line 1659
    invoke-static {}, Landroid/devicelock/DeviceLockFrameworkInitializer;->registerServiceWrappers()V

    .line 1660
    invoke-static {}, Landroid/system/virtualmachine/VirtualizationFrameworkInitializer;->registerServiceWrappers()V
    :try_end_769
    .catchall {:try_start_721 .. :try_end_769} :catchall_779

    .line 1664
    sput-boolean v0, Landroid/app/SystemServiceRegistry;->sInitializing:Z

    .line 1665
    nop

    .line 1667
    invoke-static {}, Landroid/app/SystemServiceRegistry;->regMtkService()Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Landroid/app/SystemServiceRegistry;->sMtkServiceRegistryClass:Ljava/lang/Class;

    .line 1668
    invoke-static {}, Landroid/app/SystemServiceRegistry;->setMtkSystemServiceName()V

    .line 1669
    invoke-static {}, Landroid/app/SystemServiceRegistry;->registerAllMtkService()V

    .line 1671
    .end local v1    # "hasPdb":Z
    .end local v2    # "PayJoyCarrier":Ljava/lang/String;
    .end local v4    # "hasOEMVendorLock":Z
    return-void

    .line 1664
    .restart local v1    # "hasPdb":Z
    .restart local v2    # "PayJoyCarrier":Ljava/lang/String;
    .restart local v4    # "hasOEMVendorLock":Z
    :catchall_779
    move-exception v3

    sput-boolean v0, Landroid/app/SystemServiceRegistry;->sInitializing:Z

    .line 1665
    throw v3
.end method

.method private constructor blacklist <init>()V
    .registers 1

    .line 303
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static blacklist createServiceCache()[Ljava/lang/Object;
    .registers 1

    .line 1683
    sget v0, Landroid/app/SystemServiceRegistry;->sServiceCacheSize:I

    new-array v0, v0, [Ljava/lang/Object;

    return-object v0
.end method

.method private static blacklist ensureInitializing(Ljava/lang/String;)V
    .registers 4
    .param p0, "methodName"    # Ljava/lang/String;

    .line 1675
    sget-boolean v0, Landroid/app/SystemServiceRegistry;->sInitializing:Z

    const-string v1, "Internal error: %s can only be called during class initialization."

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/android/internal/util/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 1677
    return-void
.end method

.method public static blacklist getSystemService(Landroid/app/ContextImpl;Ljava/lang/String;)Ljava/lang/Object;
    .registers 8
    .param p0, "ctx"    # Landroid/app/ContextImpl;
    .param p1, "name"    # Ljava/lang/String;

    .line 1691
    const/4 v0, 0x0

    if-nez p1, :cond_4

    .line 1692
    return-object v0

    .line 1694
    :cond_4
    sget-object v1, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_FETCHERS:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/SystemServiceRegistry$ServiceFetcher;

    .line 1695
    .local v1, "fetcher":Landroid/app/SystemServiceRegistry$ServiceFetcher;, "Landroid/app/SystemServiceRegistry$ServiceFetcher<*>;"
    const-string v2, "SystemServiceRegistry"

    if-nez v1, :cond_2b

    .line 1696
    sget-boolean v3, Landroid/app/SystemServiceRegistry;->sEnableServiceNotFoundWtf:Z

    if-eqz v3, :cond_2a

    .line 1697
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown manager requested: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 1699
    :cond_2a
    return-object v0

    .line 1702
    :cond_2b
    invoke-interface {v1, p0}, Landroid/app/SystemServiceRegistry$ServiceFetcher;->getService(Landroid/app/ContextImpl;)Ljava/lang/Object;

    move-result-object v3

    .line 1703
    .local v3, "ret":Ljava/lang/Object;
    sget-boolean v4, Landroid/app/SystemServiceRegistry;->sEnableServiceNotFoundWtf:Z

    if-eqz v4, :cond_a1

    if-nez v3, :cond_a1

    .line 1705
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_a2

    :cond_3c
    goto :goto_85

    :sswitch_3d
    const-string v4, "incremental"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    const/4 v4, 0x2

    goto :goto_86

    :sswitch_47
    const-string v4, "content_capture"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    const/4 v4, 0x0

    goto :goto_86

    :sswitch_51
    const-string/jumbo v4, "virtualdevice"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    const/4 v4, 0x6

    goto :goto_86

    :sswitch_5c
    const-string v4, "contexthub"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    const/4 v4, 0x4

    goto :goto_86

    :sswitch_66
    const-string/jumbo v4, "virtualization"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    const/4 v4, 0x5

    goto :goto_86

    :sswitch_71
    const-string v4, "app_prediction"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    const/4 v4, 0x1

    goto :goto_86

    :sswitch_7b
    const-string v4, "ethernet"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    const/4 v4, 0x3

    goto :goto_86

    :goto_85
    const/4 v4, -0x1

    :goto_86
    packed-switch v4, :pswitch_data_c0

    .line 1715
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Manager wrapper not available: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 1716
    return-object v0

    .line 1713
    :pswitch_a0
    return-object v0

    .line 1718
    :cond_a1
    return-object v3

    :sswitch_data_a2
    .sparse-switch
        -0x5499b029 -> :sswitch_7b
        -0x2dd60a93 -> :sswitch_71
        0x35db2f9 -> :sswitch_66
        0x1051cce6 -> :sswitch_5c
        0x38858921 -> :sswitch_51
        0x3a1b1980 -> :sswitch_47
        0x40b177da -> :sswitch_3d
    .end sparse-switch

    :pswitch_data_c0
    .packed-switch 0x0
        :pswitch_a0
        :pswitch_a0
        :pswitch_a0
        :pswitch_a0
        :pswitch_a0
        :pswitch_a0
        :pswitch_a0
    .end packed-switch
.end method

.method public static blacklist getSystemServiceClassName(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 1757
    sget-object v0, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_CLASS_NAMES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static blacklist getSystemServiceName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1726
    .local p0, "serviceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p0, :cond_4

    .line 1727
    const/4 v0, 0x0

    return-object v0

    .line 1729
    :cond_4
    sget-object v0, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_NAMES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1730
    .local v0, "serviceName":Ljava/lang/String;
    sget-boolean v1, Landroid/app/SystemServiceRegistry;->sEnableServiceNotFoundWtf:Z

    if-eqz v1, :cond_2e

    if-nez v0, :cond_2e

    .line 1732
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown manager requested: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SystemServiceRegistry"

    invoke-static {v2, v1}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 1734
    :cond_2e
    return-object v0
.end method

.method public static blacklist onServiceNotFound(Landroid/os/ServiceManager$ServiceNotFoundException;)V
    .registers 4
    .param p0, "e"    # Landroid/os/ServiceManager$ServiceNotFoundException;

    .line 2104
    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v0

    const/16 v1, 0x2710

    const-string v2, "SystemServiceRegistry"

    if-ge v0, v1, :cond_12

    .line 2105
    invoke-virtual {p0}, Landroid/os/ServiceManager$ServiceNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_19

    .line 2107
    :cond_12
    invoke-virtual {p0}, Landroid/os/ServiceManager$ServiceNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2109
    :goto_19
    return-void
.end method

.method private static blacklist regMtkService()Ljava/lang/Class;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 2113
    const-string/jumbo v0, "regMtkService start"

    const-string v1, "SystemServiceRegistry"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2115
    :try_start_8
    const-string/jumbo v0, "mediatek.app.MtkSystemServiceRegistry"

    .line 2116
    .local v0, "className":Ljava/lang/String;
    const-string/jumbo v2, "system_ext/framework/mediatek-framework.jar"

    .line 2117
    .local v2, "mtkSServerPackage":Ljava/lang/String;
    new-instance v3, Ldalvik/system/PathClassLoader;

    const-class v4, Landroid/app/SystemServiceRegistry;

    .line 2118
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 2119
    .local v3, "mtkSsLoader":Ldalvik/system/PathClassLoader;
    const/4 v4, 0x0

    invoke-static {v0, v4, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1e} :catch_1f

    return-object v1

    .line 2120
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "mtkSServerPackage":Ljava/lang/String;
    .end local v3    # "mtkSsLoader":Ldalvik/system/PathClassLoader;
    :catch_1f
    move-exception v0

    .line 2121
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "regMtkService:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2122
    const/4 v1, 0x0

    return-object v1
.end method

.method private static blacklist registerAllMtkService()V
    .registers 5

    .line 2141
    const-string/jumbo v0, "registerAllMtkService start"

    const-string v1, "SystemServiceRegistry"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2143
    :try_start_8
    sget-object v0, Landroid/app/SystemServiceRegistry;->sMtkServiceRegistryClass:Ljava/lang/Class;

    if-eqz v0, :cond_1b

    .line 2144
    const-string/jumbo v2, "registerAllService"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 2145
    .local v2, "method":Ljava/lang/reflect/Method;
    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1b} :catch_1c

    .line 2149
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :cond_1b
    goto :goto_37

    .line 2147
    :catch_1c
    move-exception v0

    .line 2148
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createMtkSystemServer"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2150
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_37
    return-void
.end method

.method public static whitelist registerContextAwareService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithBinder;)V
    .registers 4
    .param p0, "serviceName"    # Ljava/lang/String;
    .annotation runtime Landroid/annotation/SystemApi;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TServiceClass:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TTServiceClass;>;",
            "Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithBinder<",
            "TTServiceClass;>;)V"
        }
    .end annotation

    .line 1917
    .local p1, "serviceWrapperClass":Ljava/lang/Class;, "Ljava/lang/Class<TTServiceClass;>;"
    .local p2, "serviceProducer":Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithBinder;, "Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithBinder<TTServiceClass;>;"
    const-string/jumbo v0, "registerContextAwareService"

    invoke-static {v0}, Landroid/app/SystemServiceRegistry;->ensureInitializing(Ljava/lang/String;)V

    .line 1918
    invoke-static {p0}, Lcom/android/internal/util/Preconditions;->checkStringNotEmpty(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1919
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1920
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1922
    new-instance v0, Landroid/app/SystemServiceRegistry$140;

    invoke-direct {v0, p2, p0}, Landroid/app/SystemServiceRegistry$140;-><init>(Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithBinder;Ljava/lang/String;)V

    invoke-static {p0, p1, v0}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1931
    return-void
.end method

.method public static whitelist registerContextAwareService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithoutBinder;)V
    .registers 4
    .param p0, "serviceName"    # Ljava/lang/String;
    .annotation runtime Landroid/annotation/SystemApi;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TServiceClass:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TTServiceClass;>;",
            "Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithoutBinder<",
            "TTServiceClass;>;)V"
        }
    .end annotation

    .line 1945
    .local p1, "serviceWrapperClass":Ljava/lang/Class;, "Ljava/lang/Class<TTServiceClass;>;"
    .local p2, "serviceProducer":Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithoutBinder;, "Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithoutBinder<TTServiceClass;>;"
    const-string/jumbo v0, "registerContextAwareService"

    invoke-static {v0}, Landroid/app/SystemServiceRegistry;->ensureInitializing(Ljava/lang/String;)V

    .line 1946
    invoke-static {p0}, Lcom/android/internal/util/Preconditions;->checkStringNotEmpty(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1947
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1948
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1950
    new-instance v0, Landroid/app/SystemServiceRegistry$141;

    invoke-direct {v0, p2}, Landroid/app/SystemServiceRegistry$141;-><init>(Landroid/app/SystemServiceRegistry$ContextAwareServiceProducerWithoutBinder;)V

    invoke-static {p0, p1, v0}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1956
    return-void
.end method

.method private static blacklist registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V
    .registers 5
    .param p0, "serviceName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Landroid/app/SystemServiceRegistry$ServiceFetcher<",
            "TT;>;)V"
        }
    .end annotation

    .line 1743
    .local p1, "serviceClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "serviceFetcher":Landroid/app/SystemServiceRegistry$ServiceFetcher;, "Landroid/app/SystemServiceRegistry$ServiceFetcher<TT;>;"
    sget-object v0, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_NAMES:Ljava/util/Map;

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1744
    sget-object v0, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_FETCHERS:Ljava/util/Map;

    invoke-interface {v0, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1745
    sget-object v0, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_CLASS_NAMES:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1746
    return-void
.end method

.method public static whitelist registerStaticService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$StaticServiceProducerWithBinder;)V
    .registers 4
    .param p0, "serviceName"    # Ljava/lang/String;
    .annotation runtime Landroid/annotation/SystemApi;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TServiceClass:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TTServiceClass;>;",
            "Landroid/app/SystemServiceRegistry$StaticServiceProducerWithBinder<",
            "TTServiceClass;>;)V"
        }
    .end annotation

    .line 1860
    .local p1, "serviceWrapperClass":Ljava/lang/Class;, "Ljava/lang/Class<TTServiceClass;>;"
    .local p2, "serviceProducer":Landroid/app/SystemServiceRegistry$StaticServiceProducerWithBinder;, "Landroid/app/SystemServiceRegistry$StaticServiceProducerWithBinder<TTServiceClass;>;"
    const-string/jumbo v0, "registerStaticService"

    invoke-static {v0}, Landroid/app/SystemServiceRegistry;->ensureInitializing(Ljava/lang/String;)V

    .line 1861
    invoke-static {p0}, Lcom/android/internal/util/Preconditions;->checkStringNotEmpty(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1862
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1863
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1865
    new-instance v0, Landroid/app/SystemServiceRegistry$138;

    invoke-direct {v0, p2, p0}, Landroid/app/SystemServiceRegistry$138;-><init>(Landroid/app/SystemServiceRegistry$StaticServiceProducerWithBinder;Ljava/lang/String;)V

    invoke-static {p0, p1, v0}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1872
    return-void
.end method

.method public static whitelist registerStaticService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$StaticServiceProducerWithoutBinder;)V
    .registers 4
    .param p0, "serviceName"    # Ljava/lang/String;
    .annotation runtime Landroid/annotation/SystemApi;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TServiceClass:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TTServiceClass;>;",
            "Landroid/app/SystemServiceRegistry$StaticServiceProducerWithoutBinder<",
            "TTServiceClass;>;)V"
        }
    .end annotation

    .line 1884
    .local p1, "serviceWrapperClass":Ljava/lang/Class;, "Ljava/lang/Class<TTServiceClass;>;"
    .local p2, "serviceProducer":Landroid/app/SystemServiceRegistry$StaticServiceProducerWithoutBinder;, "Landroid/app/SystemServiceRegistry$StaticServiceProducerWithoutBinder<TTServiceClass;>;"
    const-string/jumbo v0, "registerStaticService"

    invoke-static {v0}, Landroid/app/SystemServiceRegistry;->ensureInitializing(Ljava/lang/String;)V

    .line 1885
    invoke-static {p0}, Lcom/android/internal/util/Preconditions;->checkStringNotEmpty(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1886
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1887
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1889
    new-instance v0, Landroid/app/SystemServiceRegistry$139;

    invoke-direct {v0, p2}, Landroid/app/SystemServiceRegistry$139;-><init>(Landroid/app/SystemServiceRegistry$StaticServiceProducerWithoutBinder;)V

    invoke-static {p0, p1, v0}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V

    .line 1895
    return-void
.end method

.method private static blacklist setMtkSystemServiceName()V
    .registers 8

    .line 2127
    const-string/jumbo v0, "setMtkSystemServiceName"

    const-string/jumbo v1, "setMtkSystemServiceName start"

    const-string v2, "SystemServiceRegistry"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2129
    :try_start_b
    sget-object v1, Landroid/app/SystemServiceRegistry;->sMtkServiceRegistryClass:Ljava/lang/Class;

    if-eqz v1, :cond_2d

    .line 2130
    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/util/ArrayMap;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Landroid/util/ArrayMap;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    invoke-virtual {v1, v0, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 2132
    .local v4, "method":Ljava/lang/reflect/Method;
    new-array v3, v3, [Ljava/lang/Object;

    sget-object v5, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_NAMES:Ljava/util/Map;

    aput-object v5, v3, v6

    sget-object v5, Landroid/app/SystemServiceRegistry;->SYSTEM_SERVICE_FETCHERS:Ljava/util/Map;

    aput-object v5, v3, v7

    invoke-virtual {v4, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_2d} :catch_2e

    .line 2137
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :cond_2d
    goto :goto_47

    .line 2135
    :catch_2e
    move-exception v1

    .line 2136
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2138
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_47
    return-void
.end method
