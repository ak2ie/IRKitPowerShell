﻿##################################################
#
# 家電をON, OFFする
#
# 第1引数： ON       : スイッチON
#           OFF      : スイッチOFF
#           LIGHT    : 照明ON
#           STEPUP   : 照明をだんだん明るくする
#           BLACKOUT : 照明を一番暗くする
#
##################################################
# ========== 定数 ==========
# ログ保存パス
$LOG_FILE = [System.Environment]::GetFolderPath("MyDocuments") + "\remocon.log"
# Googleカレンダー保存パス
$HOLIDAY_FILE_SAVE_PATH= [System.Environment]::GetFolderPath("MyDocuments") + "\holiday_list.ical"
# GoolgeカレンダーURL
$GOOLGE_CALENDAR_URI="https://calendar.google.com/calendar/ical/ja.japanese%23holiday%40group.v.calendar.google.com/public/basic.ics"
# ========== リモコン信号 ==========
# サーキュレーター電源
$CIRCULATOR_POWER = '{"format":"raw","freq":38,"data":[17421,8755,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,3228,1190,1002,1190,3228,1190,3228,1190,3228,1190,3228,1190,1002,1190,3228,1190,3228,1190,968,1190,968,1190,968,1190,968,1190,968,1190,968,1190,968,1190,968,1190,3228,1190,3228,1190,3228,1190,3228,1190,3228,1190,3228,1190,3228,1190,3228,1190,65535,0,14668,17421,4251,1190]}'
# サーキュレーター 強
$CIRCULATOR_HIGH  = '{"format":"raw","freq":38,"data":[17421,8755,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,3228,1190,1002,1190,3228,1190,3228,1190,3228,1190,3228,1190,1002,1190,3228,1190,3228,1190,968,1190,968,1190,968,1190,3228,1190,1002,1190,1002,1190,1002,1190,1002,1190,3228,1190,3228,1190,3228,1190,1002,1190,3228,1190,3228,1190,3228,1190,3228,1190,65535,0,14668,17421,4251,1190,65535,0,65535,0,58076,17421,4251,1190]}'
# サーキュレーター 中
$CIRCULATOR_MIDDLE = '{"format":"raw","freq":38,"data":[17421,8755,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,3228,1190,1002,1190,3228,1190,3228,1190,3228,1190,3228,1190,1002,1190,3228,1190,3228,1190,1002,1190,1002,1190,3228,1190,3228,1190,1002,1190,1002,1190,1002,1190,1002,1190,3228,1190,3228,1190,1002,1190,1002,1190,3228,1190,3228,1190,3228,1190,3228,1190,65535,0,14668,17421,4251,1190,65535,0,65535,0,58076,17421,4251,1190]}'
# サーキュレーター タイマー２時間
$CIRCULATOR_2H = '{"format":"raw","freq":38,"data":[17421,8755,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,1002,1190,3228,1190,1002,1190,3228,1190,3228,1190,3228,1190,3228,1190,1002,1190,3228,1190,3228,1190,1002,1190,3228,1190,3228,1190,3228,1190,1002,1190,1002,1190,1002,1190,1002,1190,3228,1190,1002,1190,1002,1190,1002,1190,3228,1190,3228,1190,3228,1190,3228,1190,65535,0,14668,17421,4251,1190,65535,0,65535,0,58076,17421,4251,1190,65535,0,65535,0,58076,17421,4251,1190,65535,0,65535,0,58076,17421,4251,1190]}'
# エアコン ON
$AIR_CONDITIONE_ON = '{"format":"raw","freq":38,"data":[6881,3341,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2451,904,2451,904,2451,904,787,968,787,968,2451,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,787,904,787,904,787,904,787,904,787,904,19315,6881,3341,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,2537,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,2537,904,787,904,787,904,787,904,2537,904,2537,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,2537,904,2537,904,2537,904,787,904,2537,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,787,904,2537,904,787,904,787,904,787,904,787,904,2537,904,2537,904,2537,904,2537,904,787,904,787,904,2537,904]}'
# エアコン OFF
$AIR_CONDITIONE_OFF = '{"format":"raw","freq":38,"data":[6881,3341,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,2537,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,787,904,787,904,787,904,787,904,787,904,19315,6881,3341,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,2537,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,787,904,787,904,787,904,2537,904,2537,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,2537,904,2537,904,2537,904,787,904,2537,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,787,904,2537,904,2537,904,787,904,2537,904,787,904,787,904,787,904,2537,904,787,904,2537,904,2537,904,2537,904,787,904,787,904,2537,904]}'
# エアコン 本体リセット
$AIR_CONDITIONE_RESET = '{"format":"raw","freq":38,"data":[6881,3341,904,815,904,2537,904,815,815,815,904,815,904,815,904,815,904,815,904,815,904,815,904,815,815,815,815,815,904,2537,904,815,904,815,904,815,904,815,904,815,904,815,904,815,904,2537,904,2537,904,2537,904,815,815,815,904,2537,904,815,815,815,904,815,904,815,904,815,904,815,904,815,815,815,815,815,904,815,815,815,904,815,904,815,904,815,815,815,904,815,815,815,904,815,904,815,904,815,904,815,815,815,904,815,904,815,904,815,904,815,815,815,815,815,904,815,815,815,904,2537,904,2537,904,815,815,815,815,815,904,815,904,815,904,19315,6881,3341,904,815,904,2537,904,815,904,815,904,815,904,815,815,815,904,815,815,815,904,815,904,815,815,815,904,815,815,2537,904,815,904,815,904,815,904,815,904,815,904,815,904,815,904,2537,904,2537,904,2537,904,815,815,815,815,2537,904,815,904,815,904,815,904,815,904,815,904,815,904,815,904,815,904,815,904,815,904,815,904,815,904,2537,904,2537,904,815,904,2537,904,2537,904,2537,904,815,815,815,815,2537,904,815,904,2537,904,815,904,815,904,2537,904,2537,904,815,815,815,815,2537,904,815,904,2537,904,815,815,2537,904,815,904,2537,904,815,815]}'
# 照明 ON
$LIGHT_ON ='{"format":"raw","freq":38,"data":[6881,3341,904,815,904,815,904,2537,904,2537,904,815,904,2537,904,815,904,815,904,815,904,2537,904,815,904,815,904,2537,904,815,904,2537,904,815,904,2537,904,815,904,815,904,2537,904,2537,904,2537,904,815,904,815,904,815,904,2537,904,815,904,2537,904,815,904,815,904,815,904,2537,904,2537,904,2537,904,815,904,815,904,2537,904,2537,904,815,904,2537,904,65535,0,65535,0,27246,6881,3341,904,815,904,815,904,2537,904,2537,904,815,904,2537,904,815,904,815,904,815,904,2537,904,815,904,815,904,2537,904,815,904,2537,904,815,904,2537,904,815,904,815,904,2537,904,2537,904,2537,904,815,904,815,904,815,904,2537,904,815,904,2537,904,815,904,815,904,815,904,2537,904,2537,904,2537,904,815,904,815,904,2537,904,2537,904,815,904,2537,904]}'
# 照明（全灯） ON
$LIGHT_ZENTO_ON ='{"format":"raw","freq":38,"data":[6648,3458,787,935,787,935,787,2626,787,2626,787,935,787,2626,787,935,787,935,787,935,787,2626,787,935,787,935,787,2626,787,935,787,2626,787,935,787,2626,787,935,787,935,787,2626,787,935,787,935,787,935,787,935,787,935,787,935,787,2626,787,2626,787,935,787,2626,787,935,787,935,787,2626,787,935,787,2626,787,935,787,935,787,2626,787,935,787,935,787,65535,0,65535,0,27246,6648,3458,787,935,787,935,787,2626,787,2626,787,935,787,2626,787,935,787,935,787,935,787,2626,787,935,787,935,787,2626,787,935,787,2626,787,935,787,2626,787,935,787,935,787,2626,787,935,787,935,787,935,787,935,787,935,787,935,787,2626,787,2626,787,935,787,2626,787,935,787,935,787,2626,787,935,787,2626,787,935,787,935,787,2626,787,935,787,935,787]}'
# 照明 OFF
$LIGHT_OFF = '{"format":"raw","freq":38,"data":[6881,3341,904,815,904,815,904,2451,904,2451,904,815,904,2537,904,815,904,815,904,815,904,2537,904,815,904,815,904,2537,904,815,904,2537,904,815,904,2537,904,815,904,815,904,2537,968,761,904,761,904,761,904,761,904,2537,904,2537,904,2537,904,2537,904,815,904,2537,904,815,904,815,904,815,904,2537,904,2537,904,815,904,815,904,2537,904,815,904,815,904,65535,0,65535,0,27246,6881,3341,904,815,904,815,904,2537,904,2537,904,761,904,2537,904,815,904,815,904,815,904,2537,904,815,904,815,904,2537,904,815,935,2451,904,815,904,2537,904,815,904,815,904,2537,904,815,935,815,935,815,935,815,935,2537,904,2537,904,2537,904,2537,904,815,904,2537,904,815,904,815,904,815,904,2537,904,2537,904,815,904,815,904,2537,904,815,904,815,904,65535,0,65535,0,27246,6881,3341,904,815,904,815,904,2537,904,2537,904,815,904,2537,904,815,904,815,904,815,904,2537,904,815,904,815,904,2537,904,815,904,2537,904,815,904,2537,904,815,904,815,904,2537,904,815,904,815,904,815,904,815,904,2537,904,2537,904,2537,904,2537,904,815,904,2537,904,815,904,815,904,815,904,2537,904,2537,904,815,904,815,904,2537,904,815,904,815,904]}'
# 照明 明るく
$LIGHT_UP = '{"format":"raw","freq":38,"data":[6648,3458,815,935,815,935,815,2626,815,2626,815,904,761,2626,873,873,761,935,761,935,761,2626,761,935,761,935,761,2626,787,935,815,2626,787,935,761,2626,787,935,761,935,761,2626,873,873,873,873,873,873,873,873,761,935,761,2537,873,873,761,2626,761,935,761,2626,815,904,815,904,815,2626,761,2626,761,904,761,904,761,904,761,2626,787,935,761,935,761,65535,0,65535,0,27246,6881,3579,815,904,815,904,904,2626,787,2626,787,935,815,2626,787,935,815,935,815,935,815,2626,815,904,815,904,815,2537,815,935,815,2626,787,935,815,2626,761,935,815,815,935,2626,815,815,815,935,815,935,815,935,815,935,935,2537,815,935,815,2626,815,815,815,2626,815,935,787,935,787,2626,761,2626,761,935,761,935,761,935,761,2626,761,935,761,935,761]}'
# 照明 暗く
$LIGHT_DOWN = '{"format":"raw","freq":38,"data":[6648,3579,815,904,815,904,815,2626,815,2626,815,1002,815,2626,815,904,815,904,815,904,815,2626,815,904,761,904,761,2626,761,935,815,2626,787,935,761,2626,761,935,761,935,761,2537,815,935,815,935,815,935,815,935,815,2626,815,2626,815,935,761,2626,761,935,815,2626,815,815,815,815,815,935,815,2626,815,904,815,904,815,904,815,2626,873,873,787,935,787,65535,0,65535,0,27246,6648,3458,787,935,761,935,761,2626,815,2626,815,935,761,2626,761,935,761,935,761,935,761,2626,787,935,815,935,815,2626,815,904,761,2626,815,904,761,2626,787,935,787,935,787,2626,787,935,787,935,787,935,787,935,787,2626,761,2626,761,935,815,2626,761,935,815,2626,815,904,761,904,761,904,761,2626,761,935,815,935,815,935,815,2626,761,935,761,935,761]}'
# ========== ON, OFF信号 ==========
# ONにするもの
#   順番に注意。サーキュレーターは電源ONしてから風量調節すること
$ON_SIGNALS  = [ordered]@{"エアコンON"=$AIR_CONDITIONE_ON; "サーキュレーターON"=$CIRCULATOR_POWER; "サーキュレーター中"=$CIRCULATOR_MIDDLE; "サーキュレータータイマー（２時間）"=$CIRCULATOR_2H;}

# OFFにするもの
#   サーキュレーターはON, OFFの区別はないため送信しないこと
$OFF_SIGNALS = [ordered]@{"エアコン"=$AIR_CONDITIONE_OFF; "照明OFF"=$LIGHT_OFF}

# 照明に関するもの
$LIGHT_SIGNALS = [ordered]@{"照明ON（全灯）"=$LIGHT_ZENTO_ON;}
# 明るさは20段階で調節できるため、最小の明るさにする
$LIGHT_BLACKOUT = [ordered]@{"照明暗く1"=$LIGHT_DOWN;"照明暗く2"=$LIGHT_DOWN;"照明暗く3"=$LIGHT_DOWN;"照明暗く4"=$LIGHT_DOWN;"照明暗く5"=$LIGHT_DOWN;"照明暗く6"=$LIGHT_DOWN;"照明暗く7"=$LIGHT_DOWN;"照明暗く8"=$LIGHT_DOWN;"照明暗く9"=$LIGHT_DOWN;"照明暗く10"=$LIGHT_DOWN;"照明暗く11"=$LIGHT_DOWN;"照明暗く12"=$LIGHT_DOWN;"照明暗く13"=$LIGHT_DOWN;"照明暗く14"=$LIGHT_DOWN;"照明暗く15"=$LIGHT_DOWN;"照明暗く16"=$LIGHT_DOWN;"照明暗く17"=$LIGHT_DOWN;"照明暗く18"=$LIGHT_DOWN;"照明暗く19"=$LIGHT_DOWN;"照明暗く20"=$LIGHT_DOWN;}
# 最小の暗さから明るくする
$LIGHT_STEPUP = [ordered]@{"照明明るく1"=$LIGHT_UP;"照明明るく2"=$LIGHT_UP;"照明明るく3"=$LIGHT_UP;"照明明るく4"=$LIGHT_UP;"照明明るく5"=$LIGHT_UP;"照明明るく6"=$LIGHT_UP;"照明明るく7"=$LIGHT_UP;"照明明るく8"=$LIGHT_UP;"照明明るく9"=$LIGHT_UP;"照明明るく10"=$LIGHT_UP;"照明明るく11"=$LIGHT_UP;"照明明るく12"=$LIGHT_UP;"照明明るく13"=$LIGHT_UP;"照明明るく14"=$LIGHT_UP;"照明明るく15"=$LIGHT_UP;"照明明るく16"=$LIGHT_UP;"照明明るく17"=$LIGHT_UP;"照明明るく18"=$LIGHT_UP;"照明明るく19"=$LIGHT_UP;"照明明るく20"=$LIGHT_UP;}
# ========== 変数宣言 ==========
$SIGNAL_SEND_INTERVAL = 5;
# ========== 関数 ==========
### ログ出力 ###
#      引数：ログ出力文字列（配列も可）
#      出力：[YYYY:MM:DD hh:mm:ss] "引数"
function log() {
    if (Test-Path Variable:Script:contents) { Clear-Variable contents }

    # ログ出力日時
    $log_date += Get-Date -Format "[ yyyy/MM/dd HH:mm:ss ]"
        
    # 引数が複数あった場合は、空白で区切って表示
    $separator = ""
    foreach ($content in $args) {
        $contents += $content + $separator
        $separator=" "
    }

    $log_date + " " + $contents | Out-File -Append $LOG_FILE
}

### IRKit IPアドレス取得 ###
#      引数：なし
#      返却値：IRKitのIPアドレス（取得できなかった場合は空文字列）
function get_irkit_ip() {
    # コマンド実行後待ち秒数
    #  （dns-sdコマンドはkillしないと終了しない）
    $TIMEOUT_SEC=3
    # コマンド実行結果出力ファイル
    $temp_file=[System.Environment]::GetFolderPath("MyDocuments") + "\tmp_dns-sd.log"
    # 前回取得IPアドレス保存ファイル
    $previous_ip_file=[System.Environment]::GetFolderPath("MyDocuments") + "\tmp_previous_ip.log"
    # 正規表現パターン（IPアドレス)
    $pattern_ip=[regex]"[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

    # 初期化
    if (Test-Path Variable:Script:job_get_instance) { Clear-Variable job_get_instance }
    if (Test-Path Variable:Script:job_get_ip) { Clear-Variable job_get_ip }
    if (Test-Path Variable:Script:instance_name) { Clear-Variable instance_name }
    if (Test-Path Variable:Script:host_name) { Clear-Variable host_name }
    if (Test-Path Variable:Script:stream) { Clear-Variable stream }

    # 前回実行結果を削除
    if (Test-Path $temp_file) {
        rm $temp_file
    }

    # 前回のIPアドレスを取得
    if (Test-Path $previous_ip_file) {
        try {
            $stream=New-Object System.IO.StreamReader($previous_ip_file, [System.Text.Encoding]::GetEncoding("utf-8"))
        
            # 前回取得日時
            $ip_get_time=$stream.ReadLine()
            $ip_get_time=Get-Date $ip_get_time

            # 前回取得日時を取得できた場合
            if ($ip_get_time -is [System.DateTime]) {
                # IPアドレス有効時間
                $IP_VALID_HOUR=24
                $now = Get-Date
                # 前回取得時からの経過時間
                $ip_get_span=New-TimeSpan $ip_get_time $now

                # 一定時間内であれば、前回取得時の値を返す
                # 単に"Hours"とすると、”1日と1時間前”といった場合に正常に処理されない
                if ($ip_get_span.TotalHours -lt $IP_VALID_HOUR) {
                    $ip = $stream.ReadLine()

                    if ($ip -match $pattern_ip) {
                        return $ip
                    }
                }
            }
        } finally {
            $stream.close()
        }
    }

    # インスタンス名（IRKitの名前 irkit***）を取得
    #   $"using:"temp_file と書いているのは、そのままではjobに引数を渡せないため
    $job_get_instance=Start-Job{dns-sd -B _irkit._tcp | Out-File $using:temp_file -Encoding utf8}

    sleep $TIMEOUT_SEC

    $job_get_instance | Remove-Job -Force

    # コマンドの実行結果を取得できなかった場合は終了
    if (!(Test-Path $temp_file)) {
        return
    }

    # コマンドの実行結果からインスタンス名を取得
    $instance_name=Select-String "irkit[^\.]+" $temp_file | % {$_.Matches.value}

    # インスタンス名を取得できなかった場合は終了
    if ([String]::IsNullOrEmpty($instance_name)) {
        return
    }

    # ホスト名
    $host_name=$instance_name + ".local"

    # IPアドレスを取得
    $job_get_ip=Start-Job{dns-sd -G v4 $using:host_name | Out-File $using:temp_file -Encoding utf8}

    sleep $TIMEOUT_SEC

    $job_get_ip | Remove-Job -Force

    # IRKitのIPアドレス
    $irkit_ip=Select-String $pattern_ip $temp_file | % {$_.Matches.value}

    # 取得したIPアドレスを保存
    # Get-Dateでフォーマットを指定しているのは、余分な改行を出力させないため
    Get-Date -Format "yyyy/MM/dd HH:mm:ss" | Out-File $previous_ip_file -Encoding utf8
    $irkit_ip | Out-File $previous_ip_file  -Encoding utf8 -Append

    return $irkit_ip
}



# ========== メイン処理 ==========
log "========== 処理スタート =========="
log "引数:" $args[0]

if ($args[0] -eq "ON") {
    # エアコンは本体リセットをしてからでないと、吹き出し口が開かない...
    .\winter_asa_danbo.ps1 "AIR_CON_RESET"
    # 機器をON
    $SIGNALS = $ON_SIGNALS
} elseif ($args[0] -eq "AIR_CON_RESET") {
    # エアコンリセット
    $SIGNALS = [ordered]@{"エアコン リセット"=$AIR_CONDITIONE_RESET;}
    $SIGNAL_SEND_INTERVAL = 60
} elseif ($args[0] -eq "OFF") {
    # 今日の日付に関する値を取得
    $today_yyyymmdd=(Get-Date).ToString("yyyyMMdd")
    $today_yobi=(Get-Date).ToString("ddd")
    $year=(Get-Date).ToString("yyyy")

    try {
        # Googleカレンダーの祝日カレンダーを取得
        Invoke-WebRequest -Uri $GOOLGE_CALENDAR_URI -OutFile $HOLIDAY_FILE_SAVE_PATH -ErrorAction Stop
    } catch {
        log "祝日カレンダーの取得に失敗しました。以前取得したカレンダーを使用します。"
    }
    
    # 祝日は下記のように書かれているたため、日付のみを抽出する
    # DTSTART;VALUE=DATE:<祝日日付：YYYYMMDD形式>
    $holidays = Select-String -Pattern "DTSTART;VALUE=DATE:($year.*)" -Path $HOLIDAY_FILE_SAVE_PATH | % { $g = $_.Matches.Groups; $g.Groups[1].Value }

    # 土、日、祝日であればOFFにしない
    if( $today_yobi -eq "日" -or $today_yobi -eq "土" -or $holidays -ccontains $today_yyyymmdd) {
        $SIGNALS = @();
        log "休日のため実行しません"
    } else {
        $SIGNALS = $OFF_SIGNALS
    }
} elseif ($args[0] -eq "LIGHT") {
    $SIGNALS = $LIGHT_SIGNALS
} elseif ($args[0] -eq "STEPUP") {
    .\winter_asa_danbo.ps1 "LIGHT"
    .\winter_asa_danbo.ps1 "BLACKOUT"
    $SIGNALS = $LIGHT_STEPUP
    $SIGNAL_SEND_INTERVAL = 60
} elseif ($args[0] -eq "BLACKOUT") {
    $SIGNALS = $LIGHT_BLACKOUT
    $SIGNAL_SEND_INTERVAL = 0.5
} else {
    log "引数が不正です" $args[0]
    exit 1
}

foreach ($key in $SIGNALS.Keys) {
    log $key " 実行"

    # IRKitのIPアドレスを取得
    $irkit_ip=get_irkit_ip

    if (-not [string]::IsNullOrEmpty($irkit_ip)) {
        $uri="http://" + $irkit_ip + "/messages"
        Invoke-RestMethod -Uri $uri -Method Post -Headers @{"X-Requested-With"="curl"} -Body $SIGNALS[$key]
        Start-Sleep -s $SIGNAL_SEND_INTERVAL
    } else {
        log "IRKitのIPアドレスを取得できませんでした"
    }
}

log "終了"