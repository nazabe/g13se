.class public abstract Landroid/hardware/display/IDisplayManager$Stub;
.super Landroid/os/Binder;
.source "IDisplayManager.java"

# interfaces
.implements Landroid/hardware/display/IDisplayManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/display/IDisplayManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/display/IDisplayManager$Stub$Proxy;
    }
.end annotation


# static fields
.field public static final greylist-max-o DESCRIPTOR:Ljava/lang/String; = "android.hardware.display.IDisplayManager"

.field static final blacklist TRANSACTION_areUserDisabledHdrTypesAllowed:I = 0x11

.field static final greylist-max-o TRANSACTION_connectWifiDisplay:I = 0x8

.field static final greylist-max-o TRANSACTION_createVirtualDisplay:I = 0x15

.field static final greylist-max-o TRANSACTION_disconnectWifiDisplay:I = 0x9

.field static final greylist-max-o TRANSACTION_forgetWifiDisplay:I = 0xb

.field static final greylist-max-o TRANSACTION_getAmbientBrightnessStats:I = 0x1c

.field static final blacklist TRANSACTION_getBrightness:I = 0x25

.field static final blacklist TRANSACTION_getBrightnessConfigurationForDisplay:I = 0x1f

.field static final greylist-max-o TRANSACTION_getBrightnessConfigurationForUser:I = 0x20

.field static final greylist-max-o TRANSACTION_getBrightnessEvents:I = 0x1b

.field static final blacklist TRANSACTION_getBrightnessInfo:I = 0x28

.field static final greylist-max-o TRANSACTION_getDefaultBrightnessConfiguration:I = 0x21

.field static final blacklist TRANSACTION_getDisplayDecorationSupport:I = 0x35

.field static final greylist-max-o TRANSACTION_getDisplayIds:I = 0x2

.field static final greylist-max-o TRANSACTION_getDisplayInfo:I = 0x1

.field static final blacklist TRANSACTION_getHdrConversionMode:I = 0x2f

.field static final blacklist TRANSACTION_getHdrConversionModeSetting:I = 0x2e

.field static final greylist-max-o TRANSACTION_getMinimumBrightnessCurve:I = 0x27

.field static final blacklist TRANSACTION_getOverlaySupport:I = 0x37

.field static final blacklist TRANSACTION_getPreferredWideGamutColorSpaceId:I = 0x29

.field static final blacklist TRANSACTION_getRefreshRateSwitchingType:I = 0x34

.field static final greylist-max-o TRANSACTION_getStableDisplaySize:I = 0x1a

.field static final blacklist TRANSACTION_getSupportedHdrOutputTypes:I = 0x30

.field static final blacklist TRANSACTION_getSystemPreferredDisplayMode:I = 0x2c

.field static final blacklist TRANSACTION_getUserDisabledHdrTypes:I = 0x12

.field static final blacklist TRANSACTION_getUserPreferredDisplayMode:I = 0x2b

.field static final greylist-max-o TRANSACTION_getWifiDisplayStatus:I = 0xe

.field static final blacklist TRANSACTION_isMinimalPostProcessingRequested:I = 0x22

.field static final blacklist TRANSACTION_isUidPresentOnDisplay:I = 0x3

.field static final blacklist TRANSACTION_overrideHdrTypes:I = 0x13

.field static final greylist-max-o TRANSACTION_pauseWifiDisplay:I = 0xc

.field static final greylist-max-o TRANSACTION_registerCallback:I = 0x4

.field static final blacklist TRANSACTION_registerCallbackWithEventMask:I = 0x5

.field static final greylist-max-o TRANSACTION_releaseVirtualDisplay:I = 0x18

.field static final greylist-max-o TRANSACTION_renameWifiDisplay:I = 0xa

.field static final greylist-max-o TRANSACTION_requestColorMode:I = 0x14

.field static final greylist-max-o TRANSACTION_resizeVirtualDisplay:I = 0x16

.field static final greylist-max-o TRANSACTION_resumeWifiDisplay:I = 0xd

.field static final blacklist TRANSACTION_setAreUserDisabledHdrTypesAllowed:I = 0x10

.field static final blacklist TRANSACTION_setBrightness:I = 0x24

.field static final blacklist TRANSACTION_setBrightnessConfigurationForDisplay:I = 0x1e

.field static final greylist-max-o TRANSACTION_setBrightnessConfigurationForUser:I = 0x1d

.field static final blacklist TRANSACTION_setDisplayIdToMirror:I = 0x36

.field static final blacklist TRANSACTION_setHdrConversionMode:I = 0x2d

.field static final blacklist TRANSACTION_setRefreshRateSwitchingType:I = 0x33

.field static final blacklist TRANSACTION_setShouldAlwaysRespectAppRequestedMode:I = 0x31

.field static final greylist-max-o TRANSACTION_setTemporaryAutoBrightnessAdjustment:I = 0x26

.field static final greylist-max-o TRANSACTION_setTemporaryBrightness:I = 0x23

.field static final blacklist TRANSACTION_setUserDisabledHdrTypes:I = 0xf

.field static final blacklist TRANSACTION_setUserPreferredDisplayMode:I = 0x2a

.field static final blacklist TRANSACTION_setVirtualDisplayState:I = 0x19

.field static final greylist-max-o TRANSACTION_setVirtualDisplaySurface:I = 0x17

.field static final blacklist TRANSACTION_shouldAlwaysRespectAppRequestedMode:I = 0x32

.field static final greylist-max-o TRANSACTION_startWifiDisplayScan:I = 0x6

.field static final greylist-max-o TRANSACTION_stopWifiDisplayScan:I = 0x7


# direct methods
.method public constructor greylist-max-o <init>()V
    .registers 2

    .line 273
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 274
    const-string v0, "android.hardware.display.IDisplayManager"

    invoke-virtual {p0, p0, v0}, Landroid/hardware/display/IDisplayManager$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 275
    return-void
.end method

.method public static greylist asInterface(Landroid/os/IBinder;)Landroid/hardware/display/IDisplayManager;
    .registers 3
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 282
    if-nez p0, :cond_4

    .line 283
    const/4 v0, 0x0

    return-object v0

    .line 285
    :cond_4
    const-string v0, "android.hardware.display.IDisplayManager"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 286
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_14

    instance-of v1, v0, Landroid/hardware/display/IDisplayManager;

    if-eqz v1, :cond_14

    .line 287
    move-object v1, v0

    check-cast v1, Landroid/hardware/display/IDisplayManager;

    return-object v1

    .line 289
    :cond_14
    new-instance v1, Landroid/hardware/display/IDisplayManager$Stub$Proxy;

    invoke-direct {v1, p0}, Landroid/hardware/display/IDisplayManager$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method

.method public static blacklist getDefaultTransactionName(I)Ljava/lang/String;
    .registers 2
    .param p0, "transactionCode"    # I

    .line 298
    packed-switch p0, :pswitch_data_c4

    .line 522
    const/4 v0, 0x0

    return-object v0

    .line 518
    :pswitch_5
    const-string v0, "getOverlaySupport"

    return-object v0

    .line 514
    :pswitch_8
    const-string/jumbo v0, "setDisplayIdToMirror"

    return-object v0

    .line 510
    :pswitch_c
    const-string v0, "getDisplayDecorationSupport"

    return-object v0

    .line 506
    :pswitch_f
    const-string v0, "getRefreshRateSwitchingType"

    return-object v0

    .line 502
    :pswitch_12
    const-string/jumbo v0, "setRefreshRateSwitchingType"

    return-object v0

    .line 498
    :pswitch_16
    const-string/jumbo v0, "shouldAlwaysRespectAppRequestedMode"

    return-object v0

    .line 494
    :pswitch_1a
    const-string/jumbo v0, "setShouldAlwaysRespectAppRequestedMode"

    return-object v0

    .line 490
    :pswitch_1e
    const-string v0, "getSupportedHdrOutputTypes"

    return-object v0

    .line 486
    :pswitch_21
    const-string v0, "getHdrConversionMode"

    return-object v0

    .line 482
    :pswitch_24
    const-string v0, "getHdrConversionModeSetting"

    return-object v0

    .line 478
    :pswitch_27
    const-string/jumbo v0, "setHdrConversionMode"

    return-object v0

    .line 474
    :pswitch_2b
    const-string v0, "getSystemPreferredDisplayMode"

    return-object v0

    .line 470
    :pswitch_2e
    const-string v0, "getUserPreferredDisplayMode"

    return-object v0

    .line 466
    :pswitch_31
    const-string/jumbo v0, "setUserPreferredDisplayMode"

    return-object v0

    .line 462
    :pswitch_35
    const-string v0, "getPreferredWideGamutColorSpaceId"

    return-object v0

    .line 458
    :pswitch_38
    const-string v0, "getBrightnessInfo"

    return-object v0

    .line 454
    :pswitch_3b
    const-string v0, "getMinimumBrightnessCurve"

    return-object v0

    .line 450
    :pswitch_3e
    const-string/jumbo v0, "setTemporaryAutoBrightnessAdjustment"

    return-object v0

    .line 446
    :pswitch_42
    const-string v0, "getBrightness"

    return-object v0

    .line 442
    :pswitch_45
    const-string/jumbo v0, "setBrightness"

    return-object v0

    .line 438
    :pswitch_49
    const-string/jumbo v0, "setTemporaryBrightness"

    return-object v0

    .line 434
    :pswitch_4d
    const-string v0, "isMinimalPostProcessingRequested"

    return-object v0

    .line 430
    :pswitch_50
    const-string v0, "getDefaultBrightnessConfiguration"

    return-object v0

    .line 426
    :pswitch_53
    const-string v0, "getBrightnessConfigurationForUser"

    return-object v0

    .line 422
    :pswitch_56
    const-string v0, "getBrightnessConfigurationForDisplay"

    return-object v0

    .line 418
    :pswitch_59
    const-string/jumbo v0, "setBrightnessConfigurationForDisplay"

    return-object v0

    .line 414
    :pswitch_5d
    const-string/jumbo v0, "setBrightnessConfigurationForUser"

    return-object v0

    .line 410
    :pswitch_61
    const-string v0, "getAmbientBrightnessStats"

    return-object v0

    .line 406
    :pswitch_64
    const-string v0, "getBrightnessEvents"

    return-object v0

    .line 402
    :pswitch_67
    const-string v0, "getStableDisplaySize"

    return-object v0

    .line 398
    :pswitch_6a
    const-string/jumbo v0, "setVirtualDisplayState"

    return-object v0

    .line 394
    :pswitch_6e
    const-string/jumbo v0, "releaseVirtualDisplay"

    return-object v0

    .line 390
    :pswitch_72
    const-string/jumbo v0, "setVirtualDisplaySurface"

    return-object v0

    .line 386
    :pswitch_76
    const-string/jumbo v0, "resizeVirtualDisplay"

    return-object v0

    .line 382
    :pswitch_7a
    const-string v0, "createVirtualDisplay"

    return-object v0

    .line 378
    :pswitch_7d
    const-string/jumbo v0, "requestColorMode"

    return-object v0

    .line 374
    :pswitch_81
    const-string/jumbo v0, "overrideHdrTypes"

    return-object v0

    .line 370
    :pswitch_85
    const-string v0, "getUserDisabledHdrTypes"

    return-object v0

    .line 366
    :pswitch_88
    const-string v0, "areUserDisabledHdrTypesAllowed"

    return-object v0

    .line 362
    :pswitch_8b
    const-string/jumbo v0, "setAreUserDisabledHdrTypesAllowed"

    return-object v0

    .line 358
    :pswitch_8f
    const-string/jumbo v0, "setUserDisabledHdrTypes"

    return-object v0

    .line 354
    :pswitch_93
    const-string v0, "getWifiDisplayStatus"

    return-object v0

    .line 350
    :pswitch_96
    const-string/jumbo v0, "resumeWifiDisplay"

    return-object v0

    .line 346
    :pswitch_9a
    const-string/jumbo v0, "pauseWifiDisplay"

    return-object v0

    .line 342
    :pswitch_9e
    const-string v0, "forgetWifiDisplay"

    return-object v0

    .line 338
    :pswitch_a1
    const-string/jumbo v0, "renameWifiDisplay"

    return-object v0

    .line 334
    :pswitch_a5
    const-string v0, "disconnectWifiDisplay"

    return-object v0

    .line 330
    :pswitch_a8
    const-string v0, "connectWifiDisplay"

    return-object v0

    .line 326
    :pswitch_ab
    const-string/jumbo v0, "stopWifiDisplayScan"

    return-object v0

    .line 322
    :pswitch_af
    const-string/jumbo v0, "startWifiDisplayScan"

    return-object v0

    .line 318
    :pswitch_b3
    const-string/jumbo v0, "registerCallbackWithEventMask"

    return-object v0

    .line 314
    :pswitch_b7
    const-string/jumbo v0, "registerCallback"

    return-object v0

    .line 310
    :pswitch_bb
    const-string v0, "isUidPresentOnDisplay"

    return-object v0

    .line 306
    :pswitch_be
    const-string v0, "getDisplayIds"

    return-object v0

    .line 302
    :pswitch_c1
    const-string v0, "getDisplayInfo"

    return-object v0

    :pswitch_data_c4
    .packed-switch 0x1
        :pswitch_c1
        :pswitch_be
        :pswitch_bb
        :pswitch_b7
        :pswitch_b3
        :pswitch_af
        :pswitch_ab
        :pswitch_a8
        :pswitch_a5
        :pswitch_a1
        :pswitch_9e
        :pswitch_9a
        :pswitch_96
        :pswitch_93
        :pswitch_8f
        :pswitch_8b
        :pswitch_88
        :pswitch_85
        :pswitch_81
        :pswitch_7d
        :pswitch_7a
        :pswitch_76
        :pswitch_72
        :pswitch_6e
        :pswitch_6a
        :pswitch_67
        :pswitch_64
        :pswitch_61
        :pswitch_5d
        :pswitch_59
        :pswitch_56
        :pswitch_53
        :pswitch_50
        :pswitch_4d
        :pswitch_49
        :pswitch_45
        :pswitch_42
        :pswitch_3e
        :pswitch_3b
        :pswitch_38
        :pswitch_35
        :pswitch_31
        :pswitch_2e
        :pswitch_2b
        :pswitch_27
        :pswitch_24
        :pswitch_21
        :pswitch_1e
        :pswitch_1a
        :pswitch_16
        :pswitch_12
        :pswitch_f
        :pswitch_c
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public whitelist asBinder()Landroid/os/IBinder;
    .registers 1

    .line 293
    return-object p0
.end method

.method public blacklist getMaxTransactionId()I
    .registers 2

    .line 2110
    const/16 v0, 0x36

    return v0
.end method

.method public blacklist getTransactionName(I)Ljava/lang/String;
    .registers 3
    .param p1, "transactionCode"    # I

    .line 529
    invoke-static {p1}, Landroid/hardware/display/IDisplayManager$Stub;->getDefaultTransactionName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public whitelist onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 12
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 533
    const-string v0, "android.hardware.display.IDisplayManager"

    .line 534
    .local v0, "descriptor":Ljava/lang/String;
    const/4 v1, 0x1

    if-lt p1, v1, :cond_d

    const v2, 0xffffff

    if-gt p1, v2, :cond_d

    .line 535
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 537
    :cond_d
    packed-switch p1, :pswitch_data_3ca

    .line 545
    packed-switch p1, :pswitch_data_3d0

    .line 1060
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    return v1

    .line 541
    :pswitch_18
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 542
    return v1

    .line 1053
    :pswitch_1c
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getOverlaySupport()Landroid/hardware/OverlayProperties;

    move-result-object v2

    .line 1054
    .local v2, "_result":Landroid/hardware/OverlayProperties;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 1055
    invoke-virtual {p3, v2, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 1056
    goto/16 :goto_3c8

    .line 1043
    .end local v2    # "_result":Landroid/hardware/OverlayProperties;
    :pswitch_28
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    .line 1045
    .local v2, "_arg0":Landroid/os/IBinder;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 1046
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 1047
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->setDisplayIdToMirror(Landroid/os/IBinder;I)V

    .line 1048
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 1049
    goto/16 :goto_3c8

    .line 1033
    .end local v2    # "_arg0":Landroid/os/IBinder;
    .end local v3    # "_arg1":I
    :pswitch_3b
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 1034
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 1035
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->getDisplayDecorationSupport(I)Landroid/hardware/graphics/common/DisplayDecorationSupport;

    move-result-object v3

    .line 1036
    .local v3, "_result":Landroid/hardware/graphics/common/DisplayDecorationSupport;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 1037
    invoke-virtual {p3, v3, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 1038
    goto/16 :goto_3c8

    .line 1025
    .end local v2    # "_arg0":I
    .end local v3    # "_result":Landroid/hardware/graphics/common/DisplayDecorationSupport;
    :pswitch_4e
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getRefreshRateSwitchingType()I

    move-result v2

    .line 1026
    .local v2, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 1027
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1028
    goto/16 :goto_3c8

    .line 1017
    .end local v2    # "_result":I
    :pswitch_5a
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 1018
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 1019
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->setRefreshRateSwitchingType(I)V

    .line 1020
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 1021
    goto/16 :goto_3c8

    .line 1009
    .end local v2    # "_arg0":I
    :pswitch_69
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->shouldAlwaysRespectAppRequestedMode()Z

    move-result v2

    .line 1010
    .local v2, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 1011
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeBoolean(Z)V

    .line 1012
    goto/16 :goto_3c8

    .line 1001
    .end local v2    # "_result":Z
    :pswitch_75
    invoke-virtual {p2}, Landroid/os/Parcel;->readBoolean()Z

    move-result v2

    .line 1002
    .local v2, "_arg0":Z
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 1003
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->setShouldAlwaysRespectAppRequestedMode(Z)V

    .line 1004
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 1005
    goto/16 :goto_3c8

    .line 993
    .end local v2    # "_arg0":Z
    :pswitch_84
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getSupportedHdrOutputTypes()[I

    move-result-object v2

    .line 994
    .local v2, "_result":[I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 995
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 996
    goto/16 :goto_3c8

    .line 986
    .end local v2    # "_result":[I
    :pswitch_90
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getHdrConversionMode()Landroid/hardware/display/HdrConversionMode;

    move-result-object v2

    .line 987
    .local v2, "_result":Landroid/hardware/display/HdrConversionMode;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 988
    invoke-virtual {p3, v2, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 989
    goto/16 :goto_3c8

    .line 979
    .end local v2    # "_result":Landroid/hardware/display/HdrConversionMode;
    :pswitch_9c
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getHdrConversionModeSetting()Landroid/hardware/display/HdrConversionMode;

    move-result-object v2

    .line 980
    .restart local v2    # "_result":Landroid/hardware/display/HdrConversionMode;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 981
    invoke-virtual {p3, v2, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 982
    goto/16 :goto_3c8

    .line 971
    .end local v2    # "_result":Landroid/hardware/display/HdrConversionMode;
    :pswitch_a8
    sget-object v2, Landroid/hardware/display/HdrConversionMode;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/display/HdrConversionMode;

    .line 972
    .local v2, "_arg0":Landroid/hardware/display/HdrConversionMode;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 973
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->setHdrConversionMode(Landroid/hardware/display/HdrConversionMode;)V

    .line 974
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 975
    goto/16 :goto_3c8

    .line 961
    .end local v2    # "_arg0":Landroid/hardware/display/HdrConversionMode;
    :pswitch_bb
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 962
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 963
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->getSystemPreferredDisplayMode(I)Landroid/view/Display$Mode;

    move-result-object v3

    .line 964
    .local v3, "_result":Landroid/view/Display$Mode;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 965
    invoke-virtual {p3, v3, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 966
    goto/16 :goto_3c8

    .line 951
    .end local v2    # "_arg0":I
    .end local v3    # "_result":Landroid/view/Display$Mode;
    :pswitch_ce
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 952
    .restart local v2    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 953
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->getUserPreferredDisplayMode(I)Landroid/view/Display$Mode;

    move-result-object v3

    .line 954
    .restart local v3    # "_result":Landroid/view/Display$Mode;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 955
    invoke-virtual {p3, v3, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 956
    goto/16 :goto_3c8

    .line 940
    .end local v2    # "_arg0":I
    .end local v3    # "_result":Landroid/view/Display$Mode;
    :pswitch_e1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 942
    .restart local v2    # "_arg0":I
    sget-object v3, Landroid/view/Display$Mode;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/Display$Mode;

    .line 943
    .local v3, "_arg1":Landroid/view/Display$Mode;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 944
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->setUserPreferredDisplayMode(ILandroid/view/Display$Mode;)V

    .line 945
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 946
    goto/16 :goto_3c8

    .line 932
    .end local v2    # "_arg0":I
    .end local v3    # "_arg1":Landroid/view/Display$Mode;
    :pswitch_f8
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getPreferredWideGamutColorSpaceId()I

    move-result v2

    .line 933
    .local v2, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 934
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 935
    goto/16 :goto_3c8

    .line 923
    .end local v2    # "_result":I
    :pswitch_104
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 924
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 925
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->getBrightnessInfo(I)Landroid/hardware/display/BrightnessInfo;

    move-result-object v3

    .line 926
    .local v3, "_result":Landroid/hardware/display/BrightnessInfo;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 927
    invoke-virtual {p3, v3, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 928
    goto/16 :goto_3c8

    .line 915
    .end local v2    # "_arg0":I
    .end local v3    # "_result":Landroid/hardware/display/BrightnessInfo;
    :pswitch_117
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getMinimumBrightnessCurve()Landroid/hardware/display/Curve;

    move-result-object v2

    .line 916
    .local v2, "_result":Landroid/hardware/display/Curve;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 917
    invoke-virtual {p3, v2, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 918
    goto/16 :goto_3c8

    .line 907
    .end local v2    # "_result":Landroid/hardware/display/Curve;
    :pswitch_123
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    move-result v2

    .line 908
    .local v2, "_arg0":F
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 909
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->setTemporaryAutoBrightnessAdjustment(F)V

    .line 910
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 911
    goto/16 :goto_3c8

    .line 897
    .end local v2    # "_arg0":F
    :pswitch_132
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 898
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 899
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->getBrightness(I)F

    move-result v3

    .line 900
    .local v3, "_result":F
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 901
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeFloat(F)V

    .line 902
    goto/16 :goto_3c8

    .line 886
    .end local v2    # "_arg0":I
    .end local v3    # "_result":F
    :pswitch_145
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 888
    .restart local v2    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    move-result v3

    .line 889
    .local v3, "_arg1":F
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 890
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->setBrightness(IF)V

    .line 891
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 892
    goto/16 :goto_3c8

    .line 875
    .end local v2    # "_arg0":I
    .end local v3    # "_arg1":F
    :pswitch_158
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 877
    .restart local v2    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    move-result v3

    .line 878
    .restart local v3    # "_arg1":F
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 879
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->setTemporaryBrightness(IF)V

    .line 880
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 881
    goto/16 :goto_3c8

    .line 865
    .end local v2    # "_arg0":I
    .end local v3    # "_arg1":F
    :pswitch_16b
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 866
    .restart local v2    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 867
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->isMinimalPostProcessingRequested(I)Z

    move-result v3

    .line 868
    .local v3, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 869
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeBoolean(Z)V

    .line 870
    goto/16 :goto_3c8

    .line 857
    .end local v2    # "_arg0":I
    .end local v3    # "_result":Z
    :pswitch_17e
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getDefaultBrightnessConfiguration()Landroid/hardware/display/BrightnessConfiguration;

    move-result-object v2

    .line 858
    .local v2, "_result":Landroid/hardware/display/BrightnessConfiguration;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 859
    invoke-virtual {p3, v2, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 860
    goto/16 :goto_3c8

    .line 848
    .end local v2    # "_result":Landroid/hardware/display/BrightnessConfiguration;
    :pswitch_18a
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 849
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 850
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->getBrightnessConfigurationForUser(I)Landroid/hardware/display/BrightnessConfiguration;

    move-result-object v3

    .line 851
    .local v3, "_result":Landroid/hardware/display/BrightnessConfiguration;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 852
    invoke-virtual {p3, v3, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 853
    goto/16 :goto_3c8

    .line 836
    .end local v2    # "_arg0":I
    .end local v3    # "_result":Landroid/hardware/display/BrightnessConfiguration;
    :pswitch_19d
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 838
    .local v2, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 839
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 840
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->getBrightnessConfigurationForDisplay(Ljava/lang/String;I)Landroid/hardware/display/BrightnessConfiguration;

    move-result-object v4

    .line 841
    .local v4, "_result":Landroid/hardware/display/BrightnessConfiguration;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 842
    invoke-virtual {p3, v4, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 843
    goto/16 :goto_3c8

    .line 821
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":I
    .end local v4    # "_result":Landroid/hardware/display/BrightnessConfiguration;
    :pswitch_1b4
    sget-object v2, Landroid/hardware/display/BrightnessConfiguration;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/display/BrightnessConfiguration;

    .line 823
    .local v2, "_arg0":Landroid/hardware/display/BrightnessConfiguration;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 825
    .local v3, "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 827
    .local v4, "_arg2":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    .line 828
    .local v5, "_arg3":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 829
    invoke-virtual {p0, v2, v3, v4, v5}, Landroid/hardware/display/IDisplayManager$Stub;->setBrightnessConfigurationForDisplay(Landroid/hardware/display/BrightnessConfiguration;Ljava/lang/String;ILjava/lang/String;)V

    .line 830
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 831
    goto/16 :goto_3c8

    .line 808
    .end local v2    # "_arg0":Landroid/hardware/display/BrightnessConfiguration;
    .end local v3    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":I
    .end local v5    # "_arg3":Ljava/lang/String;
    :pswitch_1d3
    sget-object v2, Landroid/hardware/display/BrightnessConfiguration;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/display/BrightnessConfiguration;

    .line 810
    .restart local v2    # "_arg0":Landroid/hardware/display/BrightnessConfiguration;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 812
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 813
    .local v4, "_arg2":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 814
    invoke-virtual {p0, v2, v3, v4}, Landroid/hardware/display/IDisplayManager$Stub;->setBrightnessConfigurationForUser(Landroid/hardware/display/BrightnessConfiguration;ILjava/lang/String;)V

    .line 815
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 816
    goto/16 :goto_3c8

    .line 800
    .end local v2    # "_arg0":Landroid/hardware/display/BrightnessConfiguration;
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":Ljava/lang/String;
    :pswitch_1ee
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getAmbientBrightnessStats()Landroid/content/pm/ParceledListSlice;

    move-result-object v2

    .line 801
    .local v2, "_result":Landroid/content/pm/ParceledListSlice;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 802
    invoke-virtual {p3, v2, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 803
    goto/16 :goto_3c8

    .line 791
    .end local v2    # "_result":Landroid/content/pm/ParceledListSlice;
    :pswitch_1fa
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 792
    .local v2, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 793
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->getBrightnessEvents(Ljava/lang/String;)Landroid/content/pm/ParceledListSlice;

    move-result-object v3

    .line 794
    .local v3, "_result":Landroid/content/pm/ParceledListSlice;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 795
    invoke-virtual {p3, v3, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 796
    goto/16 :goto_3c8

    .line 783
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v3    # "_result":Landroid/content/pm/ParceledListSlice;
    :pswitch_20d
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getStableDisplaySize()Landroid/graphics/Point;

    move-result-object v2

    .line 784
    .local v2, "_result":Landroid/graphics/Point;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 785
    invoke-virtual {p3, v2, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 786
    goto/16 :goto_3c8

    .line 773
    .end local v2    # "_result":Landroid/graphics/Point;
    :pswitch_219
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/hardware/display/IVirtualDisplayCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/display/IVirtualDisplayCallback;

    move-result-object v2

    .line 775
    .local v2, "_arg0":Landroid/hardware/display/IVirtualDisplayCallback;
    invoke-virtual {p2}, Landroid/os/Parcel;->readBoolean()Z

    move-result v3

    .line 776
    .local v3, "_arg1":Z
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 777
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->setVirtualDisplayState(Landroid/hardware/display/IVirtualDisplayCallback;Z)V

    .line 778
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 779
    goto/16 :goto_3c8

    .line 764
    .end local v2    # "_arg0":Landroid/hardware/display/IVirtualDisplayCallback;
    .end local v3    # "_arg1":Z
    :pswitch_230
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/hardware/display/IVirtualDisplayCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/display/IVirtualDisplayCallback;

    move-result-object v2

    .line 765
    .restart local v2    # "_arg0":Landroid/hardware/display/IVirtualDisplayCallback;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 766
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->releaseVirtualDisplay(Landroid/hardware/display/IVirtualDisplayCallback;)V

    .line 767
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 768
    goto/16 :goto_3c8

    .line 753
    .end local v2    # "_arg0":Landroid/hardware/display/IVirtualDisplayCallback;
    :pswitch_243
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/hardware/display/IVirtualDisplayCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/display/IVirtualDisplayCallback;

    move-result-object v2

    .line 755
    .restart local v2    # "_arg0":Landroid/hardware/display/IVirtualDisplayCallback;
    sget-object v3, Landroid/view/Surface;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/Surface;

    .line 756
    .local v3, "_arg1":Landroid/view/Surface;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 757
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->setVirtualDisplaySurface(Landroid/hardware/display/IVirtualDisplayCallback;Landroid/view/Surface;)V

    .line 758
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 759
    goto/16 :goto_3c8

    .line 738
    .end local v2    # "_arg0":Landroid/hardware/display/IVirtualDisplayCallback;
    .end local v3    # "_arg1":Landroid/view/Surface;
    :pswitch_25e
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/hardware/display/IVirtualDisplayCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/display/IVirtualDisplayCallback;

    move-result-object v2

    .line 740
    .restart local v2    # "_arg0":Landroid/hardware/display/IVirtualDisplayCallback;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 742
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 744
    .local v4, "_arg2":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 745
    .local v5, "_arg3":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 746
    invoke-virtual {p0, v2, v3, v4, v5}, Landroid/hardware/display/IDisplayManager$Stub;->resizeVirtualDisplay(Landroid/hardware/display/IVirtualDisplayCallback;III)V

    .line 747
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 748
    goto/16 :goto_3c8

    .line 722
    .end local v2    # "_arg0":Landroid/hardware/display/IVirtualDisplayCallback;
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":I
    .end local v5    # "_arg3":I
    :pswitch_27d
    sget-object v2, Landroid/hardware/display/VirtualDisplayConfig;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/display/VirtualDisplayConfig;

    .line 724
    .local v2, "_arg0":Landroid/hardware/display/VirtualDisplayConfig;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Landroid/hardware/display/IVirtualDisplayCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/display/IVirtualDisplayCallback;

    move-result-object v3

    .line 726
    .local v3, "_arg1":Landroid/hardware/display/IVirtualDisplayCallback;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Landroid/media/projection/IMediaProjection$Stub;->asInterface(Landroid/os/IBinder;)Landroid/media/projection/IMediaProjection;

    move-result-object v4

    .line 728
    .local v4, "_arg2":Landroid/media/projection/IMediaProjection;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    .line 729
    .local v5, "_arg3":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 730
    invoke-virtual {p0, v2, v3, v4, v5}, Landroid/hardware/display/IDisplayManager$Stub;->createVirtualDisplay(Landroid/hardware/display/VirtualDisplayConfig;Landroid/hardware/display/IVirtualDisplayCallback;Landroid/media/projection/IMediaProjection;Ljava/lang/String;)I

    move-result v6

    .line 731
    .local v6, "_result":I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 732
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    .line 733
    goto/16 :goto_3c8

    .line 711
    .end local v2    # "_arg0":Landroid/hardware/display/VirtualDisplayConfig;
    .end local v3    # "_arg1":Landroid/hardware/display/IVirtualDisplayCallback;
    .end local v4    # "_arg2":Landroid/media/projection/IMediaProjection;
    .end local v5    # "_arg3":Ljava/lang/String;
    .end local v6    # "_result":I
    :pswitch_2a8
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 713
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 714
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 715
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->requestColorMode(II)V

    .line 716
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 717
    goto/16 :goto_3c8

    .line 700
    .end local v2    # "_arg0":I
    .end local v3    # "_arg1":I
    :pswitch_2bb
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 702
    .restart local v2    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v3

    .line 703
    .local v3, "_arg1":[I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 704
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->overrideHdrTypes(I[I)V

    .line 705
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 706
    goto/16 :goto_3c8

    .line 692
    .end local v2    # "_arg0":I
    .end local v3    # "_arg1":[I
    :pswitch_2ce
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getUserDisabledHdrTypes()[I

    move-result-object v2

    .line 693
    .local v2, "_result":[I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 694
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 695
    goto/16 :goto_3c8

    .line 685
    .end local v2    # "_result":[I
    :pswitch_2da
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->areUserDisabledHdrTypesAllowed()Z

    move-result v2

    .line 686
    .local v2, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 687
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeBoolean(Z)V

    .line 688
    goto/16 :goto_3c8

    .line 677
    .end local v2    # "_result":Z
    :pswitch_2e6
    invoke-virtual {p2}, Landroid/os/Parcel;->readBoolean()Z

    move-result v2

    .line 678
    .local v2, "_arg0":Z
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 679
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->setAreUserDisabledHdrTypesAllowed(Z)V

    .line 680
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 681
    goto/16 :goto_3c8

    .line 668
    .end local v2    # "_arg0":Z
    :pswitch_2f5
    invoke-virtual {p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    .line 669
    .local v2, "_arg0":[I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 670
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->setUserDisabledHdrTypes([I)V

    .line 671
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 672
    goto/16 :goto_3c8

    .line 660
    .end local v2    # "_arg0":[I
    :pswitch_304
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->getWifiDisplayStatus()Landroid/hardware/display/WifiDisplayStatus;

    move-result-object v2

    .line 661
    .local v2, "_result":Landroid/hardware/display/WifiDisplayStatus;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 662
    invoke-virtual {p3, v2, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 663
    goto/16 :goto_3c8

    .line 654
    .end local v2    # "_result":Landroid/hardware/display/WifiDisplayStatus;
    :pswitch_310
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->resumeWifiDisplay()V

    .line 655
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 656
    goto/16 :goto_3c8

    .line 648
    :pswitch_318
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->pauseWifiDisplay()V

    .line 649
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 650
    goto/16 :goto_3c8

    .line 640
    :pswitch_320
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 641
    .local v2, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 642
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->forgetWifiDisplay(Ljava/lang/String;)V

    .line 643
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 644
    goto/16 :goto_3c8

    .line 629
    .end local v2    # "_arg0":Ljava/lang/String;
    :pswitch_32f
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 631
    .restart local v2    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 632
    .local v3, "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 633
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->renameWifiDisplay(Ljava/lang/String;Ljava/lang/String;)V

    .line 634
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 635
    goto/16 :goto_3c8

    .line 622
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Ljava/lang/String;
    :pswitch_342
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->disconnectWifiDisplay()V

    .line 623
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 624
    goto/16 :goto_3c8

    .line 614
    :pswitch_34a
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 615
    .restart local v2    # "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 616
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->connectWifiDisplay(Ljava/lang/String;)V

    .line 617
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 618
    goto :goto_3c8

    .line 607
    .end local v2    # "_arg0":Ljava/lang/String;
    :pswitch_358
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->stopWifiDisplayScan()V

    .line 608
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 609
    goto :goto_3c8

    .line 601
    :pswitch_35f
    invoke-virtual {p0}, Landroid/hardware/display/IDisplayManager$Stub;->startWifiDisplayScan()V

    .line 602
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 603
    goto :goto_3c8

    .line 591
    :pswitch_366
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/hardware/display/IDisplayManagerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/display/IDisplayManagerCallback;

    move-result-object v2

    .line 593
    .local v2, "_arg0":Landroid/hardware/display/IDisplayManagerCallback;
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    .line 594
    .local v3, "_arg1":J
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 595
    invoke-virtual {p0, v2, v3, v4}, Landroid/hardware/display/IDisplayManager$Stub;->registerCallbackWithEventMask(Landroid/hardware/display/IDisplayManagerCallback;J)V

    .line 596
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 597
    goto :goto_3c8

    .line 582
    .end local v2    # "_arg0":Landroid/hardware/display/IDisplayManagerCallback;
    .end local v3    # "_arg1":J
    :pswitch_37c
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/hardware/display/IDisplayManagerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/display/IDisplayManagerCallback;

    move-result-object v2

    .line 583
    .restart local v2    # "_arg0":Landroid/hardware/display/IDisplayManagerCallback;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 584
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->registerCallback(Landroid/hardware/display/IDisplayManagerCallback;)V

    .line 585
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 586
    goto :goto_3c8

    .line 570
    .end local v2    # "_arg0":Landroid/hardware/display/IDisplayManagerCallback;
    :pswitch_38e
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 572
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 573
    .local v3, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 574
    invoke-virtual {p0, v2, v3}, Landroid/hardware/display/IDisplayManager$Stub;->isUidPresentOnDisplay(II)Z

    move-result v4

    .line 575
    .local v4, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 576
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeBoolean(Z)V

    .line 577
    goto :goto_3c8

    .line 560
    .end local v2    # "_arg0":I
    .end local v3    # "_arg1":I
    .end local v4    # "_result":Z
    :pswitch_3a4
    invoke-virtual {p2}, Landroid/os/Parcel;->readBoolean()Z

    move-result v2

    .line 561
    .local v2, "_arg0":Z
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 562
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->getDisplayIds(Z)[I

    move-result-object v3

    .line 563
    .local v3, "_result":[I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 564
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 565
    goto :goto_3c8

    .line 550
    .end local v2    # "_arg0":Z
    .end local v3    # "_result":[I
    :pswitch_3b6
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 551
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 552
    invoke-virtual {p0, v2}, Landroid/hardware/display/IDisplayManager$Stub;->getDisplayInfo(I)Landroid/view/DisplayInfo;

    move-result-object v3

    .line 553
    .local v3, "_result":Landroid/view/DisplayInfo;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 554
    invoke-virtual {p3, v3, v1}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 555
    nop

    .line 1063
    .end local v2    # "_arg0":I
    .end local v3    # "_result":Landroid/view/DisplayInfo;
    :goto_3c8
    return v1

    nop

    :pswitch_data_3ca
    .packed-switch 0x5f4e5446
        :pswitch_18
    .end packed-switch

    :pswitch_data_3d0
    .packed-switch 0x1
        :pswitch_3b6
        :pswitch_3a4
        :pswitch_38e
        :pswitch_37c
        :pswitch_366
        :pswitch_35f
        :pswitch_358
        :pswitch_34a
        :pswitch_342
        :pswitch_32f
        :pswitch_320
        :pswitch_318
        :pswitch_310
        :pswitch_304
        :pswitch_2f5
        :pswitch_2e6
        :pswitch_2da
        :pswitch_2ce
        :pswitch_2bb
        :pswitch_2a8
        :pswitch_27d
        :pswitch_25e
        :pswitch_243
        :pswitch_230
        :pswitch_219
        :pswitch_20d
        :pswitch_1fa
        :pswitch_1ee
        :pswitch_1d3
        :pswitch_1b4
        :pswitch_19d
        :pswitch_18a
        :pswitch_17e
        :pswitch_16b
        :pswitch_158
        :pswitch_145
        :pswitch_132
        :pswitch_123
        :pswitch_117
        :pswitch_104
        :pswitch_f8
        :pswitch_e1
        :pswitch_ce
        :pswitch_bb
        :pswitch_a8
        :pswitch_9c
        :pswitch_90
        :pswitch_84
        :pswitch_75
        :pswitch_69
        :pswitch_5a
        :pswitch_4e
        :pswitch_3b
        :pswitch_28
        :pswitch_1c
    .end packed-switch
.end method
