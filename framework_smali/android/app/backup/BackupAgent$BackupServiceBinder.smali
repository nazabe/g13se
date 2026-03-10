.class Landroid/app/backup/BackupAgent$BackupServiceBinder;
.super Landroid/app/IBackupAgent$Stub;
.source "BackupAgent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/backup/BackupAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BackupServiceBinder"
.end annotation


# static fields
.field private static final greylist-max-o TAG:Ljava/lang/String; = "BackupServiceBinder"


# instance fields
.field final synthetic blacklist this$0:Landroid/app/backup/BackupAgent;


# direct methods
.method private constructor blacklist <init>(Landroid/app/backup/BackupAgent;)V
    .registers 2

    .line 1080
    iput-object p1, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-direct {p0}, Landroid/app/IBackupAgent$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor blacklist <init>(Landroid/app/backup/BackupAgent;Landroid/app/backup/BackupAgent$BackupServiceBinder-IA;)V
    .registers 3

    invoke-direct {p0, p1}, Landroid/app/backup/BackupAgent$BackupServiceBinder;-><init>(Landroid/app/backup/BackupAgent;)V

    return-void
.end method

.method private blacklist doRestoreInternal(Landroid/os/ParcelFileDescriptor;JLandroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;Ljava/util/List;)V
    .registers 25
    .param p1, "data"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "appVersionCode"    # J
    .param p4, "newState"    # Landroid/os/ParcelFileDescriptor;
    .param p5, "token"    # I
    .param p6, "callbackBinder"    # Landroid/app/backup/IBackupManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/ParcelFileDescriptor;",
            "J",
            "Landroid/os/ParcelFileDescriptor;",
            "I",
            "Landroid/app/backup/IBackupManager;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1153
    .local p7, "excludedKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v1, p0

    move/from16 v2, p5

    move-object/from16 v3, p6

    move-object/from16 v4, p7

    const-string v5, ") threw"

    const-string/jumbo v6, "onRestore ("

    const-string v7, "BackupServiceBinder"

    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1155
    new-instance v9, Landroid/app/backup/BackupDataInput;

    invoke-virtual/range {p1 .. p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-direct {v9, v0}, Landroid/app/backup/BackupDataInput;-><init>(Ljava/io/FileDescriptor;)V

    .line 1158
    .local v9, "input":Landroid/app/backup/BackupDataInput;
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v14

    .line 1160
    .local v14, "ident":J
    const-wide/16 v12, 0x0

    :try_start_23
    iget-object v8, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_25} :catch_9e
    .catch Ljava/lang/RuntimeException; {:try_start_23 .. :try_end_25} :catch_74
    .catchall {:try_start_23 .. :try_end_25} :catchall_70

    .line 1161
    if-eqz v4, :cond_32

    :try_start_27
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2c} :catch_9e
    .catch Ljava/lang/RuntimeException; {:try_start_27 .. :try_end_2c} :catch_74
    .catchall {:try_start_27 .. :try_end_2c} :catchall_2d

    goto :goto_36

    .line 1171
    :catchall_2d
    move-exception v0

    move-object v6, v0

    move-wide v4, v12

    goto/16 :goto_cb

    .line 1162
    :cond_32
    :try_start_32
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_36} :catch_69
    .catch Ljava/lang/RuntimeException; {:try_start_32 .. :try_end_36} :catch_74
    .catchall {:try_start_32 .. :try_end_36} :catchall_70

    .line 1160
    :goto_36
    move-wide/from16 v10, p2

    move-object/from16 v16, v5

    move-wide v4, v12

    move-object/from16 v12, p4

    move-object v13, v0

    :try_start_3e
    invoke-virtual/range {v8 .. v13}, Landroid/app/backup/BackupAgent;->onRestore(Landroid/app/backup/BackupDataInput;JLandroid/os/ParcelFileDescriptor;Ljava/util/Set;)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_41} :catch_67
    .catch Ljava/lang/RuntimeException; {:try_start_3e .. :try_end_41} :catch_65
    .catchall {:try_start_3e .. :try_end_41} :catchall_c9

    .line 1171
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v0}, Landroid/app/backup/BackupAgent;->reloadSharedPreferences()V

    .line 1173
    invoke-static {v14, v15}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1175
    :try_start_49
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v0

    invoke-interface {v3, v0, v2, v4, v5}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_52
    .catch Landroid/os/RemoteException; {:try_start_49 .. :try_end_52} :catch_53

    .line 1178
    goto :goto_54

    .line 1176
    :catch_53
    move-exception v0

    .line 1180
    :goto_54
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    if-eq v0, v4, :cond_64

    .line 1181
    invoke-static/range {p1 .. p1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1182
    invoke-static/range {p4 .. p4}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1185
    :cond_64
    return-void

    .line 1166
    :catch_65
    move-exception v0

    goto :goto_78

    .line 1163
    :catch_67
    move-exception v0

    goto :goto_6d

    :catch_69
    move-exception v0

    move-object/from16 v16, v5

    move-wide v4, v12

    :goto_6d
    move-object/from16 v8, v16

    goto :goto_a1

    .line 1171
    :catchall_70
    move-exception v0

    move-wide v4, v12

    :goto_72
    move-object v6, v0

    goto :goto_cb

    .line 1166
    :catch_74
    move-exception v0

    move-object/from16 v16, v5

    move-wide v4, v12

    .line 1167
    .local v0, "ex":Ljava/lang/RuntimeException;
    :goto_78
    :try_start_78
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v8, v16

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1168
    nop

    .end local v9    # "input":Landroid/app/backup/BackupDataInput;
    .end local v14    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .end local p2    # "appVersionCode":J
    .end local p4    # "newState":Landroid/os/ParcelFileDescriptor;
    .end local p5    # "token":I
    .end local p6    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .end local p7    # "excludedKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    throw v0

    .line 1163
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    .restart local v9    # "input":Landroid/app/backup/BackupDataInput;
    .restart local v14    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .restart local p2    # "appVersionCode":J
    .restart local p4    # "newState":Landroid/os/ParcelFileDescriptor;
    .restart local p5    # "token":I
    .restart local p6    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .restart local p7    # "excludedKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_9e
    move-exception v0

    move-object v8, v5

    move-wide v4, v12

    .line 1164
    .local v0, "ex":Ljava/io/IOException;
    :goto_a1
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v10, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1165
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .end local v9    # "input":Landroid/app/backup/BackupDataInput;
    .end local v14    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .end local p2    # "appVersionCode":J
    .end local p4    # "newState":Landroid/os/ParcelFileDescriptor;
    .end local p5    # "token":I
    .end local p6    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .end local p7    # "excludedKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    throw v6
    :try_end_c9
    .catchall {:try_start_78 .. :try_end_c9} :catchall_c9

    .line 1171
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v9    # "input":Landroid/app/backup/BackupDataInput;
    .restart local v14    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .restart local p2    # "appVersionCode":J
    .restart local p4    # "newState":Landroid/os/ParcelFileDescriptor;
    .restart local p5    # "token":I
    .restart local p6    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .restart local p7    # "excludedKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_c9
    move-exception v0

    goto :goto_72

    :goto_cb
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v0}, Landroid/app/backup/BackupAgent;->reloadSharedPreferences()V

    .line 1173
    invoke-static {v14, v15}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1175
    :try_start_d3
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v0

    invoke-interface {v3, v0, v2, v4, v5}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_dc
    .catch Landroid/os/RemoteException; {:try_start_d3 .. :try_end_dc} :catch_dd

    .line 1178
    goto :goto_de

    .line 1176
    :catch_dd
    move-exception v0

    .line 1180
    :goto_de
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    if-eq v0, v4, :cond_ee

    .line 1181
    invoke-static/range {p1 .. p1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1182
    invoke-static/range {p4 .. p4}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1184
    :cond_ee
    throw v6
.end method


# virtual methods
.method public blacklist clearBackupRestoreEventLogger()V
    .registers 7

    .line 1363
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 1365
    .local v0, "ident":J
    :try_start_4
    iget-object v2, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v2}, Landroid/app/backup/BackupAgent;->clearBackupRestoreEventLogger()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_10
    .catchall {:try_start_4 .. :try_end_9} :catchall_e

    .line 1371
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1372
    nop

    .line 1373
    return-void

    .line 1371
    :catchall_e
    move-exception v2

    goto :goto_3b

    .line 1366
    :catch_10
    move-exception v2

    .line 1367
    .local v2, "e":Ljava/lang/Exception;
    :try_start_11
    const-string v3, "BackupServiceBinder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "clearBackupRestoreEventLogger ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") threw"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1369
    nop

    .end local v0    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    throw v2
    :try_end_3b
    .catchall {:try_start_11 .. :try_end_3b} :catchall_e

    .line 1371
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    :goto_3b
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1372
    throw v2
.end method

.method public blacklist doBackup(Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;JLandroid/app/backup/IBackupCallback;I)V
    .registers 25
    .param p1, "oldState"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "data"    # Landroid/os/ParcelFileDescriptor;
    .param p3, "newState"    # Landroid/os/ParcelFileDescriptor;
    .param p4, "quotaBytes"    # J
    .param p6, "callbackBinder"    # Landroid/app/backup/IBackupCallback;
    .param p7, "transportFlags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1093
    move-object/from16 v1, p0

    move-object/from16 v2, p6

    const-string v3, ") threw"

    const-string/jumbo v4, "onBackup ("

    const-string v5, "BackupServiceBinder"

    new-instance v0, Landroid/app/backup/BackupDataOutput;

    .line 1094
    invoke-virtual/range {p2 .. p2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v6

    move-wide/from16 v7, p4

    move/from16 v9, p7

    invoke-direct {v0, v6, v7, v8, v9}, Landroid/app/backup/BackupDataOutput;-><init>(Ljava/io/FileDescriptor;JI)V

    move-object v6, v0

    .line 1096
    .local v6, "output":Landroid/app/backup/BackupDataOutput;
    const-wide/16 v10, -0x1

    .line 1099
    .local v10, "result":J
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v12

    .line 1101
    .local v12, "ident":J
    :try_start_1f
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_21} :catch_87
    .catch Ljava/lang/RuntimeException; {:try_start_1f .. :try_end_21} :catch_5c
    .catchall {:try_start_1f .. :try_end_21} :catchall_53

    move-object/from16 v14, p1

    move-object/from16 v15, p3

    :try_start_25
    invoke-virtual {v0, v14, v6, v15}, Landroid/app/backup/BackupAgent;->onBackup(Landroid/os/ParcelFileDescriptor;Landroid/app/backup/BackupDataOutput;Landroid/os/ParcelFileDescriptor;)V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_28} :catch_4f
    .catch Ljava/lang/RuntimeException; {:try_start_25 .. :try_end_28} :catch_4d
    .catchall {:try_start_25 .. :try_end_28} :catchall_4b

    .line 1102
    const-wide/16 v3, 0x0

    .line 1113
    .end local v10    # "result":J
    .local v3, "result":J
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1115
    invoke-static {v12, v13}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1117
    :try_start_32
    invoke-interface {v2, v3, v4}, Landroid/app/backup/IBackupCallback;->operationComplete(J)V
    :try_end_35
    .catch Landroid/os/RemoteException; {:try_start_32 .. :try_end_35} :catch_36

    .line 1120
    goto :goto_37

    .line 1118
    :catch_36
    move-exception v0

    .line 1123
    :goto_37
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    if-eq v0, v5, :cond_4a

    .line 1124
    invoke-static/range {p1 .. p1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1125
    invoke-static/range {p2 .. p2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1126
    invoke-static/range {p3 .. p3}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1129
    :cond_4a
    return-void

    .line 1113
    .end local v3    # "result":J
    .restart local v10    # "result":J
    :catchall_4b
    move-exception v0

    goto :goto_58

    .line 1106
    :catch_4d
    move-exception v0

    goto :goto_61

    .line 1103
    :catch_4f
    move-exception v0

    move-object/from16 v16, v6

    goto :goto_8e

    .line 1113
    :catchall_53
    move-exception v0

    move-object/from16 v14, p1

    move-object/from16 v15, p3

    :goto_58
    move-object v3, v0

    move-object/from16 v16, v6

    goto :goto_b8

    .line 1106
    :catch_5c
    move-exception v0

    move-object/from16 v14, p1

    move-object/from16 v15, p3

    .line 1107
    .local v0, "ex":Ljava/lang/RuntimeException;
    :goto_61
    move-object/from16 v16, v6

    .end local v6    # "output":Landroid/app/backup/BackupDataOutput;
    .local v16, "output":Landroid/app/backup/BackupDataOutput;
    :try_start_63
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1108
    nop

    .end local v10    # "result":J
    .end local v12    # "ident":J
    .end local v16    # "output":Landroid/app/backup/BackupDataOutput;
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "oldState":Landroid/os/ParcelFileDescriptor;
    .end local p2    # "data":Landroid/os/ParcelFileDescriptor;
    .end local p3    # "newState":Landroid/os/ParcelFileDescriptor;
    .end local p4    # "quotaBytes":J
    .end local p6    # "callbackBinder":Landroid/app/backup/IBackupCallback;
    .end local p7    # "transportFlags":I
    throw v0

    .line 1103
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    .restart local v6    # "output":Landroid/app/backup/BackupDataOutput;
    .restart local v10    # "result":J
    .restart local v12    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "oldState":Landroid/os/ParcelFileDescriptor;
    .restart local p2    # "data":Landroid/os/ParcelFileDescriptor;
    .restart local p3    # "newState":Landroid/os/ParcelFileDescriptor;
    .restart local p4    # "quotaBytes":J
    .restart local p6    # "callbackBinder":Landroid/app/backup/IBackupCallback;
    .restart local p7    # "transportFlags":I
    :catch_87
    move-exception v0

    move-object/from16 v14, p1

    move-object/from16 v15, p3

    move-object/from16 v16, v6

    .line 1104
    .end local v6    # "output":Landroid/app/backup/BackupDataOutput;
    .local v0, "ex":Ljava/io/IOException;
    .restart local v16    # "output":Landroid/app/backup/BackupDataOutput;
    :goto_8e
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1105
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .end local v10    # "result":J
    .end local v12    # "ident":J
    .end local v16    # "output":Landroid/app/backup/BackupDataOutput;
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "oldState":Landroid/os/ParcelFileDescriptor;
    .end local p2    # "data":Landroid/os/ParcelFileDescriptor;
    .end local p3    # "newState":Landroid/os/ParcelFileDescriptor;
    .end local p4    # "quotaBytes":J
    .end local p6    # "callbackBinder":Landroid/app/backup/IBackupCallback;
    .end local p7    # "transportFlags":I
    throw v3
    :try_end_b6
    .catchall {:try_start_63 .. :try_end_b6} :catchall_b6

    .line 1113
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v10    # "result":J
    .restart local v12    # "ident":J
    .restart local v16    # "output":Landroid/app/backup/BackupDataOutput;
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "oldState":Landroid/os/ParcelFileDescriptor;
    .restart local p2    # "data":Landroid/os/ParcelFileDescriptor;
    .restart local p3    # "newState":Landroid/os/ParcelFileDescriptor;
    .restart local p4    # "quotaBytes":J
    .restart local p6    # "callbackBinder":Landroid/app/backup/IBackupCallback;
    .restart local p7    # "transportFlags":I
    :catchall_b6
    move-exception v0

    move-object v3, v0

    :goto_b8
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1115
    invoke-static {v12, v13}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1117
    :try_start_c0
    invoke-interface {v2, v10, v11}, Landroid/app/backup/IBackupCallback;->operationComplete(J)V
    :try_end_c3
    .catch Landroid/os/RemoteException; {:try_start_c0 .. :try_end_c3} :catch_c4

    .line 1120
    goto :goto_c5

    .line 1118
    :catch_c4
    move-exception v0

    .line 1123
    :goto_c5
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    if-eq v0, v4, :cond_d8

    .line 1124
    invoke-static/range {p1 .. p1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1125
    invoke-static/range {p2 .. p2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1126
    invoke-static/range {p3 .. p3}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1128
    :cond_d8
    throw v3
.end method

.method public greylist-max-o doFullBackup(Landroid/os/ParcelFileDescriptor;JILandroid/app/backup/IBackupManager;I)V
    .registers 23
    .param p1, "data"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "quotaBytes"    # J
    .param p4, "token"    # I
    .param p5, "callbackBinder"    # Landroid/app/backup/IBackupManager;
    .param p6, "transportFlags"    # I

    .line 1194
    move-object/from16 v1, p0

    move/from16 v2, p4

    move-object/from16 v3, p5

    const-string v4, ") threw"

    const-string v5, "Unable to finalize backup stream!"

    const-string/jumbo v6, "onFullBackup ("

    const-string v7, "BackupServiceBinder"

    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1197
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v8

    .line 1199
    .local v8, "ident":J
    const/4 v12, 0x4

    :try_start_19
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    new-instance v13, Landroid/app/backup/FullBackupDataOutput;
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1d} :catch_99
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_1d} :catch_6e
    .catchall {:try_start_19 .. :try_end_1d} :catchall_65

    move-object/from16 v14, p1

    move-wide/from16 v10, p2

    move/from16 v15, p6

    :try_start_23
    invoke-direct {v13, v14, v10, v11, v15}, Landroid/app/backup/FullBackupDataOutput;-><init>(Landroid/os/ParcelFileDescriptor;JI)V

    invoke-virtual {v0, v13}, Landroid/app/backup/BackupAgent;->onFullBackup(Landroid/app/backup/FullBackupDataOutput;)V
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_29} :catch_63
    .catch Ljava/lang/RuntimeException; {:try_start_23 .. :try_end_29} :catch_61
    .catchall {:try_start_23 .. :try_end_29} :catchall_5f

    .line 1209
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1214
    :try_start_2e
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-virtual/range {p1 .. p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 1215
    .local v0, "out":Ljava/io/FileOutputStream;
    new-array v4, v12, [B

    .line 1216
    .local v4, "buf":[B
    invoke-virtual {v0, v4}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_3c} :catch_3d

    .line 1219
    .end local v0    # "out":Ljava/io/FileOutputStream;
    .end local v4    # "buf":[B
    goto :goto_41

    .line 1217
    :catch_3d
    move-exception v0

    .line 1218
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v7, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1221
    .end local v0    # "e":Ljava/io/IOException;
    :goto_41
    invoke-static {v8, v9}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1223
    :try_start_44
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v0

    const-wide/16 v4, 0x0

    invoke-interface {v3, v0, v2, v4, v5}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_4f
    .catch Landroid/os/RemoteException; {:try_start_44 .. :try_end_4f} :catch_50

    .line 1226
    goto :goto_51

    .line 1224
    :catch_50
    move-exception v0

    .line 1228
    :goto_51
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    if-eq v0, v4, :cond_5e

    .line 1229
    invoke-static/range {p1 .. p1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1232
    :cond_5e
    return-void

    .line 1209
    :catchall_5f
    move-exception v0

    goto :goto_6c

    .line 1204
    :catch_61
    move-exception v0

    goto :goto_75

    .line 1201
    :catch_63
    move-exception v0

    goto :goto_a0

    .line 1209
    :catchall_65
    move-exception v0

    move-object/from16 v14, p1

    move-wide/from16 v10, p2

    move/from16 v15, p6

    :goto_6c
    move-object v4, v0

    goto :goto_c8

    .line 1204
    :catch_6e
    move-exception v0

    move-object/from16 v14, p1

    move-wide/from16 v10, p2

    move/from16 v15, p6

    .line 1205
    .local v0, "ex":Ljava/lang/RuntimeException;
    :goto_75
    :try_start_75
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v13, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1206
    nop

    .end local v8    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .end local p2    # "quotaBytes":J
    .end local p4    # "token":I
    .end local p5    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .end local p6    # "transportFlags":I
    throw v0

    .line 1201
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    .restart local v8    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .restart local p2    # "quotaBytes":J
    .restart local p4    # "token":I
    .restart local p5    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .restart local p6    # "transportFlags":I
    :catch_99
    move-exception v0

    move-object/from16 v14, p1

    move-wide/from16 v10, p2

    move/from16 v15, p6

    .line 1202
    .local v0, "ex":Ljava/io/IOException;
    :goto_a0
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v13, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1203
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .end local v8    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .end local p2    # "quotaBytes":J
    .end local p4    # "token":I
    .end local p5    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .end local p6    # "transportFlags":I
    throw v4
    :try_end_c8
    .catchall {:try_start_75 .. :try_end_c8} :catchall_5f

    .line 1209
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v8    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .restart local p2    # "quotaBytes":J
    .restart local p4    # "token":I
    .restart local p5    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .restart local p6    # "transportFlags":I
    :goto_c8
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1214
    :try_start_cd
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-virtual/range {p1 .. p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 1215
    .local v0, "out":Ljava/io/FileOutputStream;
    new-array v6, v12, [B

    .line 1216
    .local v6, "buf":[B
    invoke-virtual {v0, v6}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_db
    .catch Ljava/io/IOException; {:try_start_cd .. :try_end_db} :catch_dc

    .line 1219
    .end local v0    # "out":Ljava/io/FileOutputStream;
    .end local v6    # "buf":[B
    goto :goto_e0

    .line 1217
    :catch_dc
    move-exception v0

    .line 1218
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v7, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1221
    .end local v0    # "e":Ljava/io/IOException;
    :goto_e0
    invoke-static {v8, v9}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1223
    :try_start_e3
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v0

    const-wide/16 v5, 0x0

    invoke-interface {v3, v0, v2, v5, v6}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_ee
    .catch Landroid/os/RemoteException; {:try_start_e3 .. :try_end_ee} :catch_ef

    .line 1226
    goto :goto_f0

    .line 1224
    :catch_ef
    move-exception v0

    .line 1228
    :goto_f0
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    if-eq v0, v5, :cond_fd

    .line 1229
    invoke-static/range {p1 .. p1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1231
    :cond_fd
    throw v4
.end method

.method public greylist-max-o doMeasureFullBackup(JILandroid/app/backup/IBackupManager;I)V
    .registers 14
    .param p1, "quotaBytes"    # J
    .param p3, "token"    # I
    .param p4, "callbackBinder"    # Landroid/app/backup/IBackupManager;
    .param p5, "transportFlags"    # I

    .line 1236
    const-string v0, ") threw"

    const-string/jumbo v1, "onFullBackup[M] ("

    const-string v2, "BackupServiceBinder"

    new-instance v3, Landroid/app/backup/FullBackupDataOutput;

    invoke-direct {v3, p1, p2, p5}, Landroid/app/backup/FullBackupDataOutput;-><init>(JI)V

    .line 1239
    .local v3, "measureOutput":Landroid/app/backup/FullBackupDataOutput;
    iget-object v4, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v4}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1242
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v4

    .line 1244
    .local v4, "ident":J
    :try_start_15
    iget-object v6, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v6, v3}, Landroid/app/backup/BackupAgent;->onFullBackup(Landroid/app/backup/FullBackupDataOutput;)V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_1a} :catch_55
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_1a} :catch_30
    .catchall {:try_start_15 .. :try_end_1a} :catchall_2e

    .line 1252
    invoke-static {v4, v5}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1254
    :try_start_1d
    iget-object v0, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v0

    .line 1255
    invoke-virtual {v3}, Landroid/app/backup/FullBackupDataOutput;->getSize()J

    move-result-wide v1

    .line 1254
    invoke-interface {p4, v0, p3, v1, v2}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_2a
    .catch Landroid/os/RemoteException; {:try_start_1d .. :try_end_2a} :catch_2b

    .line 1258
    goto :goto_2d

    .line 1256
    :catch_2b
    move-exception v0

    .line 1259
    nop

    .line 1260
    :goto_2d
    return-void

    .line 1252
    :catchall_2e
    move-exception v0

    goto :goto_7e

    .line 1248
    :catch_30
    move-exception v6

    .line 1249
    .local v6, "ex":Ljava/lang/RuntimeException;
    :try_start_31
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v7, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1250
    nop

    .end local v3    # "measureOutput":Landroid/app/backup/FullBackupDataOutput;
    .end local v4    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "quotaBytes":J
    .end local p3    # "token":I
    .end local p4    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .end local p5    # "transportFlags":I
    throw v6

    .line 1245
    .end local v6    # "ex":Ljava/lang/RuntimeException;
    .restart local v3    # "measureOutput":Landroid/app/backup/FullBackupDataOutput;
    .restart local v4    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "quotaBytes":J
    .restart local p3    # "token":I
    .restart local p4    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .restart local p5    # "transportFlags":I
    :catch_55
    move-exception v6

    .line 1246
    .local v6, "ex":Ljava/io/IOException;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v7, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1247
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .end local v3    # "measureOutput":Landroid/app/backup/FullBackupDataOutput;
    .end local v4    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "quotaBytes":J
    .end local p3    # "token":I
    .end local p4    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .end local p5    # "transportFlags":I
    throw v0
    :try_end_7e
    .catchall {:try_start_31 .. :try_end_7e} :catchall_2e

    .line 1252
    .end local v6    # "ex":Ljava/io/IOException;
    .restart local v3    # "measureOutput":Landroid/app/backup/FullBackupDataOutput;
    .restart local v4    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "quotaBytes":J
    .restart local p3    # "token":I
    .restart local p4    # "callbackBinder":Landroid/app/backup/IBackupManager;
    .restart local p5    # "transportFlags":I
    :goto_7e
    invoke-static {v4, v5}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1254
    :try_start_81
    iget-object v1, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v1}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v1

    .line 1255
    invoke-virtual {v3}, Landroid/app/backup/FullBackupDataOutput;->getSize()J

    move-result-wide v6

    .line 1254
    invoke-interface {p4, v1, p3, v6, v7}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_8e
    .catch Landroid/os/RemoteException; {:try_start_81 .. :try_end_8e} :catch_8f

    .line 1258
    goto :goto_90

    .line 1256
    :catch_8f
    move-exception v1

    .line 1259
    :goto_90
    throw v0
.end method

.method public blacklist doQuotaExceeded(JJLandroid/app/backup/IBackupCallback;)V
    .registers 14
    .param p1, "backupDataBytes"    # J
    .param p3, "quotaBytes"    # J
    .param p5, "callbackBinder"    # Landroid/app/backup/IBackupCallback;

    .line 1322
    const-wide/16 v0, -0x1

    .line 1325
    .local v0, "result":J
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 1327
    .local v2, "ident":J
    :try_start_6
    iget-object v4, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v4, p1, p2, p3, p4}, Landroid/app/backup/BackupAgent;->onQuotaExceeded(JJ)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_b} :catch_1e
    .catchall {:try_start_6 .. :try_end_b} :catchall_1c

    .line 1328
    const-wide/16 v0, 0x0

    .line 1334
    iget-object v4, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v4}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1335
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1338
    :try_start_15
    invoke-interface {p5, v0, v1}, Landroid/app/backup/IBackupCallback;->operationComplete(J)V
    :try_end_18
    .catch Landroid/os/RemoteException; {:try_start_15 .. :try_end_18} :catch_19

    .line 1341
    goto :goto_1b

    .line 1339
    :catch_19
    move-exception v4

    .line 1342
    nop

    .line 1343
    :goto_1b
    return-void

    .line 1334
    :catchall_1c
    move-exception v4

    goto :goto_4a

    .line 1329
    :catch_1e
    move-exception v4

    .line 1330
    .local v4, "e":Ljava/lang/Exception;
    :try_start_1f
    const-string v5, "BackupServiceBinder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onQuotaExceeded("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") threw"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1332
    nop

    .end local v0    # "result":J
    .end local v2    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "backupDataBytes":J
    .end local p3    # "quotaBytes":J
    .end local p5    # "callbackBinder":Landroid/app/backup/IBackupCallback;
    throw v4
    :try_end_4a
    .catchall {:try_start_1f .. :try_end_4a} :catchall_1c

    .line 1334
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v0    # "result":J
    .restart local v2    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "backupDataBytes":J
    .restart local p3    # "quotaBytes":J
    .restart local p5    # "callbackBinder":Landroid/app/backup/IBackupCallback;
    :goto_4a
    iget-object v5, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v5}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1335
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1338
    :try_start_52
    invoke-interface {p5, v0, v1}, Landroid/app/backup/IBackupCallback;->operationComplete(J)V
    :try_end_55
    .catch Landroid/os/RemoteException; {:try_start_52 .. :try_end_55} :catch_56

    .line 1341
    goto :goto_57

    .line 1339
    :catch_56
    move-exception v5

    .line 1342
    :goto_57
    throw v4
.end method

.method public greylist-max-o doRestore(Landroid/os/ParcelFileDescriptor;JLandroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;)V
    .registers 15
    .param p1, "data"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "appVersionCode"    # J
    .param p4, "newState"    # Landroid/os/ParcelFileDescriptor;
    .param p5, "token"    # I
    .param p6, "callbackBinder"    # Landroid/app/backup/IBackupManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1135
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Landroid/app/backup/BackupAgent$BackupServiceBinder;->doRestoreInternal(Landroid/os/ParcelFileDescriptor;JLandroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;Ljava/util/List;)V

    .line 1137
    return-void
.end method

.method public greylist-max-o doRestoreFile(Landroid/os/ParcelFileDescriptor;JILjava/lang/String;Ljava/lang/String;JJILandroid/app/backup/IBackupManager;)V
    .registers 32
    .param p1, "data"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "size"    # J
    .param p4, "type"    # I
    .param p5, "domain"    # Ljava/lang/String;
    .param p6, "path"    # Ljava/lang/String;
    .param p7, "mode"    # J
    .param p9, "mtime"    # J
    .param p11, "token"    # I
    .param p12, "callbackBinder"    # Landroid/app/backup/IBackupManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1266
    move-object/from16 v1, p0

    move/from16 v2, p11

    move-object/from16 v3, p12

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v4

    .line 1268
    .local v4, "ident":J
    const-wide/16 v6, 0x0

    :try_start_c
    iget-object v8, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    move-object/from16 v9, p1

    move-wide/from16 v10, p2

    move/from16 v12, p4

    move-object/from16 v13, p5

    move-object/from16 v14, p6

    move-wide/from16 v15, p7

    move-wide/from16 v17, p9

    invoke-virtual/range {v8 .. v18}, Landroid/app/backup/BackupAgent;->onRestoreFile(Landroid/os/ParcelFileDescriptor;JILjava/lang/String;Ljava/lang/String;JJ)V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_1f} :catch_48
    .catchall {:try_start_c .. :try_end_1f} :catchall_45

    .line 1274
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1276
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v0}, Landroid/app/backup/BackupAgent;->reloadSharedPreferences()V

    .line 1278
    invoke-static {v4, v5}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1280
    :try_start_2c
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v0

    invoke-interface {v3, v0, v2, v6, v7}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_35
    .catch Landroid/os/RemoteException; {:try_start_2c .. :try_end_35} :catch_36

    .line 1283
    goto :goto_37

    .line 1281
    :catch_36
    move-exception v0

    .line 1285
    :goto_37
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v6

    if-eq v0, v6, :cond_44

    .line 1286
    invoke-static/range {p1 .. p1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1289
    :cond_44
    return-void

    .line 1274
    :catchall_45
    move-exception v0

    move-object v8, v0

    goto :goto_78

    .line 1269
    :catch_48
    move-exception v0

    .line 1270
    .local v0, "e":Ljava/io/IOException;
    :try_start_49
    const-string v8, "BackupServiceBinder"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "onRestoreFile ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ") threw"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1271
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-direct {v8, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .end local v4    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .end local p2    # "size":J
    .end local p4    # "type":I
    .end local p5    # "domain":Ljava/lang/String;
    .end local p6    # "path":Ljava/lang/String;
    .end local p7    # "mode":J
    .end local p9    # "mtime":J
    .end local p11    # "token":I
    .end local p12    # "callbackBinder":Landroid/app/backup/IBackupManager;
    throw v8
    :try_end_78
    .catchall {:try_start_49 .. :try_end_78} :catchall_45

    .line 1274
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v4    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "data":Landroid/os/ParcelFileDescriptor;
    .restart local p2    # "size":J
    .restart local p4    # "type":I
    .restart local p5    # "domain":Ljava/lang/String;
    .restart local p6    # "path":Ljava/lang/String;
    .restart local p7    # "mode":J
    .restart local p9    # "mtime":J
    .restart local p11    # "token":I
    .restart local p12    # "callbackBinder":Landroid/app/backup/IBackupManager;
    :goto_78
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1276
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v0}, Landroid/app/backup/BackupAgent;->reloadSharedPreferences()V

    .line 1278
    invoke-static {v4, v5}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1280
    :try_start_85
    iget-object v0, v1, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v0

    invoke-interface {v3, v0, v2, v6, v7}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_8e
    .catch Landroid/os/RemoteException; {:try_start_85 .. :try_end_8e} :catch_8f

    .line 1283
    goto :goto_90

    .line 1281
    :catch_8f
    move-exception v0

    .line 1285
    :goto_90
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v6

    if-eq v0, v6, :cond_9d

    .line 1286
    invoke-static/range {p1 .. p1}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1288
    :cond_9d
    throw v8
.end method

.method public greylist-max-o doRestoreFinished(ILandroid/app/backup/IBackupManager;)V
    .registers 11
    .param p1, "token"    # I
    .param p2, "callbackBinder"    # Landroid/app/backup/IBackupManager;

    .line 1293
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 1295
    .local v0, "ident":J
    const-wide/16 v2, 0x0

    :try_start_6
    iget-object v4, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v4}, Landroid/app/backup/BackupAgent;->onRestoreFinished()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_b} :catch_22
    .catchall {:try_start_6 .. :try_end_b} :catchall_20

    .line 1301
    iget-object v4, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v4}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1303
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1305
    :try_start_13
    iget-object v4, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v4}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v4

    invoke-interface {p2, v4, p1, v2, v3}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_1c
    .catch Landroid/os/RemoteException; {:try_start_13 .. :try_end_1c} :catch_1d

    .line 1308
    goto :goto_1f

    .line 1306
    :catch_1d
    move-exception v2

    .line 1309
    nop

    .line 1310
    :goto_1f
    return-void

    .line 1301
    :catchall_20
    move-exception v4

    goto :goto_4e

    .line 1296
    :catch_22
    move-exception v4

    .line 1297
    .local v4, "e":Ljava/lang/Exception;
    :try_start_23
    const-string v5, "BackupServiceBinder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onRestoreFinished ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") threw"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1298
    nop

    .end local v0    # "ident":J
    .end local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .end local p1    # "token":I
    .end local p2    # "callbackBinder":Landroid/app/backup/IBackupManager;
    throw v4
    :try_end_4e
    .catchall {:try_start_23 .. :try_end_4e} :catchall_20

    .line 1301
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v0    # "ident":J
    .restart local p0    # "this":Landroid/app/backup/BackupAgent$BackupServiceBinder;
    .restart local p1    # "token":I
    .restart local p2    # "callbackBinder":Landroid/app/backup/IBackupManager;
    :goto_4e
    iget-object v5, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v5}, Landroid/app/backup/BackupAgent;->-$$Nest$mwaitForSharedPrefs(Landroid/app/backup/BackupAgent;)V

    .line 1303
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1305
    :try_start_56
    iget-object v5, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v5}, Landroid/app/backup/BackupAgent;->-$$Nest$mgetBackupUserId(Landroid/app/backup/BackupAgent;)I

    move-result v5

    invoke-interface {p2, v5, p1, v2, v3}, Landroid/app/backup/IBackupManager;->opCompleteForUser(IIJ)V
    :try_end_5f
    .catch Landroid/os/RemoteException; {:try_start_56 .. :try_end_5f} :catch_60

    .line 1308
    goto :goto_61

    .line 1306
    :catch_60
    move-exception v2

    .line 1309
    :goto_61
    throw v4
.end method

.method public blacklist doRestoreWithExcludedKeys(Landroid/os/ParcelFileDescriptor;JLandroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;Ljava/util/List;)V
    .registers 8
    .param p1, "data"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "appVersionCode"    # J
    .param p4, "newState"    # Landroid/os/ParcelFileDescriptor;
    .param p5, "token"    # I
    .param p6, "callbackBinder"    # Landroid/app/backup/IBackupManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/ParcelFileDescriptor;",
            "J",
            "Landroid/os/ParcelFileDescriptor;",
            "I",
            "Landroid/app/backup/IBackupManager;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1143
    .local p7, "excludedKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p7}, Landroid/app/backup/BackupAgent$BackupServiceBinder;->doRestoreInternal(Landroid/os/ParcelFileDescriptor;JLandroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;Ljava/util/List;)V

    .line 1144
    return-void
.end method

.method public greylist-max-o fail(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .line 1314
    iget-object v0, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-virtual {v0}, Landroid/app/backup/BackupAgent;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Landroid/app/backup/BackupAgent$FailRunnable;

    invoke-direct {v1, p1}, Landroid/app/backup/BackupAgent$FailRunnable;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1315
    return-void
.end method

.method public blacklist getLoggerResults(Lcom/android/internal/infra/AndroidFuture;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/infra/AndroidFuture<",
            "Ljava/util/List<",
            "Landroid/app/backup/BackupRestoreEventLogger$DataTypeResult;",
            ">;>;)V"
        }
    .end annotation

    .line 1348
    .local p1, "in":Lcom/android/internal/infra/AndroidFuture;, "Lcom/android/internal/infra/AndroidFuture<Ljava/util/List<Landroid/app/backup/BackupRestoreEventLogger$DataTypeResult;>;>;"
    iget-object v0, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$fgetmLogger(Landroid/app/backup/BackupAgent;)Landroid/app/backup/BackupRestoreEventLogger;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 1349
    iget-object v0, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$fgetmLogger(Landroid/app/backup/BackupAgent;)Landroid/app/backup/BackupRestoreEventLogger;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/backup/BackupRestoreEventLogger;->getLoggingResults()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/infra/AndroidFuture;->complete(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 1351
    :cond_16
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/infra/AndroidFuture;->complete(Ljava/lang/Object;)Z

    .line 1353
    :goto_1d
    return-void
.end method

.method public blacklist getOperationType(Lcom/android/internal/infra/AndroidFuture;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/infra/AndroidFuture<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1358
    .local p1, "in":Lcom/android/internal/infra/AndroidFuture;, "Lcom/android/internal/infra/AndroidFuture<Ljava/lang/Integer;>;"
    iget-object v0, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$fgetmLogger(Landroid/app/backup/BackupAgent;)Landroid/app/backup/BackupRestoreEventLogger;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 v0, -0x1

    goto :goto_14

    :cond_a
    iget-object v0, p0, Landroid/app/backup/BackupAgent$BackupServiceBinder;->this$0:Landroid/app/backup/BackupAgent;

    invoke-static {v0}, Landroid/app/backup/BackupAgent;->-$$Nest$fgetmLogger(Landroid/app/backup/BackupAgent;)Landroid/app/backup/BackupRestoreEventLogger;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/backup/BackupRestoreEventLogger;->getOperationType()I

    move-result v0

    :goto_14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/infra/AndroidFuture;->complete(Ljava/lang/Object;)Z

    .line 1359
    return-void
.end method
