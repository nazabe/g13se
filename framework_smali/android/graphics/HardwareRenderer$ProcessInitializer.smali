.class Landroid/graphics/HardwareRenderer$ProcessInitializer;
.super Ljava/lang/Object;
.source "HardwareRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/graphics/HardwareRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProcessInitializer"
.end annotation


# static fields
.field static blacklist sInstance:Landroid/graphics/HardwareRenderer$ProcessInitializer;


# instance fields
.field private blacklist mContext:Landroid/content/Context;

.field private blacklist mDisplayInitialized:Z

.field private blacklist mGraphicsStatsCallback:Landroid/view/IGraphicsStatsCallback;

.field private blacklist mGraphicsStatsService:Landroid/view/IGraphicsStats;

.field private blacklist mInitialized:Z

.field private blacklist mIsolated:Z

.field private blacklist mPackageName:Ljava/lang/String;


# direct methods
.method static bridge synthetic blacklist -$$Nest$mrotateBuffer(Landroid/graphics/HardwareRenderer$ProcessInitializer;)V
    .registers 1

    invoke-direct {p0}, Landroid/graphics/HardwareRenderer$ProcessInitializer;->rotateBuffer()V

    return-void
.end method

.method static constructor blacklist <clinit>()V
    .registers 1

    .line 1281
    new-instance v0, Landroid/graphics/HardwareRenderer$ProcessInitializer;

    invoke-direct {v0}, Landroid/graphics/HardwareRenderer$ProcessInitializer;-><init>()V

    sput-object v0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->sInstance:Landroid/graphics/HardwareRenderer$ProcessInitializer;

    return-void
.end method

.method private constructor blacklist <init>()V
    .registers 2

    .line 1297
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1283
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mInitialized:Z

    .line 1284
    iput-boolean v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mDisplayInitialized:Z

    .line 1286
    iput-boolean v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mIsolated:Z

    .line 1290
    new-instance v0, Landroid/graphics/HardwareRenderer$ProcessInitializer$1;

    invoke-direct {v0, p0}, Landroid/graphics/HardwareRenderer$ProcessInitializer$1;-><init>(Landroid/graphics/HardwareRenderer$ProcessInitializer;)V

    iput-object v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mGraphicsStatsCallback:Landroid/view/IGraphicsStatsCallback;

    .line 1298
    return-void
.end method

.method private blacklist initDisplayInfo()V
    .registers 25

    .line 1358
    move-object/from16 v0, p0

    iget-boolean v1, v0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mDisplayInitialized:Z

    if-eqz v1, :cond_7

    return-void

    .line 1359
    :cond_7
    iget-boolean v1, v0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mIsolated:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_f

    .line 1360
    iput-boolean v2, v0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mDisplayInitialized:Z

    .line 1361
    return-void

    .line 1364
    :cond_f
    iget-object v1, v0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mContext:Landroid/content/Context;

    const-string v3, "display"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManager;

    .line 1365
    .local v1, "dm":Landroid/hardware/display/DisplayManager;
    const-string v3, "HardwareRenderer"

    if-nez v1, :cond_23

    .line 1366
    const-string v2, "Failed to find DisplayManager for display-based configuration"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1367
    return-void

    .line 1370
    :cond_23
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v5

    .line 1371
    .local v5, "defaultDisplay":Landroid/view/Display;
    if-nez v5, :cond_30

    .line 1372
    const-string v2, "Failed to find default display for display-based configuration"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1373
    return-void

    .line 1376
    :cond_30
    invoke-virtual {v1}, Landroid/hardware/display/DisplayManager;->getDisplays()[Landroid/view/Display;

    move-result-object v6

    .line 1377
    .local v6, "allDisplays":[Landroid/view/Display;
    array-length v7, v6

    if-nez v7, :cond_3d

    .line 1378
    const-string v2, "Failed to query displays"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1379
    return-void

    .line 1382
    :cond_3d
    invoke-virtual {v5}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v3

    .line 1383
    .local v3, "activeMode":Landroid/view/Display$Mode;
    nop

    .line 1384
    invoke-virtual {v5}, Landroid/view/Display;->getPreferredWideGamutColorSpace()Landroid/graphics/ColorSpace;

    move-result-object v7

    .line 1385
    .local v7, "defaultWideColorSpace":Landroid/graphics/ColorSpace;
    if-eqz v7, :cond_4d

    .line 1386
    invoke-virtual {v7}, Landroid/graphics/ColorSpace;->getDataSpace()I

    move-result v8

    goto :goto_4e

    :cond_4d
    move v8, v4

    .line 1390
    .local v8, "wideColorDataspace":I
    :goto_4e
    invoke-virtual {v3}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v9

    .line 1391
    .local v9, "largestWidth":I
    invoke-virtual {v3}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v10

    .line 1392
    .local v10, "largestHeight":I
    invoke-virtual {v5}, Landroid/view/Display;->getOverlaySupport()Landroid/hardware/OverlayProperties;

    move-result-object v11

    .line 1393
    .local v11, "overlayProperties":Landroid/hardware/OverlayProperties;
    if-eqz v11, :cond_63

    .line 1394
    invoke-virtual {v11}, Landroid/hardware/OverlayProperties;->supportFp16ForHdr()Z

    move-result v12

    move/from16 v21, v12

    goto :goto_65

    :cond_63
    move/from16 v21, v4

    .line 1395
    .local v21, "supportFp16ForHdr":Z
    :goto_65
    if-eqz v11, :cond_6c

    .line 1396
    invoke-virtual {v11}, Landroid/hardware/OverlayProperties;->supportMixedColorSpaces()Z

    move-result v4

    goto :goto_6d

    :cond_6c
    nop

    :goto_6d
    move/from16 v22, v4

    .line 1398
    .local v22, "supportMixedColorSpaces":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_70
    array-length v12, v6

    if-ge v4, v12, :cond_ab

    .line 1399
    aget-object v12, v6, v4

    .line 1403
    .local v12, "display":Landroid/view/Display;
    if-nez v8, :cond_81

    .line 1404
    invoke-virtual {v12}, Landroid/view/Display;->getPreferredWideGamutColorSpace()Landroid/graphics/ColorSpace;

    move-result-object v13

    .line 1405
    .local v13, "cs":Landroid/graphics/ColorSpace;
    if-eqz v13, :cond_81

    .line 1406
    invoke-virtual {v13}, Landroid/graphics/ColorSpace;->getDataSpace()I

    move-result v8

    .line 1409
    .end local v13    # "cs":Landroid/graphics/ColorSpace;
    :cond_81
    invoke-virtual {v12}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v13

    .line 1410
    .local v13, "modes":[Landroid/view/Display$Mode;
    const/4 v14, 0x0

    .local v14, "j":I
    :goto_86
    array-length v15, v13

    if-ge v14, v15, :cond_a5

    .line 1411
    aget-object v15, v13, v14

    .line 1412
    .local v15, "mode":Landroid/view/Display$Mode;
    invoke-virtual {v15}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v16

    .line 1413
    .local v16, "width":I
    invoke-virtual {v15}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v17

    .line 1414
    .local v17, "height":I
    mul-int v2, v16, v17

    move-object/from16 v23, v1

    .end local v1    # "dm":Landroid/hardware/display/DisplayManager;
    .local v23, "dm":Landroid/hardware/display/DisplayManager;
    mul-int v1, v9, v10

    if-le v2, v1, :cond_9f

    .line 1415
    move/from16 v9, v16

    .line 1416
    move/from16 v10, v17

    .line 1410
    .end local v15    # "mode":Landroid/view/Display$Mode;
    .end local v16    # "width":I
    .end local v17    # "height":I
    :cond_9f
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v1, v23

    const/4 v2, 0x1

    goto :goto_86

    .end local v23    # "dm":Landroid/hardware/display/DisplayManager;
    .restart local v1    # "dm":Landroid/hardware/display/DisplayManager;
    :cond_a5
    move-object/from16 v23, v1

    .line 1398
    .end local v1    # "dm":Landroid/hardware/display/DisplayManager;
    .end local v12    # "display":Landroid/view/Display;
    .end local v13    # "modes":[Landroid/view/Display$Mode;
    .end local v14    # "j":I
    .restart local v23    # "dm":Landroid/hardware/display/DisplayManager;
    add-int/lit8 v4, v4, 0x1

    const/4 v2, 0x1

    goto :goto_70

    .end local v23    # "dm":Landroid/hardware/display/DisplayManager;
    .restart local v1    # "dm":Landroid/hardware/display/DisplayManager;
    :cond_ab
    move-object/from16 v23, v1

    .line 1421
    .end local v1    # "dm":Landroid/hardware/display/DisplayManager;
    .end local v4    # "i":I
    .restart local v23    # "dm":Landroid/hardware/display/DisplayManager;
    invoke-virtual {v5}, Landroid/view/Display;->getRefreshRate()F

    move-result v15

    .line 1422
    invoke-virtual {v5}, Landroid/view/Display;->getAppVsyncOffsetNanos()J

    move-result-wide v17

    .line 1423
    invoke-virtual {v5}, Landroid/view/Display;->getPresentationDeadlineNanos()J

    move-result-wide v19

    .line 1421
    move v13, v9

    move v14, v10

    move/from16 v16, v8

    invoke-static/range {v13 .. v22}, Landroid/graphics/HardwareRenderer;->-$$Nest$smnInitDisplayInfo(IIFIJJZZ)V

    .line 1426
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mDisplayInitialized:Z

    .line 1427
    return-void
.end method

.method private blacklist initGraphicsStats()V
    .registers 4

    .line 1333
    iget-object v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mPackageName:Ljava/lang/String;

    if-nez v0, :cond_5

    return-void

    .line 1336
    :cond_5
    :try_start_5
    const-string v0, "graphicsstats"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 1337
    .local v0, "binder":Landroid/os/IBinder;
    if-nez v0, :cond_e

    return-void

    .line 1338
    :cond_e
    invoke-static {v0}, Landroid/view/IGraphicsStats$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IGraphicsStats;

    move-result-object v1

    iput-object v1, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mGraphicsStatsService:Landroid/view/IGraphicsStats;

    .line 1339
    invoke-direct {p0}, Landroid/graphics/HardwareRenderer$ProcessInitializer;->requestBuffer()V
    :try_end_17
    .catchall {:try_start_5 .. :try_end_17} :catchall_18

    .line 1342
    .end local v0    # "binder":Landroid/os/IBinder;
    goto :goto_20

    .line 1340
    :catchall_18
    move-exception v0

    .line 1341
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "HardwareRenderer"

    const-string v2, "Could not acquire gfx stats buffer"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1343
    .end local v0    # "t":Ljava/lang/Throwable;
    :goto_20
    return-void
.end method

.method private blacklist initSched(J)V
    .registers 6
    .param p1, "renderProxy"    # J

    .line 1325
    :try_start_0
    invoke-static {p1, p2}, Landroid/graphics/HardwareRenderer;->-$$Nest$smnGetRenderThreadTid(J)I

    move-result v0

    .line 1326
    .local v0, "tid":I
    invoke-static {}, Landroid/app/ActivityManager;->getService()Landroid/app/IActivityManager;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/app/IActivityManager;->setRenderThread(I)V
    :try_end_b
    .catchall {:try_start_0 .. :try_end_b} :catchall_c

    .line 1329
    .end local v0    # "tid":I
    goto :goto_14

    .line 1327
    :catchall_c
    move-exception v0

    .line 1328
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "HardwareRenderer"

    const-string v2, "Failed to set scheduler for RenderThread"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1330
    .end local v0    # "t":Ljava/lang/Throwable;
    :goto_14
    return-void
.end method

.method private blacklist requestBuffer()V
    .registers 4

    .line 1436
    :try_start_0
    iget-object v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mGraphicsStatsService:Landroid/view/IGraphicsStats;

    iget-object v1, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mPackageName:Ljava/lang/String;

    iget-object v2, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mGraphicsStatsCallback:Landroid/view/IGraphicsStatsCallback;

    .line 1437
    invoke-interface {v0, v1, v2}, Landroid/view/IGraphicsStats;->requestBufferForProcess(Ljava/lang/String;Landroid/view/IGraphicsStatsCallback;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 1438
    .local v0, "pfd":Landroid/os/ParcelFileDescriptor;
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v1

    invoke-static {v1}, Landroid/graphics/HardwareRenderer;->-$$Nest$smnSetProcessStatsBuffer(I)V

    .line 1439
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_14
    .catchall {:try_start_0 .. :try_end_14} :catchall_15

    .line 1442
    .end local v0    # "pfd":Landroid/os/ParcelFileDescriptor;
    goto :goto_1d

    .line 1440
    :catchall_15
    move-exception v0

    .line 1441
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "HardwareRenderer"

    const-string v2, "Could not acquire gfx stats buffer"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1443
    .end local v0    # "t":Ljava/lang/Throwable;
    :goto_1d
    return-void
.end method

.method private blacklist rotateBuffer()V
    .registers 1

    .line 1430
    invoke-static {}, Landroid/graphics/HardwareRenderer;->-$$Nest$smnRotateProcessStatsBuffer()V

    .line 1431
    invoke-direct {p0}, Landroid/graphics/HardwareRenderer$ProcessInitializer;->requestBuffer()V

    .line 1432
    return-void
.end method


# virtual methods
.method declared-synchronized blacklist init(J)V
    .registers 4
    .param p1, "renderProxy"    # J

    monitor-enter p0

    .line 1316
    :try_start_1
    iget-boolean v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mInitialized:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_12

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 1317
    :cond_7
    const/4 v0, 0x1

    :try_start_8
    iput-boolean v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mInitialized:Z

    .line 1319
    invoke-direct {p0, p1, p2}, Landroid/graphics/HardwareRenderer$ProcessInitializer;->initSched(J)V

    .line 1320
    invoke-direct {p0}, Landroid/graphics/HardwareRenderer$ProcessInitializer;->initGraphicsStats()V
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_12

    .line 1321
    monitor-exit p0

    return-void

    .line 1315
    .end local p0    # "this":Landroid/graphics/HardwareRenderer$ProcessInitializer;
    .end local p1    # "renderProxy":J
    :catchall_12
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized blacklist initUsingContext()V
    .registers 2

    monitor-enter p0

    .line 1346
    :try_start_1
    iget-object v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mContext:Landroid/content/Context;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1d

    if-nez v0, :cond_7

    monitor-exit p0

    return-void

    .line 1348
    :cond_7
    :try_start_7
    invoke-direct {p0}, Landroid/graphics/HardwareRenderer$ProcessInitializer;->initDisplayInfo()V

    .line 1350
    invoke-static {}, Landroid/app/ActivityManager;->isHighEndGfx()Z

    move-result v0

    invoke-static {v0}, Landroid/graphics/HardwareRenderer;->-$$Nest$smnSetIsHighEndGfx(Z)V

    .line 1351
    invoke-static {}, Landroid/app/ActivityManager;->isLowRamDeviceStatic()Z

    move-result v0

    invoke-static {v0}, Landroid/graphics/HardwareRenderer;->-$$Nest$smnSetIsLowRam(Z)V

    .line 1354
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mContext:Landroid/content/Context;
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_1d

    .line 1355
    monitor-exit p0

    return-void

    .line 1345
    .end local p0    # "this":Landroid/graphics/HardwareRenderer$ProcessInitializer;
    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized blacklist setContext(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    monitor-enter p0

    .line 1311
    :try_start_1
    iget-boolean v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mInitialized:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 1312
    :cond_7
    :try_start_7
    iput-object p1, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mContext:Landroid/content/Context;
    :try_end_9
    .catchall {:try_start_7 .. :try_end_9} :catchall_b

    .line 1313
    monitor-exit p0

    return-void

    .line 1310
    .end local p0    # "this":Landroid/graphics/HardwareRenderer$ProcessInitializer;
    .end local p1    # "context":Landroid/content/Context;
    :catchall_b
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized blacklist setIsolated(Z)V
    .registers 3
    .param p1, "isolated"    # Z

    monitor-enter p0

    .line 1306
    :try_start_1
    iget-boolean v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mInitialized:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 1307
    :cond_7
    :try_start_7
    iput-boolean p1, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mIsolated:Z
    :try_end_9
    .catchall {:try_start_7 .. :try_end_9} :catchall_b

    .line 1308
    monitor-exit p0

    return-void

    .line 1305
    .end local p0    # "this":Landroid/graphics/HardwareRenderer$ProcessInitializer;
    .end local p1    # "isolated":Z
    :catchall_b
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized blacklist setPackageName(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    monitor-enter p0

    .line 1301
    :try_start_1
    iget-boolean v0, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mInitialized:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 1302
    :cond_7
    :try_start_7
    iput-object p1, p0, Landroid/graphics/HardwareRenderer$ProcessInitializer;->mPackageName:Ljava/lang/String;
    :try_end_9
    .catchall {:try_start_7 .. :try_end_9} :catchall_b

    .line 1303
    monitor-exit p0

    return-void

    .line 1300
    .end local p0    # "this":Landroid/graphics/HardwareRenderer$ProcessInitializer;
    .end local p1    # "name":Ljava/lang/String;
    :catchall_b
    move-exception p1

    monitor-exit p0

    throw p1
.end method
