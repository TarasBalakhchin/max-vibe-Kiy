.class public final Lru/oneme/mvibedev/MvibePushKeepAlive;
.super Ljava/lang/Object;
.source "MvibePushKeepAlive.java"


# static fields
.field public static final ACTION_WATCHDOG:Ljava/lang/String; = "ru.oneme.mvibedev.PUSH_WATCHDOG"

.field private static final TAG:Ljava/lang/String; = "MVibePush"

.field private static final WATCHDOG_MS:J = 0x15f90L

.field private static sBatteryAsked:Z

.field private static sChannelsDone:Z

.field private static sLastBgAttemptMs:J


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static enable(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 94
    :try_start_0
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, p1, p2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result p1

    .line 96
    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    return-void

    .line 97
    :cond_0
    invoke-virtual {p0, v0, p2, p2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    goto :goto_0

    .line 101
    :catchall_0
    move-exception p0

    .line 103
    :goto_0
    return-void
.end method

.method public static ensure(Landroid/content/Context;)V
    .locals 4

    invoke-static {p0}, Lru/oneme/mvibedev/MvibeDevPrefs;->isBgKeepAliveEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 34
    :cond_0
    const-string v0, "MVibePush"

    if-nez p0, :cond_1

    return-void

    .line 35
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 36
    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    move-object p0, v1

    .line 38
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 40
    const-string v3, "one.me.background.wake.BackgroundCheckReceiver"

    invoke-static {v1, v2, v3}, Lru/oneme/mvibedev/MvibePushKeepAlive;->enable(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    const-string v3, "one.me.background.wake.BackgroundWakeBootReceiver"

    invoke-static {v1, v2, v3}, Lru/oneme/mvibedev/MvibePushKeepAlive;->enable(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    const-string v3, "com.google.firebase.provider.FirebaseInitProvider"

    invoke-static {v1, v2, v3}, Lru/oneme/mvibedev/MvibePushKeepAlive;->enable(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    const-string v3, "ru.rustore.sdk.pushclient.provider.RuStorePushClientInitProvider"

    invoke-static {v1, v2, v3}, Lru/oneme/mvibedev/MvibePushKeepAlive;->enable(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    const-string v3, "one.me.sdk.vendor.push.FcmMessagingService"

    invoke-static {v1, v2, v3}, Lru/oneme/mvibedev/MvibePushKeepAlive;->enable(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    const-string v3, "one.me.sdk.vendor.rustore.push.RustoreMessagingService"

    invoke-static {v1, v2, v3}, Lru/oneme/mvibedev/MvibePushKeepAlive;->enable(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    const-string v3, "ru.oneme.mvibedev.MvibePushWatchdogReceiver"

    invoke-static {v1, v2, v3}, Lru/oneme/mvibedev/MvibePushKeepAlive;->enable(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    goto :goto_1

    .line 47
    :catchall_0
    move-exception v1

    .line 48
    const-string v2, "enable components"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    :goto_1
    :try_start_1
    sget-boolean v1, Lru/oneme/mvibedev/MvibePushKeepAlive;->sChannelsDone:Z

    if-nez v1, :cond_3

    .line 52
    invoke-static {p0}, Lru/oneme/mvibedev/MvibePushKeepAlive;->fixChannels(Landroid/content/Context;)V

    .line 53
    const/4 v1, 0x1

    sput-boolean v1, Lru/oneme/mvibedev/MvibePushKeepAlive;->sChannelsDone:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 57
    :cond_3
    goto :goto_2

    .line 55
    :catchall_1
    move-exception v1

    .line 56
    const-string v2, "fixChannels"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 59
    :goto_2
    :try_start_2
    invoke-static {p0}, Lru/oneme/mvibedev/MvibePushKeepAlive;->maybeRequestBatteryIgnore(Landroid/content/Context;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 61
    goto :goto_3

    .line 60
    :catchall_2
    move-exception v1

    .line 63
    :goto_3
    :try_start_3
    invoke-static {p0}, Lru/oneme/mvibedev/MvibePushKeepAlive;->startBackgroundListen(Landroid/content/Context;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 66
    goto :goto_4

    .line 64
    :catchall_3
    move-exception v1

    .line 65
    const-string v2, "startBackgroundListen"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 68
    :goto_4
    :try_start_4
    invoke-static {p0}, Lru/oneme/mvibedev/MvibePushKeepAlive;->scheduleWatchdog(Landroid/content/Context;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 71
    goto :goto_5

    .line 69
    :catchall_4
    move-exception p0

    .line 70
    const-string v1, "scheduleWatchdog"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 72
    :goto_5
    return-void
.end method

.method private static fixChannels(Landroid/content/Context;)V
    .locals 5

    .line 130
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    return-void

    .line 131
    :cond_0
    nop

    .line 132
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    .line 133
    if-nez p0, :cond_1

    return-void

    .line 135
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/NotificationManager;->isNotificationPolicyAccessGranted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 136
    invoke-static {p0}, Lru/oneme/mvibedev/MvibePushKeepAlive;->widenMessagePolicy(Landroid/app/NotificationManager;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    :cond_2
    goto :goto_0

    .line 138
    :catchall_0
    move-exception v0

    .line 140
    :goto_0
    const/4 v0, 0x4

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, "ru.oneme.app.dialogs"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "ru.oneme.app.chats"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "ru.oneme.app.inapp.2"

    const/4 v4, 0x2

    aput-object v2, v1, v4

    const-string v2, "ru.oneme.app.misc"

    const/4 v4, 0x3

    aput-object v2, v1, v4

    .line 146
    nop

    :goto_1
    if-ge v3, v0, :cond_3

    .line 147
    aget-object v2, v1, v3

    invoke-static {p0, v2}, Lru/oneme/mvibedev/MvibePushKeepAlive;->forceBypass(Landroid/app/NotificationManager;Ljava/lang/String;)V

    .line 146
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 149
    :cond_3
    return-void
.end method

.method private static forceBypass(Landroid/app/NotificationManager;Ljava/lang/String;)V
    .locals 7

    .line 194
    const-string v0, "MVibePush"

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v1

    .line 195
    if-nez v1, :cond_0

    return-void

    .line 196
    :cond_0
    invoke-virtual {v1}, Landroid/app/NotificationChannel;->canBypassDnd()Z

    move-result v2

    if-eqz v2, :cond_1

    return-void

    .line 197
    :cond_1
    invoke-virtual {v1}, Landroid/app/NotificationChannel;->getName()Ljava/lang/CharSequence;

    move-result-object v2

    .line 198
    invoke-virtual {v1}, Landroid/app/NotificationChannel;->getImportance()I

    move-result v3

    .line 199
    const/4 v4, 0x3

    if-ge v3, v4, :cond_2

    .line 200
    const/4 v3, 0x4

    .line 202
    :cond_2
    invoke-virtual {v1}, Landroid/app/NotificationChannel;->getGroup()Ljava/lang/String;

    move-result-object v4

    .line 203
    invoke-virtual {v1}, Landroid/app/NotificationChannel;->getSound()Landroid/net/Uri;

    move-result-object v5

    .line 204
    invoke-virtual {v1}, Landroid/app/NotificationChannel;->getAudioAttributes()Landroid/media/AudioAttributes;

    move-result-object v1

    .line 205
    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->deleteNotificationChannel(Ljava/lang/String;)V

    .line 206
    new-instance v6, Landroid/app/NotificationChannel;

    .line 207
    if-eqz v2, :cond_3

    goto :goto_0

    :cond_3
    move-object v2, p1

    :goto_0
    invoke-direct {v6, p1, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 208
    if-eqz v4, :cond_4

    invoke-virtual {v6, v4}, Landroid/app/NotificationChannel;->setGroup(Ljava/lang/String;)V

    .line 209
    :cond_4
    const/4 v2, 0x1

    invoke-virtual {v6, v2}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    .line 210
    invoke-virtual {v6, v2}, Landroid/app/NotificationChannel;->enableLights(Z)V

    .line 211
    invoke-virtual {v6, v2}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 212
    invoke-virtual {v6, v2}, Landroid/app/NotificationChannel;->setBypassDnd(Z)V

    .line 213
    if-eqz v5, :cond_5

    invoke-virtual {v6, v5, v1}, Landroid/app/NotificationChannel;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    .line 214
    :cond_5
    invoke-virtual {p0, v6}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 215
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "recreated channel with bypassDnd: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    goto :goto_1

    .line 216
    :catchall_0
    move-exception p0

    .line 217
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "forceBypass "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 219
    :goto_1
    return-void
.end method

.method private static maybeRequestBatteryIgnore(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public static onWatchdog(Landroid/content/Context;)V
    .locals 3

    invoke-static {p0}, Lru/oneme/mvibedev/MvibeDevPrefs;->isBgKeepAliveEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 76
    :cond_0
    const-string v0, "MVibePush"

    if-nez p0, :cond_1

    return-void

    .line 77
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 78
    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    move-object p0, v1

    .line 79
    :goto_0
    const-wide/16 v1, 0x0

    sput-wide v1, Lru/oneme/mvibedev/MvibePushKeepAlive;->sLastBgAttemptMs:J

    .line 81
    :try_start_0
    invoke-static {p0}, Lru/oneme/mvibedev/MvibePushKeepAlive;->startBackgroundListen(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    goto :goto_1

    .line 82
    :catchall_0
    move-exception v1

    .line 83
    const-string v2, "watchdog start"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 86
    :goto_1
    :try_start_1
    invoke-static {p0}, Lru/oneme/mvibedev/MvibePushKeepAlive;->scheduleWatchdog(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 88
    goto :goto_2

    .line 87
    :catchall_1
    move-exception p0

    .line 89
    :goto_2
    const-string p0, "watchdog tick"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    return-void
.end method

.method private static scheduleWatchdog(Landroid/content/Context;)V
    .locals 6

    .line 106
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 107
    if-nez v0, :cond_0

    return-void

    .line 108
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "ru.oneme.mvibedev.PUSH_WATCHDOG"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 109
    const-string v2, "ru.oneme.mvibedev.MvibePushWatchdogReceiver"

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 110
    nop

    .line 111
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v2, v3, :cond_1

    const/high16 v2, 0xc000000

    goto :goto_0

    :cond_1
    const/high16 v2, 0x8000000

    .line 112
    :goto_0
    const v4, 0x4d5642

    invoke-static {p0, v4, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 113
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    const-wide/32 v4, 0x15f90

    add-long/2addr v1, v4

    .line 115
    const/4 v4, 0x2

    :try_start_0
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v3, :cond_2

    .line 116
    invoke-virtual {v0, v4, v1, v2, p0}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    goto :goto_1

    .line 118
    :cond_2
    invoke-virtual {v0, v4, v1, v2, p0}, Landroid/app/AlarmManager;->setExact(IJLandroid/app/PendingIntent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    :goto_1
    goto :goto_2

    .line 120
    :catchall_0
    move-exception v3

    .line 122
    :try_start_1
    invoke-virtual {v0, v4, v1, v2, p0}, Landroid/app/AlarmManager;->setAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 125
    goto :goto_2

    .line 123
    :catchall_1
    move-exception v3

    .line 124
    invoke-virtual {v0, v4, v1, v2, p0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 127
    :goto_2
    return-void
.end method

.method private static startBackgroundListen(Landroid/content/Context;)V
    .locals 8

    invoke-static {}, Lru/oneme/mvibedev/MvibeDevPrefs;->isBgKeepAliveEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "MVibePush"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 239
    sget-wide v3, Lru/oneme/mvibedev/MvibePushKeepAlive;->sLastBgAttemptMs:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x1388

    cmp-long v7, v3, v5

    if-gez v7, :cond_1

    return-void

    .line 240
    :cond_1
    sput-wide v1, Lru/oneme/mvibedev/MvibePushKeepAlive;->sLastBgAttemptMs:J

    .line 242
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 243
    const-string v2, "one.me.background.wake.BackgroundListenService"

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_2

    .line 245
    invoke-virtual {p0, v1}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 247
    :cond_2
    invoke-virtual {p0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 249
    :goto_0
    const-string v1, "BackgroundListenService start requested"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 252
    goto :goto_1

    .line 250
    :catchall_0
    move-exception v1

    .line 251
    const-string v2, "BackgroundListenService start failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 254
    :goto_1
    :try_start_1
    const-string v0, "uik"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 255
    const-string v1, "b"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 257
    goto :goto_2

    .line 256
    :catchall_1
    move-exception p0

    .line 258
    :goto_2
    return-void
.end method

.method private static widenMessagePolicy(Landroid/app/NotificationManager;)V
    .locals 15

    .line 153
    const-string v0, "MVibePush"

    :try_start_0
    invoke-virtual {p0}, Landroid/app/NotificationManager;->getNotificationPolicy()Landroid/app/NotificationManager$Policy;

    move-result-object v1

    .line 154
    if-nez v1, :cond_0

    return-void

    .line 155
    :cond_0
    iget v2, v1, Landroid/app/NotificationManager$Policy;->priorityCategories:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 156
    nop

    .line 157
    nop

    .line 158
    nop

    .line 160
    const/4 v3, 0x0

    :try_start_1
    const-class v4, Landroid/app/NotificationManager$Policy;

    const-string v5, "PRIORITY_CATEGORY_CONVERSATIONS"

    .line 161
    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 162
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 164
    goto :goto_0

    .line 163
    :catchall_0
    move-exception v4

    const/4 v4, 0x0

    .line 165
    :goto_0
    const/4 v5, 0x5

    or-int/2addr v4, v5

    .line 166
    and-int v6, v2, v4

    if-ne v6, v4, :cond_1

    return-void

    .line 167
    :cond_1
    or-int/2addr v2, v4

    .line 170
    :try_start_2
    const-class v4, Landroid/app/NotificationManager$Policy;

    new-array v6, v5, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v3

    const/4 v8, 0x1

    aput-object v7, v6, v8

    const/4 v9, 0x2

    aput-object v7, v6, v9

    const/4 v10, 0x3

    aput-object v7, v6, v10

    const/4 v11, 0x4

    aput-object v7, v6, v11

    .line 171
    invoke-virtual {v4, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 173
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget v7, v1, Landroid/app/NotificationManager$Policy;->priorityCallSenders:I

    .line 174
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget v12, v1, Landroid/app/NotificationManager$Policy;->priorityMessageSenders:I

    .line 175
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    iget v13, v1, Landroid/app/NotificationManager$Policy;->suppressedVisualEffects:I

    .line 176
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    iget v14, v1, Landroid/app/NotificationManager$Policy;->priorityConversationSenders:I

    .line 177
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v6, v5, v3

    aput-object v7, v5, v8

    aput-object v12, v5, v9

    aput-object v13, v5, v10

    aput-object v14, v5, v11

    .line 172
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager$Policy;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 184
    goto :goto_1

    .line 178
    :catchall_1
    move-exception v3

    .line 179
    :try_start_3
    new-instance v3, Landroid/app/NotificationManager$Policy;

    iget v4, v1, Landroid/app/NotificationManager$Policy;->priorityCallSenders:I

    iget v5, v1, Landroid/app/NotificationManager$Policy;->priorityMessageSenders:I

    iget v1, v1, Landroid/app/NotificationManager$Policy;->suppressedVisualEffects:I

    invoke-direct {v3, v2, v4, v5, v1}, Landroid/app/NotificationManager$Policy;-><init>(IIII)V

    .line 185
    :goto_1
    invoke-virtual {p0, v3}, Landroid/app/NotificationManager;->setNotificationPolicy(Landroid/app/NotificationManager$Policy;)V

    .line 186
    const-string p0, "widened DND policy for messages"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 189
    goto :goto_2

    .line 187
    :catchall_2
    move-exception p0

    .line 188
    const-string v1, "widenMessagePolicy"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 190
    :goto_2
    return-void
.end method
