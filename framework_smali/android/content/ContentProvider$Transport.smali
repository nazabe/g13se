.class Landroid/content/ContentProvider$Transport;
.super Landroid/content/ContentProviderNative;
.source "ContentProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/content/ContentProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Transport"
.end annotation


# instance fields
.field volatile greylist-max-o mAppOpsManager:Landroid/app/AppOpsManager;

.field volatile blacklist mInterface:Landroid/content/ContentInterface;

.field volatile greylist-max-o mReadOp:I

.field volatile greylist-max-o mWriteOp:I

.field final synthetic blacklist this$0:Landroid/content/ContentProvider;


# direct methods
.method constructor blacklist <init>(Landroid/content/ContentProvider;)V
    .registers 3
    .param p1, "this$0"    # Landroid/content/ContentProvider;

    .line 232
    iput-object p1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-direct {p0}, Landroid/content/ContentProviderNative;-><init>()V

    .line 233
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/content/ContentProvider$Transport;->mAppOpsManager:Landroid/app/AppOpsManager;

    .line 234
    const/4 v0, -0x1

    iput v0, p0, Landroid/content/ContentProvider$Transport;->mReadOp:I

    .line 235
    iput v0, p0, Landroid/content/ContentProvider$Transport;->mWriteOp:I

    .line 236
    iput-object p1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    return-void
.end method

.method private blacklist checkGetTypePermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I
    .registers 6
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;

    .line 849
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    .line 850
    .local v0, "callingUid":I
    invoke-static {v0}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v1

    const/16 v2, 0x3e8

    if-eq v1, v2, :cond_1f

    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    .line 851
    const-string v2, "android.permission.GET_ANY_PROVIDER_TYPE"

    invoke-static {v1, v2, p1}, Landroid/content/ContentProvider;->-$$Nest$mcheckPermission(Landroid/content/ContentProvider;Ljava/lang/String;Landroid/content/AttributionSource;)I

    move-result v1

    if-nez v1, :cond_17

    goto :goto_1f

    .line 857
    :cond_17
    :try_start_17
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceReadPermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v1
    :try_end_1b
    .catch Ljava/lang/SecurityException; {:try_start_17 .. :try_end_1b} :catch_1c

    return v1

    .line 858
    :catch_1c
    move-exception v1

    .line 859
    .local v1, "e":Ljava/lang/SecurityException;
    const/4 v2, 0x2

    return v2

    .line 854
    .end local v1    # "e":Ljava/lang/SecurityException;
    :cond_1f
    :goto_1f
    const/4 v1, 0x0

    return v1
.end method

.method private blacklist enforceFilePermission(Landroid/content/AttributionSource;Landroid/net/Uri;Ljava/lang/String;)V
    .registers 7
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    .line 797
    const-string v0, "App op not allowed"

    if-eqz p3, :cond_1a

    const/16 v1, 0x77

    invoke-virtual {p3, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1a

    .line 798
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceWritePermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v1

    if-nez v1, :cond_14

    goto :goto_20

    .line 800
    :cond_14
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 803
    :cond_1a
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceReadPermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v1

    if-nez v1, :cond_21

    .line 808
    :goto_20
    return-void

    .line 805
    :cond_21
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private blacklist enforceReadPermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I
    .registers 7
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .line 813
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2, p1}, Landroid/content/ContentProvider;->enforceReadPermissionInner(Landroid/net/Uri;Landroid/content/AttributionSource;)I

    move-result v0

    .line 814
    .local v0, "result":I
    if-eqz v0, :cond_9

    .line 815
    return v0

    .line 819
    :cond_9
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1}, Landroid/content/ContentProvider;->-$$Nest$fgetmTransport(Landroid/content/ContentProvider;)Landroid/content/ContentProvider$Transport;

    move-result-object v1

    iget v1, v1, Landroid/content/ContentProvider$Transport;->mReadOp:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_40

    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1}, Landroid/content/ContentProvider;->-$$Nest$fgetmTransport(Landroid/content/ContentProvider;)Landroid/content/ContentProvider$Transport;

    move-result-object v1

    iget v1, v1, Landroid/content/ContentProvider$Transport;->mReadOp:I

    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v2}, Landroid/content/ContentProvider;->-$$Nest$fgetmReadPermission(Landroid/content/ContentProvider;)Ljava/lang/String;

    move-result-object v2

    .line 820
    invoke-static {v2}, Landroid/app/AppOpsManager;->permissionToOpCode(Ljava/lang/String;)I

    move-result v2

    if-eq v1, v2, :cond_40

    .line 821
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v1}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v2}, Landroid/content/ContentProvider;->-$$Nest$fgetmTransport(Landroid/content/ContentProvider;)Landroid/content/ContentProvider$Transport;

    move-result-object v2

    iget v2, v2, Landroid/content/ContentProvider$Transport;->mReadOp:I

    .line 822
    invoke-static {v2}, Landroid/app/AppOpsManager;->opToPublicName(I)Ljava/lang/String;

    move-result-object v2

    .line 821
    const/4 v3, 0x0

    invoke-static {v1, v2, p1, v3}, Landroid/content/PermissionChecker;->checkOpForDataDelivery(Landroid/content/Context;Ljava/lang/String;Landroid/content/AttributionSource;Ljava/lang/String;)I

    move-result v1

    return v1

    .line 825
    :cond_40
    const/4 v1, 0x0

    return v1
.end method

.method private blacklist enforceWritePermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I
    .registers 7
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .line 831
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2, p1}, Landroid/content/ContentProvider;->enforceWritePermissionInner(Landroid/net/Uri;Landroid/content/AttributionSource;)I

    move-result v0

    .line 832
    .local v0, "result":I
    if-eqz v0, :cond_9

    .line 833
    return v0

    .line 837
    :cond_9
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1}, Landroid/content/ContentProvider;->-$$Nest$fgetmTransport(Landroid/content/ContentProvider;)Landroid/content/ContentProvider$Transport;

    move-result-object v1

    iget v1, v1, Landroid/content/ContentProvider$Transport;->mWriteOp:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_40

    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1}, Landroid/content/ContentProvider;->-$$Nest$fgetmTransport(Landroid/content/ContentProvider;)Landroid/content/ContentProvider$Transport;

    move-result-object v1

    iget v1, v1, Landroid/content/ContentProvider$Transport;->mWriteOp:I

    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v2}, Landroid/content/ContentProvider;->-$$Nest$fgetmWritePermission(Landroid/content/ContentProvider;)Ljava/lang/String;

    move-result-object v2

    .line 838
    invoke-static {v2}, Landroid/app/AppOpsManager;->permissionToOpCode(Ljava/lang/String;)I

    move-result v2

    if-eq v1, v2, :cond_40

    .line 839
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v1}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v2}, Landroid/content/ContentProvider;->-$$Nest$fgetmTransport(Landroid/content/ContentProvider;)Landroid/content/ContentProvider$Transport;

    move-result-object v2

    iget v2, v2, Landroid/content/ContentProvider$Transport;->mWriteOp:I

    .line 840
    invoke-static {v2}, Landroid/app/AppOpsManager;->opToPublicName(I)Ljava/lang/String;

    move-result-object v2

    .line 839
    const/4 v3, 0x0

    invoke-static {v1, v2, p1, v3}, Landroid/content/PermissionChecker;->checkOpForDataDelivery(Landroid/content/Context;Ljava/lang/String;Landroid/content/AttributionSource;Ljava/lang/String;)I

    move-result v1

    return v1

    .line 843
    :cond_40
    const/4 v1, 0x0

    return v1
.end method

.method private blacklist logGetTypeData(ILandroid/net/Uri;Ljava/lang/String;Z)V
    .registers 14
    .param p1, "callingUid"    # I
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "permissionCheckPassed"    # Z

    .line 358
    const/4 v0, 0x4

    .line 360
    .local v0, "enumFrameworkPermission":I
    const/4 v1, 0x5

    .line 362
    .local v1, "enumCheckUriPermission":I
    const/16 v2, 0x234

    if-eqz p4, :cond_65

    .line 365
    :try_start_6
    iget-object v3, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v3}, Landroid/content/ContentProvider;->-$$Nest$fgetmContext(Landroid/content/ContentProvider;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 366
    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v4

    .line 367
    const-wide/16 v5, 0x80

    invoke-static {v5, v6}, Landroid/content/pm/PackageManager$ComponentInfoFlags;->of(J)Landroid/content/pm/PackageManager$ComponentInfoFlags;

    move-result-object v5

    .line 366
    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;Landroid/content/pm/PackageManager$ComponentInfoFlags;)Landroid/content/pm/ProviderInfo;

    move-result-object v3

    .line 369
    .local v3, "cpi":Landroid/content/pm/ProviderInfo;
    invoke-static {p1}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v4

    .line 370
    .local v4, "callingUserId":I
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v5}, Landroid/content/ContentProvider;->-$$Nest$fgetmSingleUser(Landroid/content/ContentProvider;)Z

    move-result v5

    if-eqz v5, :cond_3b

    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v5}, Landroid/content/ContentProvider;->-$$Nest$fgetmMyUid(Landroid/content/ContentProvider;)I

    move-result v5

    .line 371
    invoke-static {v5, p1}, Landroid/os/UserHandle;->isSameUser(II)Z

    move-result v5

    if-nez v5, :cond_3b

    .line 372
    invoke-static {p2, v4}, Landroid/content/ContentProvider;->maybeAddUserId(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v5

    goto :goto_3c

    :cond_3b
    move-object v5, p2

    .line 373
    .local v5, "userUri":Landroid/net/Uri;
    :goto_3c
    iget-boolean v6, v3, Landroid/content/pm/ProviderInfo;->forceUriPermissions:Z

    if-eqz v6, :cond_64

    iget-object v6, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    .line 374
    const/4 v7, 0x1

    invoke-interface {v6, p2, p1, v7}, Landroid/content/ContentInterface;->checkUriPermission(Landroid/net/Uri;II)I

    move-result v6

    if-eqz v6, :cond_64

    iget-object v6, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    .line 377
    invoke-virtual {v6}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v8

    invoke-virtual {v6, v5, v8, p1, v7}, Landroid/content/Context;->checkUriPermission(Landroid/net/Uri;III)I

    move-result v6

    if-eqz v6, :cond_64

    .line 380
    nop

    .line 382
    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v6

    .line 380
    const/4 v7, 0x5

    invoke-static {v2, v7, p1, v6, p3}, Lcom/android/internal/util/FrameworkStatsLog;->write(IIILjava/lang/String;Ljava/lang/String;)V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_62} :catch_63

    goto :goto_64

    .line 384
    .end local v3    # "cpi":Landroid/content/pm/ProviderInfo;
    .end local v4    # "callingUserId":I
    .end local v5    # "userUri":Landroid/net/Uri;
    :catch_63
    move-exception v2

    .line 386
    :cond_64
    :goto_64
    goto :goto_6e

    .line 388
    :cond_65
    nop

    .line 390
    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    .line 388
    const/4 v4, 0x4

    invoke-static {v2, v4, p1, v3, p3}, Lcom/android/internal/util/FrameworkStatsLog;->write(IIILjava/lang/String;Ljava/lang/String;)V

    .line 392
    :goto_6e
    return-void
.end method


# virtual methods
.method public blacklist applyBatch(Landroid/content/AttributionSource;Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    .registers 14
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "authority"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/AttributionSource;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Landroid/content/ContentProviderOperation;",
            ">;)[",
            "Landroid/content/ContentProviderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/OperationApplicationException;
        }
    .end annotation

    .line 481
    .local p3, "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mvalidateIncomingAuthority(Landroid/content/ContentProvider;Ljava/lang/String;)V

    .line 482
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 483
    .local v0, "numOperations":I
    new-array v1, v0, [I

    .line 484
    .local v1, "userIds":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    if-ge v2, v0, :cond_6a

    .line 485
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ContentProviderOperation;

    .line 486
    .local v3, "operation":Landroid/content/ContentProviderOperation;
    invoke-virtual {v3}, Landroid/content/ContentProviderOperation;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 487
    .local v4, "uri":Landroid/net/Uri;
    invoke-static {v4}, Landroid/content/ContentProvider;->getUserIdFromUri(Landroid/net/Uri;)I

    move-result v5

    aput v5, v1, v2

    .line 488
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v5, v4}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v4

    .line 489
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v5, v4}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v4

    .line 491
    invoke-virtual {v3}, Landroid/content/ContentProviderOperation;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-static {v5, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3d

    .line 492
    new-instance v5, Landroid/content/ContentProviderOperation;

    invoke-direct {v5, v3, v4}, Landroid/content/ContentProviderOperation;-><init>(Landroid/content/ContentProviderOperation;Landroid/net/Uri;)V

    move-object v3, v5

    .line 493
    invoke-virtual {p3, v2, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 495
    :cond_3d
    move-object v5, p1

    .line 497
    .local v5, "accessAttributionSource":Landroid/content/AttributionSource;
    invoke-virtual {v3}, Landroid/content/ContentProviderOperation;->isReadOperation()Z

    move-result v6

    const/4 v7, 0x0

    const-string v8, "App op not allowed"

    if-eqz v6, :cond_54

    .line 498
    invoke-direct {p0, v5, v4}, Landroid/content/ContentProvider$Transport;->enforceReadPermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v6

    if-nez v6, :cond_4e

    goto :goto_54

    .line 500
    :cond_4e
    new-instance v6, Landroid/content/OperationApplicationException;

    invoke-direct {v6, v8, v7}, Landroid/content/OperationApplicationException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 503
    :cond_54
    :goto_54
    invoke-virtual {v3}, Landroid/content/ContentProviderOperation;->isWriteOperation()Z

    move-result v6

    if-eqz v6, :cond_67

    .line 504
    invoke-direct {p0, v5, v4}, Landroid/content/ContentProvider$Transport;->enforceWritePermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v6

    if-nez v6, :cond_61

    goto :goto_67

    .line 506
    :cond_61
    new-instance v6, Landroid/content/OperationApplicationException;

    invoke-direct {v6, v8, v7}, Landroid/content/OperationApplicationException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 484
    .end local v3    # "operation":Landroid/content/ContentProviderOperation;
    .end local v4    # "uri":Landroid/net/Uri;
    .end local v5    # "accessAttributionSource":Landroid/content/AttributionSource;
    :cond_67
    :goto_67
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 510
    .end local v2    # "i":I
    :cond_6a
    const-string v2, "applyBatch: "

    const-wide/32 v3, 0x100000

    invoke-static {v3, v4, v2, p2}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 511
    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v2, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v2

    .line 514
    .local v2, "original":Landroid/content/AttributionSource;
    :try_start_78
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v5, p2, p3}, Landroid/content/ContentInterface;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    move-result-object v5

    .line 516
    .local v5, "results":[Landroid/content/ContentProviderResult;
    if-eqz v5, :cond_97

    .line 517
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_81
    array-length v7, v5

    if-ge v6, v7, :cond_97

    .line 518
    aget v7, v1, v6

    const/4 v8, -0x2

    if-eq v7, v8, :cond_94

    .line 520
    new-instance v7, Landroid/content/ContentProviderResult;

    aget-object v8, v5, v6

    aget v9, v1, v6

    invoke-direct {v7, v8, v9}, Landroid/content/ContentProviderResult;-><init>(Landroid/content/ContentProviderResult;I)V

    aput-object v7, v5, v6
    :try_end_94
    .catch Landroid/os/RemoteException; {:try_start_78 .. :try_end_94} :catch_a3
    .catchall {:try_start_78 .. :try_end_94} :catchall_a1

    .line 517
    :cond_94
    add-int/lit8 v6, v6, 0x1

    goto :goto_81

    .line 524
    .end local v6    # "i":I
    :cond_97
    nop

    .line 528
    iget-object v6, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v6, v2}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 529
    invoke-static {v3, v4}, Landroid/os/Trace;->traceEnd(J)V

    .line 524
    return-object v5

    .line 528
    .end local v5    # "results":[Landroid/content/ContentProviderResult;
    :catchall_a1
    move-exception v5

    goto :goto_a9

    .line 525
    :catch_a3
    move-exception v5

    .line 526
    .local v5, "e":Landroid/os/RemoteException;
    :try_start_a4
    invoke-virtual {v5}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v6

    .end local v0    # "numOperations":I
    .end local v1    # "userIds":[I
    .end local v2    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "authority":Ljava/lang/String;
    .end local p3    # "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    throw v6
    :try_end_a9
    .catchall {:try_start_a4 .. :try_end_a9} :catchall_a1

    .line 528
    .end local v5    # "e":Landroid/os/RemoteException;
    .restart local v0    # "numOperations":I
    .restart local v1    # "userIds":[I
    .restart local v2    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "authority":Ljava/lang/String;
    .restart local p3    # "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    :goto_a9
    iget-object v6, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v6, v2}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 529
    invoke-static {v3, v4}, Landroid/os/Trace;->traceEnd(J)V

    .line 530
    throw v5
.end method

.method public blacklist bulkInsert(Landroid/content/AttributionSource;Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .registers 9
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "initialValues"    # [Landroid/content/ContentValues;

    .line 458
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 459
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 460
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceWritePermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v0

    if-eqz v0, :cond_14

    .line 462
    const/4 v0, 0x0

    return v0

    .line 464
    :cond_14
    const-string v0, "bulkInsert: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 465
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 468
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_26
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v1, p2, p3}, Landroid/content/ContentInterface;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    move-result v1
    :try_end_2c
    .catch Landroid/os/RemoteException; {:try_start_26 .. :try_end_2c} :catch_37
    .catchall {:try_start_26 .. :try_end_2c} :catchall_35

    .line 472
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 473
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 468
    return v1

    .line 472
    :catchall_35
    move-exception v1

    goto :goto_3d

    .line 469
    :catch_37
    move-exception v1

    .line 470
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_38
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "initialValues":[Landroid/content/ContentValues;
    throw v4
    :try_end_3d
    .catchall {:try_start_38 .. :try_end_3d} :catchall_35

    .line 472
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "initialValues":[Landroid/content/ContentValues;
    :goto_3d
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 473
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 474
    throw v1
.end method

.method public blacklist call(Landroid/content/AttributionSource;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 11
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "authority"    # Ljava/lang/String;
    .param p3, "method"    # Ljava/lang/String;
    .param p4, "arg"    # Ljava/lang/String;
    .param p5, "extras"    # Landroid/os/Bundle;

    .line 622
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mvalidateIncomingAuthority(Landroid/content/ContentProvider;Ljava/lang/String;)V

    .line 623
    const/4 v0, 0x1

    invoke-static {p5, v0}, Landroid/os/Bundle;->setDefusable(Landroid/os/Bundle;Z)Landroid/os/Bundle;

    .line 624
    const-string v0, "call: "

    const-wide/32 v1, 0x100000

    invoke-static {v1, v2, v0, p2}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 625
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 628
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_17
    iget-object v3, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v3, p2, p3, p4, p5}, Landroid/content/ContentInterface;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v3
    :try_end_1d
    .catch Landroid/os/RemoteException; {:try_start_17 .. :try_end_1d} :catch_28
    .catchall {:try_start_17 .. :try_end_1d} :catchall_26

    .line 632
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 633
    invoke-static {v1, v2}, Landroid/os/Trace;->traceEnd(J)V

    .line 628
    return-object v3

    .line 632
    :catchall_26
    move-exception v3

    goto :goto_2e

    .line 629
    :catch_28
    move-exception v3

    .line 630
    .local v3, "e":Landroid/os/RemoteException;
    :try_start_29
    invoke-virtual {v3}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "authority":Ljava/lang/String;
    .end local p3    # "method":Ljava/lang/String;
    .end local p4    # "arg":Ljava/lang/String;
    .end local p5    # "extras":Landroid/os/Bundle;
    throw v4
    :try_end_2e
    .catchall {:try_start_29 .. :try_end_2e} :catchall_26

    .line 632
    .end local v3    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "authority":Ljava/lang/String;
    .restart local p3    # "method":Ljava/lang/String;
    .restart local p4    # "arg":Ljava/lang/String;
    .restart local p5    # "extras":Landroid/os/Bundle;
    :goto_2e
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 633
    invoke-static {v1, v2}, Landroid/os/Trace;->traceEnd(J)V

    .line 634
    throw v3
.end method

.method public blacklist canonicalize(Landroid/content/AttributionSource;Landroid/net/Uri;)Landroid/net/Uri;
    .registers 9
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;

    .line 684
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 685
    invoke-static {p2}, Landroid/content/ContentProvider;->getUserIdFromUri(Landroid/net/Uri;)I

    move-result v0

    .line 686
    .local v0, "userId":I
    invoke-static {p2}, Landroid/content/ContentProvider;->getUriWithoutUserId(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 687
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceReadPermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v1

    if-eqz v1, :cond_16

    .line 689
    const/4 v1, 0x0

    return-object v1

    .line 691
    :cond_16
    const-string v1, "canonicalize: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    const-wide/32 v3, 0x100000

    invoke-static {v3, v4, v1, v2}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 692
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v1

    .line 695
    .local v1, "original":Landroid/content/AttributionSource;
    :try_start_28
    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v2, p2}, Landroid/content/ContentInterface;->canonicalize(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2, v0}, Landroid/content/ContentProvider;->maybeAddUserId(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v2
    :try_end_32
    .catch Landroid/os/RemoteException; {:try_start_28 .. :try_end_32} :catch_3d
    .catchall {:try_start_28 .. :try_end_32} :catchall_3b

    .line 699
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v5, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 700
    invoke-static {v3, v4}, Landroid/os/Trace;->traceEnd(J)V

    .line 695
    return-object v2

    .line 699
    :catchall_3b
    move-exception v2

    goto :goto_43

    .line 696
    :catch_3d
    move-exception v2

    .line 697
    .local v2, "e":Landroid/os/RemoteException;
    :try_start_3e
    invoke-virtual {v2}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v5

    .end local v0    # "userId":I
    .end local v1    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    throw v5
    :try_end_43
    .catchall {:try_start_3e .. :try_end_43} :catchall_3b

    .line 699
    .end local v2    # "e":Landroid/os/RemoteException;
    .restart local v0    # "userId":I
    .restart local v1    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    :goto_43
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v5, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 700
    invoke-static {v3, v4}, Landroid/os/Trace;->traceEnd(J)V

    .line 701
    throw v2
.end method

.method public blacklist canonicalizeAsync(Landroid/content/AttributionSource;Landroid/net/Uri;Landroid/os/RemoteCallback;)V
    .registers 8
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "callback"    # Landroid/os/RemoteCallback;

    .line 707
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 709
    .local v0, "result":Landroid/os/Bundle;
    :try_start_5
    const-string/jumbo v1, "result"

    .line 710
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->canonicalize(Landroid/content/AttributionSource;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    .line 709
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_f} :catch_10

    .line 714
    goto :goto_1b

    .line 711
    :catch_10
    move-exception v1

    .line 712
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Landroid/os/ParcelableException;

    invoke-direct {v2, v1}, Landroid/os/ParcelableException;-><init>(Ljava/lang/Throwable;)V

    const-string v3, "error"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 715
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1b
    invoke-virtual {p3, v0}, Landroid/os/RemoteCallback;->sendResult(Landroid/os/Bundle;)V

    .line 716
    return-void
.end method

.method public blacklist checkUriPermission(Landroid/content/AttributionSource;Landroid/net/Uri;II)I
    .registers 10
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "uid"    # I
    .param p4, "modeFlags"    # I

    .line 778
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 779
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 780
    const-string v0, "checkUriPermission: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 781
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 784
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_1e
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v1, p2, p3, p4}, Landroid/content/ContentInterface;->checkUriPermission(Landroid/net/Uri;II)I

    move-result v1
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1e .. :try_end_24} :catch_2f
    .catchall {:try_start_1e .. :try_end_24} :catchall_2d

    .line 788
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 789
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 784
    return v1

    .line 788
    :catchall_2d
    move-exception v1

    goto :goto_35

    .line 785
    :catch_2f
    move-exception v1

    .line 786
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_30
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "uid":I
    .end local p4    # "modeFlags":I
    throw v4
    :try_end_35
    .catchall {:try_start_30 .. :try_end_35} :catchall_2d

    .line 788
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "uid":I
    .restart local p4    # "modeFlags":I
    :goto_35
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 789
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 790
    throw v1
.end method

.method public greylist-max-o createCancellationSignal()Landroid/os/ICancellationSignal;
    .registers 2

    .line 679
    invoke-static {}, Landroid/os/CancellationSignal;->createTransport()Landroid/os/ICancellationSignal;

    move-result-object v0

    return-object v0
.end method

.method public blacklist delete(Landroid/content/AttributionSource;Landroid/net/Uri;Landroid/os/Bundle;)I
    .registers 9
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "extras"    # Landroid/os/Bundle;

    .line 536
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 537
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 538
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceWritePermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v0

    if-eqz v0, :cond_14

    .line 540
    const/4 v0, 0x0

    return v0

    .line 542
    :cond_14
    const-string v0, "delete: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 543
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 546
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_26
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v1, p2, p3}, Landroid/content/ContentInterface;->delete(Landroid/net/Uri;Landroid/os/Bundle;)I

    move-result v1
    :try_end_2c
    .catch Landroid/os/RemoteException; {:try_start_26 .. :try_end_2c} :catch_37
    .catchall {:try_start_26 .. :try_end_2c} :catchall_35

    .line 550
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 551
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 546
    return v1

    .line 550
    :catchall_35
    move-exception v1

    goto :goto_3d

    .line 547
    :catch_37
    move-exception v1

    .line 548
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_38
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "extras":Landroid/os/Bundle;
    throw v4
    :try_end_3d
    .catchall {:try_start_38 .. :try_end_3d} :catchall_35

    .line 550
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "extras":Landroid/os/Bundle;
    :goto_3d
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 551
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 552
    throw v1
.end method

.method greylist-max-o getContentProvider()Landroid/content/ContentProvider;
    .registers 2

    .line 239
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    return-object v0
.end method

.method public greylist-max-o getProviderName()Ljava/lang/String;
    .registers 2

    .line 244
    invoke-virtual {p0}, Landroid/content/ContentProvider$Transport;->getContentProvider()Landroid/content/ContentProvider;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public blacklist getStreamTypes(Landroid/content/AttributionSource;Landroid/net/Uri;Ljava/lang/String;)[Ljava/lang/String;
    .registers 9
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "mimeTypeFilter"    # Ljava/lang/String;

    .line 640
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 641
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 642
    const-string v0, "getStreamTypes: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 643
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 646
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_1e
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v1, p2, p3}, Landroid/content/ContentInterface;->getStreamTypes(Landroid/net/Uri;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1e .. :try_end_24} :catch_2f
    .catchall {:try_start_1e .. :try_end_24} :catchall_2d

    .line 650
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 651
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 646
    return-object v1

    .line 650
    :catchall_2d
    move-exception v1

    goto :goto_35

    .line 647
    :catch_2f
    move-exception v1

    .line 648
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_30
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "mimeTypeFilter":Ljava/lang/String;
    throw v4
    :try_end_35
    .catchall {:try_start_30 .. :try_end_35} :catchall_2d

    .line 650
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "mimeTypeFilter":Ljava/lang/String;
    :goto_35
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 651
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 652
    throw v1
.end method

.method public blacklist getType(Landroid/content/AttributionSource;Landroid/net/Uri;)Ljava/lang/String;
    .registers 10
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;

    .line 305
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 306
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 307
    const-string v0, "getType: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 308
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 311
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_1e
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->checkGetTypePermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v1

    if-nez v1, :cond_6a

    .line 314
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    const-string v4, "android.permission.GET_ANY_PROVIDER_TYPE"

    invoke-static {v1, v4, p1}, Landroid/content/ContentProvider;->-$$Nest$mcheckPermission(Landroid/content/ContentProvider;Ljava/lang/String;Landroid/content/AttributionSource;)I

    move-result v1

    if-nez v1, :cond_4f

    .line 320
    invoke-virtual {p0}, Landroid/content/ContentProvider$Transport;->getContentProvider()Landroid/content/ContentProvider;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ContentProvider;->clearCallingIdentity()Landroid/content/ContentProvider$CallingIdentity;

    move-result-object v1
    :try_end_36
    .catch Landroid/os/RemoteException; {:try_start_1e .. :try_end_36} :catch_9f
    .catchall {:try_start_1e .. :try_end_36} :catchall_9d

    .line 322
    .local v1, "origId":Landroid/content/ContentProvider$CallingIdentity;
    :try_start_36
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v4, p2}, Landroid/content/ContentInterface;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4
    :try_end_3c
    .catchall {:try_start_36 .. :try_end_3c} :catchall_45

    .line 324
    .local v4, "type":Ljava/lang/String;
    :try_start_3c
    invoke-virtual {p0}, Landroid/content/ContentProvider$Transport;->getContentProvider()Landroid/content/ContentProvider;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/content/ContentProvider;->restoreCallingIdentity(Landroid/content/ContentProvider$CallingIdentity;)V

    .line 325
    nop

    .line 326
    .end local v1    # "origId":Landroid/content/ContentProvider$CallingIdentity;
    goto :goto_56

    .line 324
    .end local v4    # "type":Ljava/lang/String;
    .restart local v1    # "origId":Landroid/content/ContentProvider$CallingIdentity;
    :catchall_45
    move-exception v4

    invoke-virtual {p0}, Landroid/content/ContentProvider$Transport;->getContentProvider()Landroid/content/ContentProvider;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/content/ContentProvider;->restoreCallingIdentity(Landroid/content/ContentProvider$CallingIdentity;)V

    .line 325
    nop

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    throw v4

    .line 327
    .end local v1    # "origId":Landroid/content/ContentProvider$CallingIdentity;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    :cond_4f
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v1, p2}, Landroid/content/ContentInterface;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    move-object v4, v1

    .line 330
    .restart local v4    # "type":Ljava/lang/String;
    :goto_56
    if-eqz v4, :cond_60

    .line 331
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    const/4 v5, 0x1

    invoke-direct {p0, v1, p2, v4, v5}, Landroid/content/ContentProvider$Transport;->logGetTypeData(ILandroid/net/Uri;Ljava/lang/String;Z)V
    :try_end_60
    .catch Landroid/os/RemoteException; {:try_start_3c .. :try_end_60} :catch_9f
    .catchall {:try_start_3c .. :try_end_60} :catchall_9d

    .line 333
    :cond_60
    nop

    .line 350
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 351
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 333
    return-object v4

    .line 335
    .end local v4    # "type":Ljava/lang/String;
    :cond_6a
    :try_start_6a
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    .line 336
    .local v1, "callingUid":I
    invoke-virtual {p0}, Landroid/content/ContentProvider$Transport;->getContentProvider()Landroid/content/ContentProvider;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ContentProvider;->clearCallingIdentity()Landroid/content/ContentProvider$CallingIdentity;

    move-result-object v4
    :try_end_76
    .catch Landroid/os/RemoteException; {:try_start_6a .. :try_end_76} :catch_9f
    .catchall {:try_start_6a .. :try_end_76} :catchall_9d

    .line 338
    .local v4, "origId":Landroid/content/ContentProvider$CallingIdentity;
    :try_start_76
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v5, p2}, Landroid/content/ContentProvider;->getTypeAnonymous(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v5

    .line 339
    .local v5, "type":Ljava/lang/String;
    if-eqz v5, :cond_82

    .line 340
    const/4 v6, 0x0

    invoke-direct {p0, v1, p2, v5, v6}, Landroid/content/ContentProvider$Transport;->logGetTypeData(ILandroid/net/Uri;Ljava/lang/String;Z)V
    :try_end_82
    .catchall {:try_start_76 .. :try_end_82} :catchall_93

    .line 342
    :cond_82
    nop

    .line 344
    :try_start_83
    invoke-virtual {p0}, Landroid/content/ContentProvider$Transport;->getContentProvider()Landroid/content/ContentProvider;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/content/ContentProvider;->restoreCallingIdentity(Landroid/content/ContentProvider$CallingIdentity;)V
    :try_end_8a
    .catch Landroid/os/RemoteException; {:try_start_83 .. :try_end_8a} :catch_9f
    .catchall {:try_start_83 .. :try_end_8a} :catchall_9d

    .line 350
    iget-object v6, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v6, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 351
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 342
    return-object v5

    .line 344
    .end local v5    # "type":Ljava/lang/String;
    :catchall_93
    move-exception v5

    :try_start_94
    invoke-virtual {p0}, Landroid/content/ContentProvider$Transport;->getContentProvider()Landroid/content/ContentProvider;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/content/ContentProvider;->restoreCallingIdentity(Landroid/content/ContentProvider$CallingIdentity;)V

    .line 345
    nop

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    throw v5
    :try_end_9d
    .catch Landroid/os/RemoteException; {:try_start_94 .. :try_end_9d} :catch_9f
    .catchall {:try_start_94 .. :try_end_9d} :catchall_9d

    .line 350
    .end local v1    # "callingUid":I
    .end local v4    # "origId":Landroid/content/ContentProvider$CallingIdentity;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    :catchall_9d
    move-exception v1

    goto :goto_a5

    .line 347
    :catch_9f
    move-exception v1

    .line 348
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_a0
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    throw v4
    :try_end_a5
    .catchall {:try_start_a0 .. :try_end_a5} :catchall_9d

    .line 350
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    :goto_a5
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 351
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 352
    throw v1
.end method

.method public blacklist getTypeAnonymousAsync(Landroid/net/Uri;Landroid/os/RemoteCallback;)V
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "callback"    # Landroid/os/RemoteCallback;

    .line 411
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p1}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p1

    .line 412
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p1

    .line 413
    const-string v0, "getTypeAnonymous: "

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 414
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 416
    .local v0, "result":Landroid/os/Bundle;
    :try_start_1d
    const-string/jumbo v1, "result"

    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v4, p1}, Landroid/content/ContentProvider;->getTypeAnonymous(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_29} :catch_32
    .catchall {:try_start_1d .. :try_end_29} :catchall_30

    .line 421
    :goto_29
    invoke-virtual {p2, v0}, Landroid/os/RemoteCallback;->sendResult(Landroid/os/Bundle;)V

    .line 422
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 423
    goto :goto_3e

    .line 421
    :catchall_30
    move-exception v1

    goto :goto_3f

    .line 417
    :catch_32
    move-exception v1

    .line 418
    .local v1, "e":Ljava/lang/Exception;
    :try_start_33
    const-string v4, "error"

    new-instance v5, Landroid/os/ParcelableException;

    invoke-direct {v5, v1}, Landroid/os/ParcelableException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
    :try_end_3d
    .catchall {:try_start_33 .. :try_end_3d} :catchall_30

    .end local v1    # "e":Ljava/lang/Exception;
    goto :goto_29

    .line 424
    :goto_3e
    return-void

    .line 421
    :goto_3f
    invoke-virtual {p2, v0}, Landroid/os/RemoteCallback;->sendResult(Landroid/os/Bundle;)V

    .line 422
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 423
    throw v1
.end method

.method public blacklist getTypeAsync(Landroid/content/AttributionSource;Landroid/net/Uri;Landroid/os/RemoteCallback;)V
    .registers 8
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "callback"    # Landroid/os/RemoteCallback;

    .line 397
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 399
    .local v0, "result":Landroid/os/Bundle;
    :try_start_5
    const-string/jumbo v1, "result"

    .line 400
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->getType(Landroid/content/AttributionSource;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 399
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_f} :catch_10

    .line 404
    goto :goto_1b

    .line 401
    :catch_10
    move-exception v1

    .line 402
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Landroid/os/ParcelableException;

    invoke-direct {v2, v1}, Landroid/os/ParcelableException;-><init>(Ljava/lang/Throwable;)V

    const-string v3, "error"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 405
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1b
    invoke-virtual {p3, v0}, Landroid/os/RemoteCallback;->sendResult(Landroid/os/Bundle;)V

    .line 406
    return-void
.end method

.method public blacklist insert(Landroid/content/AttributionSource;Landroid/net/Uri;Landroid/content/ContentValues;Landroid/os/Bundle;)Landroid/net/Uri;
    .registers 11
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "initialValues"    # Landroid/content/ContentValues;
    .param p4, "extras"    # Landroid/os/Bundle;

    .line 429
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 430
    invoke-static {p2}, Landroid/content/ContentProvider;->getUserIdFromUri(Landroid/net/Uri;)I

    move-result v0

    .line 431
    .local v0, "userId":I
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 432
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceWritePermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v1

    if-eqz v1, :cond_2f

    .line 434
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v1

    .line 437
    .local v1, "original":Landroid/content/AttributionSource;
    :try_start_1c
    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v2, p2, p3}, Landroid/content/ContentProvider;->rejectInsert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2
    :try_end_22
    .catchall {:try_start_1c .. :try_end_22} :catchall_28

    .line 439
    iget-object v3, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v3, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 437
    return-object v2

    .line 439
    :catchall_28
    move-exception v2

    iget-object v3, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v3, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 440
    throw v2

    .line 442
    .end local v1    # "original":Landroid/content/AttributionSource;
    :cond_2f
    const-string v1, "insert: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    const-wide/32 v3, 0x100000

    invoke-static {v3, v4, v1, v2}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 443
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v1

    .line 446
    .restart local v1    # "original":Landroid/content/AttributionSource;
    :try_start_41
    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v2, p2, p3, p4}, Landroid/content/ContentInterface;->insert(Landroid/net/Uri;Landroid/content/ContentValues;Landroid/os/Bundle;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2, v0}, Landroid/content/ContentProvider;->maybeAddUserId(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v2
    :try_end_4b
    .catch Landroid/os/RemoteException; {:try_start_41 .. :try_end_4b} :catch_56
    .catchall {:try_start_41 .. :try_end_4b} :catchall_54

    .line 450
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v5, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 451
    invoke-static {v3, v4}, Landroid/os/Trace;->traceEnd(J)V

    .line 446
    return-object v2

    .line 450
    :catchall_54
    move-exception v2

    goto :goto_5c

    .line 447
    :catch_56
    move-exception v2

    .line 448
    .local v2, "e":Landroid/os/RemoteException;
    :try_start_57
    invoke-virtual {v2}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v5

    .end local v0    # "userId":I
    .end local v1    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "initialValues":Landroid/content/ContentValues;
    .end local p4    # "extras":Landroid/os/Bundle;
    throw v5
    :try_end_5c
    .catchall {:try_start_57 .. :try_end_5c} :catchall_54

    .line 450
    .end local v2    # "e":Landroid/os/RemoteException;
    .restart local v0    # "userId":I
    .restart local v1    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "initialValues":Landroid/content/ContentValues;
    .restart local p4    # "extras":Landroid/os/Bundle;
    :goto_5c
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v5, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 451
    invoke-static {v3, v4}, Landroid/os/Trace;->traceEnd(J)V

    .line 452
    throw v2
.end method

.method public blacklist openAssetFile(Landroid/content/AttributionSource;Landroid/net/Uri;Ljava/lang/String;Landroid/os/ICancellationSignal;)Landroid/content/res/AssetFileDescriptor;
    .registers 10
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "mode"    # Ljava/lang/String;
    .param p4, "cancellationSignal"    # Landroid/os/ICancellationSignal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 602
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 603
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 604
    invoke-direct {p0, p1, p2, p3}, Landroid/content/ContentProvider$Transport;->enforceFilePermission(Landroid/content/AttributionSource;Landroid/net/Uri;Ljava/lang/String;)V

    .line 605
    const-string/jumbo v0, "openAssetFile: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 606
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 609
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_22
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    .line 610
    invoke-static {p4}, Landroid/os/CancellationSignal;->fromTransport(Landroid/os/ICancellationSignal;)Landroid/os/CancellationSignal;

    move-result-object v4

    .line 609
    invoke-interface {v1, p2, p3, v4}, Landroid/content/ContentInterface;->openAssetFile(Landroid/net/Uri;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1
    :try_end_2c
    .catch Landroid/os/RemoteException; {:try_start_22 .. :try_end_2c} :catch_37
    .catchall {:try_start_22 .. :try_end_2c} :catchall_35

    .line 614
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 615
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 609
    return-object v1

    .line 614
    :catchall_35
    move-exception v1

    goto :goto_3d

    .line 611
    :catch_37
    move-exception v1

    .line 612
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_38
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "mode":Ljava/lang/String;
    .end local p4    # "cancellationSignal":Landroid/os/ICancellationSignal;
    throw v4
    :try_end_3d
    .catchall {:try_start_38 .. :try_end_3d} :catchall_35

    .line 614
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "mode":Ljava/lang/String;
    .restart local p4    # "cancellationSignal":Landroid/os/ICancellationSignal;
    :goto_3d
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 615
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 616
    throw v1
.end method

.method public blacklist openFile(Landroid/content/AttributionSource;Landroid/net/Uri;Ljava/lang/String;Landroid/os/ICancellationSignal;)Landroid/os/ParcelFileDescriptor;
    .registers 10
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "mode"    # Ljava/lang/String;
    .param p4, "cancellationSignal"    # Landroid/os/ICancellationSignal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 581
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 582
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 583
    invoke-direct {p0, p1, p2, p3}, Landroid/content/ContentProvider$Transport;->enforceFilePermission(Landroid/content/AttributionSource;Landroid/net/Uri;Ljava/lang/String;)V

    .line 584
    const-string/jumbo v0, "openFile: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 585
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 588
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_22
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    .line 589
    invoke-static {p4}, Landroid/os/CancellationSignal;->fromTransport(Landroid/os/ICancellationSignal;)Landroid/os/CancellationSignal;

    move-result-object v4

    .line 588
    invoke-interface {v1, p2, p3, v4}, Landroid/content/ContentInterface;->openFile(Landroid/net/Uri;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/os/ParcelFileDescriptor;

    move-result-object v1
    :try_end_2c
    .catch Landroid/os/RemoteException; {:try_start_22 .. :try_end_2c} :catch_37
    .catchall {:try_start_22 .. :try_end_2c} :catchall_35

    .line 593
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 594
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 588
    return-object v1

    .line 593
    :catchall_35
    move-exception v1

    goto :goto_3d

    .line 590
    :catch_37
    move-exception v1

    .line 591
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_38
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "mode":Ljava/lang/String;
    .end local p4    # "cancellationSignal":Landroid/os/ICancellationSignal;
    throw v4
    :try_end_3d
    .catchall {:try_start_38 .. :try_end_3d} :catchall_35

    .line 593
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "mode":Ljava/lang/String;
    .restart local p4    # "cancellationSignal":Landroid/os/ICancellationSignal;
    :goto_3d
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 594
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 595
    throw v1
.end method

.method public blacklist openTypedAssetFile(Landroid/content/AttributionSource;Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ICancellationSignal;)Landroid/content/res/AssetFileDescriptor;
    .registers 11
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "opts"    # Landroid/os/Bundle;
    .param p5, "cancellationSignal"    # Landroid/os/ICancellationSignal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 659
    const/4 v0, 0x1

    invoke-static {p4, v0}, Landroid/os/Bundle;->setDefusable(Landroid/os/Bundle;Z)Landroid/os/Bundle;

    .line 660
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 661
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 662
    const-string/jumbo v0, "r"

    invoke-direct {p0, p1, p2, v0}, Landroid/content/ContentProvider$Transport;->enforceFilePermission(Landroid/content/AttributionSource;Landroid/net/Uri;Ljava/lang/String;)V

    .line 663
    const-string/jumbo v0, "openTypedAssetFile: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 664
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 667
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_29
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    .line 668
    invoke-static {p5}, Landroid/os/CancellationSignal;->fromTransport(Landroid/os/ICancellationSignal;)Landroid/os/CancellationSignal;

    move-result-object v4

    .line 667
    invoke-interface {v1, p2, p3, p4, v4}, Landroid/content/ContentInterface;->openTypedAssetFile(Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1
    :try_end_33
    .catch Landroid/os/RemoteException; {:try_start_29 .. :try_end_33} :catch_3e
    .catchall {:try_start_29 .. :try_end_33} :catchall_3c

    .line 672
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 673
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 667
    return-object v1

    .line 672
    :catchall_3c
    move-exception v1

    goto :goto_44

    .line 669
    :catch_3e
    move-exception v1

    .line 670
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_3f
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "mimeType":Ljava/lang/String;
    .end local p4    # "opts":Landroid/os/Bundle;
    .end local p5    # "cancellationSignal":Landroid/os/ICancellationSignal;
    throw v4
    :try_end_44
    .catchall {:try_start_3f .. :try_end_44} :catchall_3c

    .line 672
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "mimeType":Ljava/lang/String;
    .restart local p4    # "opts":Landroid/os/Bundle;
    .restart local p5    # "cancellationSignal":Landroid/os/ICancellationSignal;
    :goto_44
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 673
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 674
    throw v1
.end method

.method public blacklist query(Landroid/content/AttributionSource;Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ICancellationSignal;)Landroid/database/Cursor;
    .registers 11
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "queryArgs"    # Landroid/os/Bundle;
    .param p5, "cancellationSignal"    # Landroid/os/ICancellationSignal;

    .line 251
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 252
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 253
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceReadPermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v0

    if-eqz v0, :cond_4d

    .line 261
    const/4 v0, 0x0

    if-eqz p3, :cond_1b

    .line 262
    new-instance v1, Landroid/database/MatrixCursor;

    invoke-direct {v1, p3, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;I)V

    return-object v1

    .line 270
    :cond_1b
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v1

    .line 273
    .local v1, "original":Landroid/content/AttributionSource;
    :try_start_21
    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    .line 275
    invoke-static {p5}, Landroid/os/CancellationSignal;->fromTransport(Landroid/os/ICancellationSignal;)Landroid/os/CancellationSignal;

    move-result-object v3

    .line 273
    invoke-interface {v2, p2, p3, p4, v3}, Landroid/content/ContentInterface;->query(Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_2b
    .catch Landroid/os/RemoteException; {:try_start_21 .. :try_end_2b} :catch_41
    .catchall {:try_start_21 .. :try_end_2b} :catchall_3f

    .line 279
    .local v2, "cursor":Landroid/database/Cursor;
    iget-object v3, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v3, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 280
    nop

    .line 281
    if-nez v2, :cond_35

    .line 282
    const/4 v0, 0x0

    return-object v0

    .line 286
    :cond_35
    new-instance v3, Landroid/database/MatrixCursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;I)V

    return-object v3

    .line 279
    .end local v2    # "cursor":Landroid/database/Cursor;
    :catchall_3f
    move-exception v0

    goto :goto_47

    .line 276
    :catch_41
    move-exception v0

    .line 277
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_42
    invoke-virtual {v0}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v2

    .end local v1    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "projection":[Ljava/lang/String;
    .end local p4    # "queryArgs":Landroid/os/Bundle;
    .end local p5    # "cancellationSignal":Landroid/os/ICancellationSignal;
    throw v2
    :try_end_47
    .catchall {:try_start_42 .. :try_end_47} :catchall_3f

    .line 279
    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v1    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "projection":[Ljava/lang/String;
    .restart local p4    # "queryArgs":Landroid/os/Bundle;
    .restart local p5    # "cancellationSignal":Landroid/os/ICancellationSignal;
    :goto_47
    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v2, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 280
    throw v0

    .line 288
    .end local v1    # "original":Landroid/content/AttributionSource;
    :cond_4d
    const-string/jumbo v0, "query: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 289
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 292
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_60
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    .line 294
    invoke-static {p5}, Landroid/os/CancellationSignal;->fromTransport(Landroid/os/ICancellationSignal;)Landroid/os/CancellationSignal;

    move-result-object v4

    .line 292
    invoke-interface {v1, p2, p3, p4, v4}, Landroid/content/ContentInterface;->query(Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_6a
    .catch Landroid/os/RemoteException; {:try_start_60 .. :try_end_6a} :catch_75
    .catchall {:try_start_60 .. :try_end_6a} :catchall_73

    .line 298
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 299
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 292
    return-object v1

    .line 298
    :catchall_73
    move-exception v1

    goto :goto_7b

    .line 295
    :catch_75
    move-exception v1

    .line 296
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_76
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "projection":[Ljava/lang/String;
    .end local p4    # "queryArgs":Landroid/os/Bundle;
    .end local p5    # "cancellationSignal":Landroid/os/ICancellationSignal;
    throw v4
    :try_end_7b
    .catchall {:try_start_76 .. :try_end_7b} :catchall_73

    .line 298
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "projection":[Ljava/lang/String;
    .restart local p4    # "queryArgs":Landroid/os/Bundle;
    .restart local p5    # "cancellationSignal":Landroid/os/ICancellationSignal;
    :goto_7b
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 299
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 300
    throw v1
.end method

.method public blacklist refresh(Landroid/content/AttributionSource;Landroid/net/Uri;Landroid/os/Bundle;Landroid/os/ICancellationSignal;)Z
    .registers 10
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "extras"    # Landroid/os/Bundle;
    .param p4, "cancellationSignal"    # Landroid/os/ICancellationSignal;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 757
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 758
    invoke-static {p2}, Landroid/content/ContentProvider;->getUriWithoutUserId(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 759
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceReadPermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v0

    if-eqz v0, :cond_12

    .line 761
    const/4 v0, 0x0

    return v0

    .line 763
    :cond_12
    const-string/jumbo v0, "refresh: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 764
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 767
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_25
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    .line 768
    invoke-static {p4}, Landroid/os/CancellationSignal;->fromTransport(Landroid/os/ICancellationSignal;)Landroid/os/CancellationSignal;

    move-result-object v4

    .line 767
    invoke-interface {v1, p2, p3, v4}, Landroid/content/ContentInterface;->refresh(Landroid/net/Uri;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Z

    move-result v1
    :try_end_2f
    .catchall {:try_start_25 .. :try_end_2f} :catchall_38

    .line 770
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 771
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 767
    return v1

    .line 770
    :catchall_38
    move-exception v1

    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 771
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 772
    throw v1
.end method

.method public blacklist uncanonicalize(Landroid/content/AttributionSource;Landroid/net/Uri;)Landroid/net/Uri;
    .registers 9
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;

    .line 720
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 721
    invoke-static {p2}, Landroid/content/ContentProvider;->getUserIdFromUri(Landroid/net/Uri;)I

    move-result v0

    .line 722
    .local v0, "userId":I
    invoke-static {p2}, Landroid/content/ContentProvider;->getUriWithoutUserId(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 723
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceReadPermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v1

    if-eqz v1, :cond_16

    .line 725
    const/4 v1, 0x0

    return-object v1

    .line 727
    :cond_16
    const-string/jumbo v1, "uncanonicalize: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    const-wide/32 v3, 0x100000

    invoke-static {v3, v4, v1, v2}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 728
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v1, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v1

    .line 731
    .local v1, "original":Landroid/content/AttributionSource;
    :try_start_29
    iget-object v2, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v2, p2}, Landroid/content/ContentInterface;->uncanonicalize(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2, v0}, Landroid/content/ContentProvider;->maybeAddUserId(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v2
    :try_end_33
    .catch Landroid/os/RemoteException; {:try_start_29 .. :try_end_33} :catch_3e
    .catchall {:try_start_29 .. :try_end_33} :catchall_3c

    .line 735
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v5, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 736
    invoke-static {v3, v4}, Landroid/os/Trace;->traceEnd(J)V

    .line 731
    return-object v2

    .line 735
    :catchall_3c
    move-exception v2

    goto :goto_44

    .line 732
    :catch_3e
    move-exception v2

    .line 733
    .local v2, "e":Landroid/os/RemoteException;
    :try_start_3f
    invoke-virtual {v2}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v5

    .end local v0    # "userId":I
    .end local v1    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    throw v5
    :try_end_44
    .catchall {:try_start_3f .. :try_end_44} :catchall_3c

    .line 735
    .end local v2    # "e":Landroid/os/RemoteException;
    .restart local v0    # "userId":I
    .restart local v1    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    :goto_44
    iget-object v5, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v5, v1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 736
    invoke-static {v3, v4}, Landroid/os/Trace;->traceEnd(J)V

    .line 737
    throw v2
.end method

.method public blacklist uncanonicalizeAsync(Landroid/content/AttributionSource;Landroid/net/Uri;Landroid/os/RemoteCallback;)V
    .registers 8
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "callback"    # Landroid/os/RemoteCallback;

    .line 743
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 745
    .local v0, "result":Landroid/os/Bundle;
    :try_start_5
    const-string/jumbo v1, "result"

    .line 746
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->uncanonicalize(Landroid/content/AttributionSource;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    .line 745
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_f} :catch_10

    .line 750
    goto :goto_1b

    .line 747
    :catch_10
    move-exception v1

    .line 748
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Landroid/os/ParcelableException;

    invoke-direct {v2, v1}, Landroid/os/ParcelableException;-><init>(Ljava/lang/Throwable;)V

    const-string v3, "error"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 751
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1b
    invoke-virtual {p3, v0}, Landroid/os/RemoteCallback;->sendResult(Landroid/os/Bundle;)V

    .line 752
    return-void
.end method

.method public blacklist update(Landroid/content/AttributionSource;Landroid/net/Uri;Landroid/content/ContentValues;Landroid/os/Bundle;)I
    .registers 10
    .param p1, "attributionSource"    # Landroid/content/AttributionSource;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "values"    # Landroid/content/ContentValues;
    .param p4, "extras"    # Landroid/os/Bundle;

    .line 558
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-virtual {v0, p2}, Landroid/content/ContentProvider;->validateIncomingUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 559
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p2}, Landroid/content/ContentProvider;->-$$Nest$mmaybeGetUriWithoutUserId(Landroid/content/ContentProvider;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    .line 560
    invoke-direct {p0, p1, p2}, Landroid/content/ContentProvider$Transport;->enforceWritePermission(Landroid/content/AttributionSource;Landroid/net/Uri;)I

    move-result v0

    if-eqz v0, :cond_14

    .line 562
    const/4 v0, 0x0

    return v0

    .line 564
    :cond_14
    const-string/jumbo v0, "update: "

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3, v0, v1}, Landroid/content/ContentProvider;->-$$Nest$smtraceBegin(JLjava/lang/String;Ljava/lang/String;)V

    .line 565
    iget-object v0, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v0, p1}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    move-result-object v0

    .line 568
    .local v0, "original":Landroid/content/AttributionSource;
    :try_start_27
    iget-object v1, p0, Landroid/content/ContentProvider$Transport;->mInterface:Landroid/content/ContentInterface;

    invoke-interface {v1, p2, p3, p4}, Landroid/content/ContentInterface;->update(Landroid/net/Uri;Landroid/content/ContentValues;Landroid/os/Bundle;)I

    move-result v1
    :try_end_2d
    .catch Landroid/os/RemoteException; {:try_start_27 .. :try_end_2d} :catch_38
    .catchall {:try_start_27 .. :try_end_2d} :catchall_36

    .line 572
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 573
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 568
    return v1

    .line 572
    :catchall_36
    move-exception v1

    goto :goto_3e

    .line 569
    :catch_38
    move-exception v1

    .line 570
    .local v1, "e":Landroid/os/RemoteException;
    :try_start_39
    invoke-virtual {v1}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    move-result-object v4

    .end local v0    # "original":Landroid/content/AttributionSource;
    .end local p0    # "this":Landroid/content/ContentProvider$Transport;
    .end local p1    # "attributionSource":Landroid/content/AttributionSource;
    .end local p2    # "uri":Landroid/net/Uri;
    .end local p3    # "values":Landroid/content/ContentValues;
    .end local p4    # "extras":Landroid/os/Bundle;
    throw v4
    :try_end_3e
    .catchall {:try_start_39 .. :try_end_3e} :catchall_36

    .line 572
    .end local v1    # "e":Landroid/os/RemoteException;
    .restart local v0    # "original":Landroid/content/AttributionSource;
    .restart local p0    # "this":Landroid/content/ContentProvider$Transport;
    .restart local p1    # "attributionSource":Landroid/content/AttributionSource;
    .restart local p2    # "uri":Landroid/net/Uri;
    .restart local p3    # "values":Landroid/content/ContentValues;
    .restart local p4    # "extras":Landroid/os/Bundle;
    :goto_3e
    iget-object v4, p0, Landroid/content/ContentProvider$Transport;->this$0:Landroid/content/ContentProvider;

    invoke-static {v4, v0}, Landroid/content/ContentProvider;->-$$Nest$msetCallingAttributionSource(Landroid/content/ContentProvider;Landroid/content/AttributionSource;)Landroid/content/AttributionSource;

    .line 573
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 574
    throw v1
.end method
