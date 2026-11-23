.class public final Lru/oneme/mvibedev/MvibeStartupBannerHelper;
.super Ljava/lang/Object;
.source "MvibeStartupBannerHelper.java"


# static fields
.field private static final DAY_MS:J = 0x5265c00L

.field static final KEY_FIRST:Ljava/lang/String; = "first_launch"

.field static final KEY_LAST:Ljava/lang/String; = "last_show_time"

.field static final PREFS:Ljava/lang/String; = "mvibe_banner_prefs"


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static alive(Landroid/app/Activity;)Z
    .locals 1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static processJsonResponse(Landroid/app/Activity;Lorg/json/JSONObject;)V
    .locals 0

    return-void
.end method

.method static safeGetBoolean(Landroid/content/SharedPreferences;Ljava/lang/String;Z)Z
    .locals 0

    return p2
.end method

.method static safeGetLong(Landroid/content/SharedPreferences;Ljava/lang/String;J)J
    .locals 0

    return-wide p2
.end method

.method public static showDefaultDialog(Landroid/app/Activity;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method static showDefaultDialogSafe(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public static showDialogIfNeeded(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public static showLauncherDisabledDialog(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method
