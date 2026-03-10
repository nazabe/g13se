.class Landroid/app/SystemServiceRegistry$82;
.super Landroid/app/SystemServiceRegistry$StaticServiceFetcher;
.source "SystemServiceRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/SystemServiceRegistry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/app/SystemServiceRegistry$StaticServiceFetcher<",
        "Lcom/payjoy/service/PayJoyAccessManager;",
        ">;"
    }
.end annotation


# direct methods
.method constructor blacklist <init>()V
    .registers 1

    .line 1074
    invoke-direct {p0}, Landroid/app/SystemServiceRegistry$StaticServiceFetcher;-><init>()V

    return-void
.end method


# virtual methods
.method public blacklist createService()Lcom/payjoy/service/PayJoyAccessManager;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/ServiceManager$ServiceNotFoundException;
        }
    .end annotation

    .line 1077
    const-string/jumbo v0, "payjoy_access_service"

    invoke-static {v0}, Landroid/os/ServiceManager;->getServiceOrThrow(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 1078
    .local v0, "b":Landroid/os/IBinder;
    invoke-static {v0}, Lcom/payjoy/service/IPayJoyAccessService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/payjoy/service/IPayJoyAccessService;

    move-result-object v1

    .line 1079
    .local v1, "payjoyAccessService":Lcom/payjoy/service/IPayJoyAccessService;
    if-eqz v1, :cond_13

    .line 1080
    new-instance v2, Lcom/payjoy/service/PayJoyAccessManager;

    invoke-direct {v2, v1}, Lcom/payjoy/service/PayJoyAccessManager;-><init>(Lcom/payjoy/service/IPayJoyAccessService;)V

    return-object v2

    .line 1083
    :cond_13
    const/4 v2, 0x0

    return-object v2
.end method

.method public bridge synthetic blacklist createService()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/ServiceManager$ServiceNotFoundException;
        }
    .end annotation

    .line 1074
    invoke-virtual {p0}, Landroid/app/SystemServiceRegistry$82;->createService()Lcom/payjoy/service/PayJoyAccessManager;

    move-result-object v0

    return-object v0
.end method
