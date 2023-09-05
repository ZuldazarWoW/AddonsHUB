--------------------------------------------------------------------------------------------------------
--                                            BTEX(Bottom TEXture)                                    --
--                                                V2.9.3 - 2010                                       --
--					                         from Tiggy on Ysondre-EU                                 --
--------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------
--                                              VARIABLES & MISC                                      --
--------------------------------------------------------------------------------------------------------
BTEX_VERSION = "2.9.3";

--------------------------------------------------------------------------------------------------------
--                                          Default 				                                  --
--------------------------------------------------------------------------------------------------------
-- Slash command
SLASHLOAD = " by Tiggy is loaded. |c00bfffffUse '/btex menu' for configuration options.|r";
SLASHBX = "- you can use /bx for shortcut to /btex.";
SLASHCONF = "- /btex menu : for config.";
SLASHRESET = "- /btex reset : for default.";
SLASHREMOVE = "- /btex remove : remove actual skin.";
SLASHCUSTOM = "- /btex custom : toggle custom config windows.";
SLASHVIEWPORT = "- /btex viewport : toggle viewport menu";
-- config menu
SKINCHOOSE = "Choose the skin :";
SETHEIGHT = "Set Height :";
HEIGHTDEFAULT = "(Default value is 256).";
SETALPHA = "Set Transparency :";
ALPHADEFAULT = "(Default value is 100%).";
SETWIDTH = "Set Width :";
WIDHTDEFAULT = "(Default value is 512).";
BTEXTUREPLACEX = "Position X :";
BTEXTUREPLACEY = "Y :";
BTEXSTRATA = "Layer :";
BTEXCOLOR = "Change colors";
-- Viewport
BTEXVIEWPORT = "Viewport";
VIEWPORTTXT1 = "Modify the 3D world game size area";
SETVIEWPORT = "Apply settings";
VIEWPORTRIGHT = "Right :";
VIEWPORTLEFT = "Left :";
VIEWPORTBOTTOM = "Bottom :";
VIEWPORTTOP = "Top :";
--button
BTNCLOSE = "Close";
BTNCANCEL = "Cancel";
APPLYSKIN = "Apply the skin";
DEFAULT = "Default";
-- custom frame
CUSTOMSETNAME = "Set Name :";
CUSTOMRULES1 = "Here is the rules for loading a custom texture :";
CUSTOMRULES2 = "1/ You need to have 4 TGA or BLP files (size 512x256 px). Make your own or download an artpack";
CUSTOMRULES3 = "2/ Copy them in the '/interface/addons/btex/skins'";
CUSTOMRULES4 = "3/ Files names MUST end with: '-1.tga','-2.tga','-3.tga','-4.tga'";
CUSTOMRULES5 = "For exemple for files: RoyalBar-1.tga, RoyalBar-2.tga, etc ... ";
CUSTOMRULES6 = "Set the EditBox here with the name of the file like 'RoyalBar' Without the end '-1.tga'";
-- Grid
BTEXBOXSTEP = "Box step :";
BTEXSHOWGRID = "Show Grid";

--------------------------------------------------------------------------------------------------------
--                                          frFR			                                  --
--------------------------------------------------------------------------------------------------------
if ( GetLocale() == "frFR" ) then
-- Slash command
SLASHLOAD = " par Tiggy est charg\195\169. |c00bfffffUtilisez '/btex menu' pour les options de configuration.|r";
SLASHBX = "- vous pouvez utiliser /bx comme raccourcis pour /btex.";
SLASHCONF = "- /btex menu : pour le menu de configuration.";
SLASHRESET = "- /btex reset : pour charger la configuration par d\195\169faut.";
SLASHREMOVE = "- /btex remove : retirer la skin actuelle.";
SLASHCUSTOM = "- /btex custom : lance la fen\195\170tre de chargement de skin custom.";
SLASHVIEWPORT = "- /btex viewport : lance le menu viewport";
-- config menu
SKINCHOOSE = "Choisissez l'apparence :";
SETHEIGHT = "Param\195\169trez la hauteur :";
HEIGHTDEFAULT = "(la valeur par d\195\169faut est 256).";
SETALPHA = "Param\195\169trez la transparence :";
ALPHADEFAULT = "(la valeur par d\195\169faut est 100%).";
SETWIDTH = "Param\195\169trez la largueur :";
WIDHTDEFAULT = "(la valeur par d\195\169faut est 512).";
BTEXTUREPLACEX = "Position X :";
BTEXTUREPLACEY = "Y :";
BTEXSTRATA = "Couche :";
BTEXCOLOR = "Changer couleurs";
-- Viewport
BTEXVIEWPORT = "Viewport";
VIEWPORTTXT1 = "Modifier la taille de la fenetre 3D du jeu";
SETVIEWPORT = "Appliquer";
VIEWPORTRIGHT = "Droite :";
VIEWPORTLEFT = "Gauche :";
VIEWPORTBOTTOM = "Bas :";
VIEWPORTTOP = "Haut :";
--boutons
BTNCLOSE = "Fermer";
BTNCANCEL = "Annuler";
APPLYSKIN = "Appliquer la skin";
DEFAULT = "Remise \195\160 Z\195\169ro";
-- custom frame
CUSTOMSETNAME = "Nom de la skin :";
CUSTOMRULES1 = "Veuillez suivre les r\195\169gles suivantes pour charger une skin externe :";
CUSTOMRULES2 = "1/ Vous devez posseder 4 fichiers images TGA ou BLP(size 512x256 px). Cr\195\169ez le votre ou t\195\169l\195\169charger en un";
CUSTOMRULES3 = "2/ Copiez les fichers dans '/interface/addons/btex/skins'";
CUSTOMRULES4 = "3/ Chaque fichier DOIT se terminer par: '-1.tga','-2.tga','-3.tga','-4.tga'";
CUSTOMRULES5 = "Par exemple pour les fichiers: RoyalBar-1.tga, RoyalBar-2.tga, etc ... ";
CUSTOMRULES6 = "Param\195\169trez le nom 'RoyalBar' sans le '-1.tga'";
-- Grid
BTEXBOXSTEP = "Interval :";
BTEXSHOWGRID = "Afficher Grille";
end
--------------------------------------------------------------------------------------------------------
--                                          Russian, thanks Troyen				                       --
--------------------------------------------------------------------------------------------------------
if (GetLocale() == "ruRU") then
-- Slash command
SLASHLOAD = "Тиггы активизировал addon.|c00bfffff использовать '/btex menu' для возможностей конфигурации|r";
SLASHBX = "- вы можете использовать /bx для сокращенного к /btex.";
SLASHCONF = "- /btex menu : для конфигурации.";
SLASHRESET = "- /btex reset : Перезагрузка.";
SLASHREMOVE = "- /btex remove : удалите actual skin.";
SLASHCUSTOM = "- /btex custom : переключите окна заказной конфигурации.";
SLASHVIEWPORT = "- /btex viewport : переключение просмотра меню";
-- config menu
SKINCHOOSE = "выбирать skin :";
SETHEIGHT = "выбирать высоту :";
HEIGHTDEFAULT = "(Ценность- 256).";
SETALPHA = "выбирать прозрачность :";
ALPHADEFAULT = "(Ценность -100%).";
SETWIDTH = "выбирать ширину:";
WIDHTDEFAULT = "(Ценность -512).";
BTEXTUREPLACEX = "Позиция X :";
BTEXTUREPLACEY = "Y :";
BTEXSTRATA = "Слой :";
BTEXCOLOR = "Изменение цвета";
-- Viewport
BTEXVIEWPORT = "Viewport";
VIEWPORTTXT1 = "Изменить 3D мир игры размер площади";
SETVIEWPORT = "Применитесь";
VIEWPORTRIGHT = "правый :";
VIEWPORTLEFT = "левый :";
VIEWPORTBOTTOM = "низко :";
VIEWPORTTOP = "верх :";
--button
BTNCLOSE = "закрыть";
BTNCANCEL = "Отмените";
APPLYSKIN = "Применитесь skin";
DEFAULT = "первоначальные параметры";
-- custom frame
CUSTOMSETNAME = "выбирать имя :";
CUSTOMRULES1 = "Вот правила для того, чтобы загрузить таможенную структуру";
CUSTOMRULES2 = "1/Вы должны иметь 4 TGA/BLP(размер 512x256 px).Сделайте свое собственное или загрузите artpack";
CUSTOMRULES3 = "2/Скопируйте их в '/interface/addons/btex/skins '";
CUSTOMRULES4 = "3/Названия файлов ДОЛЖНЫ закончиться:'-1.tga','-2.tga','-3.tga','-4.tga'";
CUSTOMRULES5 = "на премер для файлов : RoyalBar-1.tga, RoyalBar-2.tga,etc...";
CUSTOMRULES6 = "установите EditBox здесь с названием файла как 'RoyalBar' Без конца '-1.tga'";
-- Grid
BTEXBOXSTEP = "Box step :";
BTEXSHOWGRID = "Show Grid";
end
--------------------------------------------------------------------------------------------------------
--                                          German, Kuhglöckchen a.k.a. Blocki                        --
--------------------------------------------------------------------------------------------------------
if ( GetLocale() == "deDE" ) then
-- Slash command
SLASHLOAD = " von Tiggy ist geladen. |c00bfffffBenutze '/btex menu' fuer die Konfigurationsoptionen.|r";
SLASHBX = "- du kannst /bx als Abkuerzung fuer /btex benutzen.";
SLASHCONF = "- /btex menu : fuer die Konfiguration.";
SLASHRESET = "- /btex reset : fuer die Standardeinstellungen.";
SLASHREMOVE = "- /btex remove : um aktuellen Skin zu entfernen.";
SLASHCUSTOM = "- /btex custom : um selbstgemachte Skins zu aktivieren.";
SLASHVIEWPORT = "- /btex viewport : Viewport-Menü anzeigen";
-- config menu
SKINCHOOSE = "Waehle den Skin :";
SETHEIGHT = "Hoehe :";
HEIGHTDEFAULT = "(Standardwert ist 256).";
SETALPHA = "Transparenz :";
ALPHADEFAULT = "(Standardwert ist 100%).";
SETWIDTH = "Breite :";
WIDHTDEFAULT = "(Standardwert ist 512)."
BTEXTUREPLACEX = "Position X :";
BTEXTUREPLACEY = "Y :";
BTEXSTRATA = "Schicht :";
BTEXCOLOR = "Farben ändern";
-- Viewport
BTEXVIEWPORT = "Viewport";
VIEWPORTTXT1 = "Ändern Sie die 3D-Welt-Spiel Dimensionen";
SETVIEWPORT = "Benutze";
VIEWPORTRIGHT = "Rechts :";
VIEWPORTLEFT = "Verließ :";
VIEWPORTBOTTOM = "Boden :";
VIEWPORTTOP = "Hoch :";
--button
BTNCLOSE = "Schliessen";
BTNCANCEL = "Abbrechen";
APPLYSKIN = "Benutze den Skin";
DEFAULT = "Standard";
-- custom frame
CUSTOMSETNAME = "Setze Namen :";
CUSTOMRULES1 = "Hier sind die Regeln, um selbstgemachte Skins zu benutzen :";
CUSTOMRULES2 = "1/ Du brauchst 4 TGA/BLP Dateien. Erstellen deine eigenen oder downloade ein Artpack.";
CUSTOMRULES3 = "2/ Kopiere sie in '/interface/addons/btex/skins'";
CUSTOMRULES4 = "3/ Dateien muessen so enden: '-1.tga','-2.tga','-3.tga','-4.tga'";
CUSTOMRULES5 = "Zum Beispiel: RoyalBar-1.tga, RoyalBar-2.tga, etc ... ";
CUSTOMRULES6 = "Stelle in der EditBox fuer den Namen nur 'RoyalBar' ein. Ohne das Ende '-1.tga'";
-- Grid
BTEXBOXSTEP = "Box step :";
BTEXSHOWGRID = "Zeige Gitter";
end
--------------------------------------------------------------------------------------------------------
--                                          zhCN　by wowui.cn			                                  --
--------------------------------------------------------------------------------------------------------
if ( GetLocale() == "zhCN" ) then
-- Slash command
SLASHLOAD = " by Tiggy 已加载. |c00bfffff使用 '/btex menu' 进行设置.|r";
SLASHBX = "- 你可以使用 /bx 来代替 /btex.";
SLASHCONF = "- /btex menu : 设置.";
SLASHRESET = "- /btex reset : 设置为默认.";
SLASHREMOVE = "- /btex remove : 移除当前皮肤.";
SLASHCUSTOM = "- /btex custom : 开启自定义设置窗口.";
SLASHVIEWPORT = "- /btex viewport : 切换视图菜单";
-- config menu
SKINCHOOSE = "选择皮肤 :";
SETHEIGHT = "设置高度 :";
HEIGHTDEFAULT = "(默认值为 256).";
SETALPHA = "设置透明度 :";
ALPHADEFAULT = "(默认值为 100%).";
SETWIDTH = "设置宽度 :";
WIDHTDEFAULT = "(默认值为 512).";
BTEXTUREPLACEX = "立场 X :";
BTEXTUREPLACEY = "Y :";
BTEXSTRATA = "阶层 :";
BTEXCOLOR = "改变颜色";
-- Viewport
BTEXVIEWPORT = "Viewport";
VIEWPORTTXT1 = "修改3D世界游戏面积";
SETVIEWPORT = "应用设置";
VIEWPORTRIGHT = "右边 :";
VIEWPORTLEFT = "左边 :";
VIEWPORTBOTTOM = "低的 :";
VIEWPORTTOP = "顶端 :";
--button
BTNCLOSE = "关闭";
BTNCANCEL = "取消";
APPLYSKIN = "应用此皮肤";
DEFAULT = "默认";
-- custom frame
CUSTOMSETNAME = "设置名 :";
CUSTOMRULES1 = "加载自定义材质的说明 :";
CUSTOMRULES2 = "1/ 你必须有4个TGA/BLP文件(大小 512x256 像素). 你可以自己制作或者下载皮肤包";
CUSTOMRULES3 = "2/ 复制到目录 '/interface/addons/btex/skins'";
CUSTOMRULES4 = "3/ 文件名必须如下结尾: '-1.tga','-2.tga','-3.tga','-4.tga'";
CUSTOMRULES5 = "例如: RoyalBar-1.tga, RoyalBar-2.tga, 等 ... ";
CUSTOMRULES6 = "设置如下的设置名为 'RoyalBar' ，不要加上后缀 '-1.tga'";
-- Grid
BTEXBOXSTEP = "间距 :";
BTEXSHOWGRID = "显示网格";
end
--------------------------------------------------------------------------------------------------------
--                                          zhTW　by wowui.cn			                                  --
--------------------------------------------------------------------------------------------------------
if ( GetLocale() == "zhTW" ) then
-- Slash command
SLASHLOAD = " by Tiggy 已加載. |c00bfffff使用 '/btex menu' 進行設置.|r";
SLASHBX = "- 妳可以使用 /bx 來代替 /btex.";
SLASHCONF = "- /btex menu : 設置.";
SLASHRESET = "- /btex reset : 設置為默認.";
SLASHREMOVE = "- /btex remove : 移除當前皮膚.";
SLASHCUSTOM = "- /btex custom : 開啟自定義設置窗口.";
SLASHVIEWPORT = "- /btex viewport : 切換視圖菜單";
-- config menu
SKINCHOOSE = "選擇皮膚 :";
SETHEIGHT = "設置高度 :";
HEIGHTDEFAULT = "(默認值為 256).";
SETALPHA = "設置透明度 :";
ALPHADEFAULT = "(默認值為 100%).";
SETWIDTH = "設置寬度 :";
WIDHTDEFAULT = "(默認值為 512).";
BTEXTUREPLACEX = "立場 X :";
BTEXTUREPLACEY = "Y :";
BTEXSTRATA = "階層 :";
BTEXCOLOR = "改變顏色";
-- Viewport
BTEXVIEWPORT = "Viewport";
VIEWPORTTXT1 = "修改3D世界遊戲面積";
SETVIEWPORT = "應用設置";
VIEWPORTRIGHT = "右邊 :";
VIEWPORTLEFT = "左邊 :";
VIEWPORTBOTTOM = "低的 :";
VIEWPORTTOP = "頂端 :";
--button
BTNCLOSE = "關閉";
BTNCANCEL = "取消";
APPLYSKIN = "應用此皮膚";
DEFAULT = "默認";
-- custom frame
CUSTOMSETNAME = "設置名 :";
CUSTOMRULES1 = "加載自定義材質的說明 :";
CUSTOMRULES2 = "1/ 妳必須有4個TGA/BLP文件(大小 512x256 像素). 妳可以自己制作或者下載皮膚包";
CUSTOMRULES3 = "2/ 復制到目錄 '/interface/addons/btex/skins'";
CUSTOMRULES4 = "3/ 文件名必須如下結尾: '-1.tga','-2.tga','-3.tga','-4.tga'";
CUSTOMRULES5 = "例如: RoyalBar-1.tga, RoyalBar-2.tga, 等 ... ";
CUSTOMRULES6 = "設置如下的設置名為 'RoyalBar' ，不要加上後綴 '-1.tga'";
-- Grid
BTEXBOXSTEP = "間距 :";
BTEXSHOWGRID = "顯示網格";
end
