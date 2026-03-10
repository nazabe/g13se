.class public final Landroid/graphics/text/LineBreakConfig$Builder;
.super Ljava/lang/Object;
.source "LineBreakConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/graphics/text/LineBreakConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private blacklist mAutoPhraseBreaking:Z

.field private blacklist mLineBreakStyle:I

.field private blacklist mLineBreakWordStyle:I


# direct methods
.method public constructor whitelist <init>()V
    .registers 2

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    const/4 v0, 0x0

    iput v0, p0, Landroid/graphics/text/LineBreakConfig$Builder;->mLineBreakStyle:I

    .line 94
    iput v0, p0, Landroid/graphics/text/LineBreakConfig$Builder;->mLineBreakWordStyle:I

    .line 100
    iput-boolean v0, p0, Landroid/graphics/text/LineBreakConfig$Builder;->mAutoPhraseBreaking:Z

    .line 106
    return-void
.end method


# virtual methods
.method public whitelist build()Landroid/graphics/text/LineBreakConfig;
    .registers 6

    .line 146
    new-instance v0, Landroid/graphics/text/LineBreakConfig;

    iget v1, p0, Landroid/graphics/text/LineBreakConfig$Builder;->mLineBreakStyle:I

    iget v2, p0, Landroid/graphics/text/LineBreakConfig$Builder;->mLineBreakWordStyle:I

    iget-boolean v3, p0, Landroid/graphics/text/LineBreakConfig$Builder;->mAutoPhraseBreaking:Z

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/text/LineBreakConfig;-><init>(IIZLandroid/graphics/text/LineBreakConfig-IA;)V

    return-object v0
.end method

.method public blacklist setAutoPhraseBreaking(Z)Landroid/graphics/text/LineBreakConfig$Builder;
    .registers 2
    .param p1, "autoPhraseBreaking"    # Z

    .line 136
    iput-boolean p1, p0, Landroid/graphics/text/LineBreakConfig$Builder;->mAutoPhraseBreaking:Z

    .line 137
    return-object p0
.end method

.method public whitelist setLineBreakStyle(I)Landroid/graphics/text/LineBreakConfig$Builder;
    .registers 2
    .param p1, "lineBreakStyle"    # I

    .line 115
    iput p1, p0, Landroid/graphics/text/LineBreakConfig$Builder;->mLineBreakStyle:I

    .line 116
    return-object p0
.end method

.method public whitelist setLineBreakWordStyle(I)Landroid/graphics/text/LineBreakConfig$Builder;
    .registers 2
    .param p1, "lineBreakWordStyle"    # I

    .line 126
    iput p1, p0, Landroid/graphics/text/LineBreakConfig$Builder;->mLineBreakWordStyle:I

    .line 127
    return-object p0
.end method
